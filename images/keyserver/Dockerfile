FROM denoland/deno:alpine@sha256:437386888b8b5168e5b51a118e06d663c64a274ce1928ebce8c8079cd8a3b303

LABEL authors="Jared Davis <jared.davis@pelo.tech>"

WORKDIR /keyserver

COPY deno.json deno.json
COPY deno.lock deno.lock
COPY main.ts main.ts

RUN deno install --entrypoint main.ts

CMD [ "deno", "run", "--allow-net", "--allow-env", "--allow-read", "--allow-write", "main.ts" ]
