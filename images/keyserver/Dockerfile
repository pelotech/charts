FROM denoland/deno:alpine@sha256:aa665f8777136863b5b8a0445a5cdfccff8103b5f40c9a877de5276b04facb1e

LABEL authors="Jared Davis <jared.davis@pelo.tech>"

WORKDIR /keyserver

COPY deno.json deno.json
COPY deno.lock deno.lock
COPY main.ts main.ts

RUN deno install --entrypoint main.ts

CMD [ "deno", "run", "--allow-net", "--allow-env", "--allow-read", "--allow-write", "main.ts" ]
