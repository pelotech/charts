FROM golang:1.27-alpine@sha256:fa3d596898d9f126af7c01d14ee7597bab3f39cccf392ef36b69fe77cd681f18 AS builder

LABEL authors="Jared Davis <jared.davis@pelo.tech>"

RUN addgroup --system goose --gid 10001 && \
    adduser --system -G goose goose

WORKDIR /github.com/pressly

RUN apk add git

RUN git clone -b v3.26.0 https://github.com/pressly/goose

WORKDIR /github.com/pressly/goose

RUN go mod tidy && go build -ldflags="-s -w" -tags='no_sqlite no_sqlite3 no_clickhouse no_mssql no_mysql no_vertica no_ydb' -o /bin/goose ./cmd/goose


FROM scratch

COPY --from=builder /etc/group  /etc/group
COPY --from=builder /etc/passwd /etc/passwd

USER goose

COPY --chown=goose:goose --from=builder /bin/goose /bin/goose

# https://pressly.github.io/goose/documentation/environment-variables/
ENV GOOSE_DBSTRING="user=postgres dbname=postgres sslmode=disable"

ENTRYPOINT [ "/bin/goose", "postgres" ]

CMD [ "status" ]
