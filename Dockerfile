ARG BUILD_FROM
FROM node

ENV LANG C.UTF-8
ENV VERSION=$VERSION
ENV BUILD_DATE=$BUILD_DATE

RUN mkdir -p /assistant_relay/bin \
&& touch /assistant_relay/bin/config.json \
&& npm i pm2 -g

WORKDIR /assistant_relay

RUN apt-get update \
    && apt-get install -y apt-transport-https \
        git \
        python3-pip \
    && pip3 install catt \
    && wget https://github.com/greghesp/assistant-relay/releases/download/v3.3.1b/release.zip \
    && unzip release.zip \
    && rm release.zip \
    && npm i

WORKDIR /
RUN wget https://github.com/mossyhub/Assistant-Relay-Docker/blob/beta/run.sh
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
