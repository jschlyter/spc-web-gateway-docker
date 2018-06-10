FROM ubuntu:16.04

ARG VERSION=1.3
ARG SOURCE_DIR=spc-web-gateway-$VERSION
ARG TEMP_DIR=/tmp/spc-web-gateway-install
ARG UID=1337
ARG GID=1337

ENV SPC_GW_DIR=/opt/spc-web-gateway
ENV SPC_GW_USER=gateway

EXPOSE 8088/tcp
EXPOSE 16000/tcp

RUN groupadd -g $GID $SPC_GW_USER
RUN useradd -r -u $UID -g $GID $SPC_GW_USER
RUN apt-get update && apt-get upgrade -y && apt-get install -y openssl libssl-dev

WORKDIR $TEMP_DIR
COPY $SOURCE_DIR $TEMP_DIR/
COPY install-spc-web-gateway.sh $TEMP_DIR/
RUN sh $TEMP_DIR/install-spc-web-gateway.sh
RUN rm -fr $TEMP_DIR

WORKDIR $SPC_GW_DIR
COPY entrypoint.sh $SPC_GW_DIR/
RUN chmod a+x entrypoint.sh
ENTRYPOINT sh $SPC_GW_DIR/entrypoint.sh
