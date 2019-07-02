FROM nodered/node-red-docker:slim

USER root

RUN apk update && \
    apk add --no-cache --virtual .build-deps git python make && \
    npm install -g npm && \
    npm i request-promise \ 
        node-red-contrib-redis \
        node-red/node-red-dashboard \
        node-red-contrib-dashboard-bar-chart-data \
        node-red-contrib-ui-level \
        @clysema/node-red-contrib-ui-week-schedule \
        node-red-contrib-heater-controller \
        node-red-contrib-dashboard-sum-bars \
        node-red-node-weather-underground \
        node-red-node-openweathermap \
        node-red-node-suncalc \
        node-red-node-timeswitch \
        node-red-node-email \
        node-red-node-base64 \
        node-red-node-google \
        node-red-contrib-viseo-google-spreadsheet \
        node-red-node-smooth \
        node-red-node-rbe \
        node-red-node-daemon \
        node-red-contrib-mqtt-json \
        node-red-contrib-eztimer \
        node-red-contrib-viseo-loop \
        node-red-contrib-signal-interval \
        node-red-contrib-map \
        node-red-contrib-influxdb \
        node-red-contrib-mongodb3 && \
    rm -rf node_modules/@node-red/nodes/core/hardware/* && \
    rm -rf node_modules/@node-red/nodes/core/io/31* && \
    rm -rf node_modules/@node-red/nodes/core/io/32* && \
    apk del .build-deps && \
    rm -rf /var/apk

#USER node-red

COPY settings.js /data/settings.js
