FROM denoland/deno:alpine@sha256:8ce780168429c4bf5962652e6cbea3fd45254ae902069e90585fb33f74c56968

LABEL authors="Jared Davis <jared.davis@pelo.tech>"

WORKDIR /keyserver

COPY deno.json deno.json
COPY deno.lock deno.lock
COPY main.ts main.ts

RUN deno install --entrypoint main.ts

CMD [ "deno", "run", "--allow-net", "--allow-env", "--allow-read", "--allow-write", "main.ts" ]
