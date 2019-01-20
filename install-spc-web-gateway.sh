#!/bin/bash

INSTALL_DIR=/opt/spc-web-gateway

install -m 755 -p -d ${INSTALL_DIR}
install -m 755 -p spc-web-gateway ${INSTALL_DIR}
install -m 644 -p SPC_WEB_GATEWAY_EULA.txt ${INSTALL_DIR}
install -m 644 -p VERSION ${INSTALL_DIR}

install -m 755 -p -d ${INSTALL_DIR}/auth

install -m 755 -p -d ${INSTALL_DIR}/www
install -m 644 -p www/index.html ${INSTALL_DIR}/www
