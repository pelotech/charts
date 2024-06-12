FROM node:14-alpine as builder

RUN apk add --no-cache libc6-compat git

WORKDIR /app

ARG VERSION=main
RUN git clone -b ${VERSION} https://github.com/calendso/calendso
RUN cd calendso && \
    yarn --frozen-lockfile && \
    yarn build && \
    yarn install --production --ignore-scripts --prefer-offline


FROM node:14-alpine as runner

WORKDIR /app

ENV NODE_ENV production

COPY --from=builder --chown=1000 /app/calendso/next.config.js ./
COPY --from=builder --chown=1000 /app/calendso/public ./public
COPY --from=builder --chown=1000 /app/calendso/.next ./.next
COPY --from=builder --chown=1000 /app/calendso/node_modules ./node_modules
COPY --from=builder --chown=1000 /app/calendso/package.json ./package.json
COPY --from=builder --chown=1000 /app/calendso/prisma ./prisma

CMD ["yarn", "start"]
