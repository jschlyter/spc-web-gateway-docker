#!/bin/sh

start-stop-daemon --start --chdir $SPC_GW_DIR -c $SPC_GW_USER --exec spc-web-gateway -- $1
