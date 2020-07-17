# SPC Web Gateway

This repository contains Docker build files for SPC Web Gateway from [Lundix](http://www.lundix.se/).

## Building

To build the container, use:

    make build

## Install Default Configuration

To install the default configuration in `etc/`, use:

    make config

`config.xml` may need edits, whereas the password and key files are set in the next step.

## Configure Authentication

Before deployment one need to install configuration files as well as set passwords and authentication keys, use:

    make bootstrap

The bootstrap is very important to make the container run properly (especially saving the config.xml and auth folder externally). Change the left side path (e.g. /etc/spc-web-gateway/auth) to your own folder structure, the right side (e.g. /opt/spc-web-gateway/auth) is the containers path and shouldn't be changed.

## Running

An example [docker-compose](https://docs.docker.com/compose/) file is provided to ease deployment. Container is to be run as host.


## Configuration Files

The following files must be extracted from the distribution tar-ball and copied to the configuration volume (e.g., /etc/spc-web-gateway/auth):

- edp_key
- passwd_get
- passwd_put
- passwd_ws
- license
