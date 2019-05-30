FROM nodered/node-red-docker:slim

USER root

RUN apk update && \
    apk add --no-cache --virtual .build-deps git python && \
    npm i node-red/node-red-dashboard && \
    apk del .build-deps && \
    rm -rf /var/apk