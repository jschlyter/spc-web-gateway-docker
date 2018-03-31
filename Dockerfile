FROM ubuntu:16.04

ENV VERSION=1.3
ENV SOURCE_DIR=spc-web-gateway-$VERSION
ENV INSTALL_DIR=/opt/spc-web-gateway
ENV TEMP_DIR=/tmp/spc-web-gateway-install
ENV SPC_GW_USER=gateway

RUN apt-get update && apt-get upgrade -y && apt-get install -y openssl

RUN useradd $SPC_GW_USER

WORKDIR $TEMP_DIR
COPY $SOURCE_DIR $TEMP_DIR
COPY install-spc-web-gateway.sh $TEMP_DIR
RUN sh install-spc-web-gateway.sh

WORKDIR $INSTALL_DIR
RUN rm -fr $TEMP_DIR

COPY entrypoint.sh $INSTALL_DIR
RUN chmod a+x entrypoint.sh
ENTRYPOINT $INSTALL_DIR/entrypoint.sh
