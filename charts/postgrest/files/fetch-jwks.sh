#!/bin/sh
# Fetch a JWKS to disk for PostgREST, which takes jwt-secret as a literal or an @file only.
#
#   once (default)  fetch and exit. 0 if a usable key set ends up on disk, 1 otherwise.
#   refresh         then re-check every JWKS_REFRESH_INTERVAL seconds. Failures are not fatal.
#
# Responses are validated in a temp file and renamed into place, so a bad fetch never
# replaces working keys.
set -eu

MODE="${1:-once}"
case "${MODE}" in
  once | refresh) ;;
  *) echo "jwks :: unknown role '${MODE}', expected 'once' or 'refresh'" >&2; exit 2 ;;
esac

URL="${JWKS_URL:?JWKS_URL is required}"
TARGET="${JWKS_TARGET:-/etc/opt/postgrest/certificates/jwks.json}"
TIMEOUT="${JWKS_TIMEOUT:-10}"
RETRY_INTERVAL="${JWKS_RETRY_INTERVAL:-3}"
MAX_ATTEMPTS="${JWKS_MAX_ATTEMPTS:-40}"
REFRESH_INTERVAL="${JWKS_REFRESH_INTERVAL:-0}"
RELOAD_SIGNAL="${JWKS_RELOAD_SIGNAL:-}"
RELOAD_PROCESS="${JWKS_RELOAD_PROCESS:-postgrest}"
REQUIRE_KTY="${JWKS_REQUIRE_KTY:-}"
REQUIRE_USE="${JWKS_REQUIRE_USE:-}"
REQUIRE_KID="${JWKS_REQUIRE_KID:-}"

TMP="${TARGET}.tmp"

log() { echo "jwks :: $*"; }
err() { echo "jwks :: $*" >&2; }

# Tests each key on its own. A document can carry the required kty, use and kid across
# different keys and satisfy a naive substring check without holding a usable key.
valid_jwks() {
  [ -s "$1" ] || return 1
  JWKS_REQUIRE_KTY="${REQUIRE_KTY}" JWKS_REQUIRE_USE="${REQUIRE_USE}" \
  JWKS_REQUIRE_KID="${REQUIRE_KID}" awk '
    BEGIN {
      want_kty = ENVIRON["JWKS_REQUIRE_KTY"]
      want_use = ENVIRON["JWKS_REQUIRE_USE"]
      want_kid = ENVIRON["JWKS_REQUIRE_KID"]
    }
    { doc = doc $0 }
    END {
      gsub(/[ \t\r\n]/, "", doc)
      if (doc !~ /^\{/ || doc !~ /\}$/) exit 1
      if (doc !~ /"keys":\[/) exit 1

      n = split(doc, key, /\},?\{/)
      for (i = 1; i <= n; i++) {
        if (key[i] !~ /"kty":"[^"]+"/) continue
        if (want_kty != "" && key[i] !~ "\"kty\":\"" want_kty "\"") continue
        if (want_use != "" && key[i] !~ "\"use\":\"" want_use "\"") continue
        if (want_kid != "" && key[i] !~ /"kid":"[^"]+"/) continue
        exit 0
      }
      exit 1
    }
  ' "$1"
}

# Whitespace goes first: a pretty-printed document writes "kid": "x", not "kid":"x".
key_ids() {
  tr -d '[:space:]' < "$1" \
    | grep -o '"kid":"[^"]*"' \
    | cut -d'"' -f4 \
    | sort \
    | paste -sd, - \
    | sed 's/,/, /g'
}

# Key ids rather than bytes. Some providers reorder the keys per request, which would look
# like a rotation every refresh and flush PostgREST's JWT cache for nothing.
fingerprint() {
  ids=$(key_ids "$1")
  if [ -n "${ids}" ]; then
    echo "${ids}"
  else
    cat "$1"
  fi
}

# SIGUSR2 makes PostgREST re-read the @file jwt-secret. Needs a matching uid: a non-root
# sender has no effective CAP_KILL.
reload() {
  [ "${MODE}" = refresh ] || return 0
  [ -n "${RELOAD_SIGNAL}" ] || return 0

  pid=$(pgrep -x "${RELOAD_PROCESS}" | head -1)
  if [ -n "${pid}" ] && kill -"${RELOAD_SIGNAL}" "${pid}" 2>/dev/null; then
    log "signalled ${RELOAD_PROCESS} (pid ${pid}) with SIG${RELOAD_SIGNAL}"
  else
    err "could not signal ${RELOAD_PROCESS}: not running, or not permitted"
  fi
}

fetch_once() {
  attempt=1
  while [ "${attempt}" -le "${MAX_ATTEMPTS}" ]; do
    if curl --fail --silent --show-error --location --max-time "${TIMEOUT}" \
         --output "${TMP}" "${URL}" && valid_jwks "${TMP}"; then
      if [ -s "${TARGET}" ] && [ "$(fingerprint "${TMP}")" = "$(fingerprint "${TARGET}")" ]; then
        rm -f "${TMP}"
        log "unchanged"
      else
        mv -f "${TMP}" "${TARGET}"
        ids=$(key_ids "${TARGET}")
        log "wrote ${TARGET} from ${URL}${ids:+ (key ids: ${ids})}"
        reload
      fi
      return 0
    fi

    rm -f "${TMP}"
    err "no usable jwks from ${URL} (attempt ${attempt}/${MAX_ATTEMPTS})"
    attempt=$((attempt + 1))
    [ "${attempt}" -le "${MAX_ATTEMPTS}" ] && sleep "${RETRY_INTERVAL}"
  done

  if valid_jwks "${TARGET}"; then
    err "giving up on the fetch, keeping the jwks already at ${TARGET}"
    return 0
  fi

  err "no usable jwks fetched and none on disk at ${TARGET}"
  return 1
}

fetch_once || exit 1

[ "${MODE}" = refresh ] || exit 0

log "refreshing every ${REFRESH_INTERVAL}s"
while true; do
  sleep "${REFRESH_INTERVAL}"
  fetch_once || true
done
