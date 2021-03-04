ARG ARCH=
ARG BUILD_FROM
FROM ${ARCH}node:lts-alpine

ENV LANG C.UTF-8

RUN apk add python3 \
&& pip3 install catt

RUN mkdir /assistant_relay \
&& npm i pm2 -g

WORKDIR /assistant_relay

RUN wget https://github.com/greghesp/assistant-relay/releases/download/v3.3.2b/release.zip \
&& unzip release.zip \
&& rm release.zip \
&& npm i

WORKDIR /
COPY . run.sh
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
