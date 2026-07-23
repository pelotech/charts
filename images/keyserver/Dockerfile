FROM denoland/deno:alpine@sha256:13851184d6705150b8b230c5377f26c3bd182865d28700bb72bc0b2c271b504a

LABEL authors="Jared Davis <jared.davis@pelo.tech>"

WORKDIR /keyserver

COPY deno.json deno.json
COPY deno.lock deno.lock
COPY main.ts main.ts

RUN deno install --entrypoint main.ts

CMD [ "deno", "run", "--allow-net", "--allow-env", "--allow-read", "--allow-write", "main.ts" ]
