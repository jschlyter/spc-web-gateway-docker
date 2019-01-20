#!/bin/bash

INSTALL_DIR=/opt/spc-web-gateway
CERT=$INSTALL_DIR/auth/ssl_certificate.pem

# regenerate certificate
openssl req -new -x509 -newkey rsa:2048 -keyout $CERT -out $CERT -days 4000 -subj "/CN=spc-web-gateway" -nodes
chgrp $SPC_GW_USER $CERT
chmod 440 $CERT

(cd $INSTALL_DIR; ./spc-web-gateway -A)
