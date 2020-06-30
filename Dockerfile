ARG BUILD_FROM
FROM node

ENV LANG C.UTF-8


RUN mkdir /assistant_relay \
&& npm i pm2 -g

WORKDIR /assistant_relay

RUN wget https://github.com/greghesp/assistant-relay/releases/download/v3.2.0/release.zip \
&& unzip release.zip \
&& rm release.zip \
&& npm i

WORKDIR /
COPY . run.sh
RUN ["chmod", "+x", "run.sh"]
CMD [ "/run.sh" ]
