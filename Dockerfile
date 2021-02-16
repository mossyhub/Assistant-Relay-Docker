ARG BUILD_FROM
FROM node:alpine

ENV LANG C.UTF-8
ENV VERSION=$VERSION
ENV BUILD_DATE=$BUILD_DATE

RUN mkdir -p /assistant_relay/bin \
&& touch /assistant_relay/bin/config.json \
&& apk add --no-cache python3 py3-pip \
&& pip3 install catt \
&& rm -rf /root/.cache/pip \
&& npm i pm2 -g

WORKDIR /assistant_relay

RUN wget https://github.com/greghesp/assistant-relay/releases/download/v3.3.2b/release.zip \
&& unzip release.zip \
&& rm release.zip \
&& npm i

WORKDIR /
RUN wget https://github.com/mossyhub/Assistant-Relay-Docker/blob/master/run.sh
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
