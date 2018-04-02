#!/bin/sh

cd $INSTALL_DIR
runuser -u $SPC_GW_USER ./spc-web-gateway -- --debug
