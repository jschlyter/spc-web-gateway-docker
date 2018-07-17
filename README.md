# SPC Web Gateway

This repository contains Docker build files for SPC Web Gateway from [Lundix](http://www.lundix.se/).

## Building

    make build

## Running

An example [docker-compose](https://docs.docker.com/compose/) file is provided to ease deployment.
Container is to be run as host.

## Configure authentication keys

Before deployment one need to install configuration files as well as set passwords and authentication keys: 
    docker run -it --rm \
        --entrypoint /bin/bash \
        -v /etc/spc-web-gateway/auth:/opt/spc-web-gateway/auth \
        -v /etc/spc-web-gateway/config.xml:/opt/spc-web-gateway/config.xml \
        spc-web-gateway
    ./spc-web-gateway -A
    exit
These above steps are very important to make the container run properly (especially saving the config.xml and auth folder externally). 
