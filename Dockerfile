FROM nodered/node-red-docker:slim

USER root

RUN apk update && \
    apk add --no-cache --virtual .build-deps git python make && \
    npm i node-red/node-red-dashboard node-red-contrib-dashboard-bar-chart-data node-red-contrib-ui-level @clysema/node-red-contrib-ui-week-schedule node-red-contrib-heater-controller node-red-contrib-mdashboard node-red-contrib-dashboard-sum-bars node-red-node-weather-underground node-red-node-google node-red-node-openweathermap node-red-node-suncalc node-red-node-timeswitch node-red-node-email node-red-node-base64 node-red-node-snmp node-red-node-smooth node-red-node-rbe node-red-node-daemon && \
    apk del .build-deps && \
    rm -rf /var/apk
