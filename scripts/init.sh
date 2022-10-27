#!/bin/bash

set -e # exit immediatly on error
set -v # Print commands and their arguments as they are executed.
set -x

# clean out the cached package data
sudo apt-get clean -q

# update and upgrade
sudo apt-get update -q
sudo apt-get -y upgrade -q

# installing dependencies
sudo apt-get install -y libterm-readkey-perl ca-certificates wget curl git expect iproute2 procps libnm0 make npm -qq

# install firefox and xvfb which we will need for openwpm
echo ""
echo "[+] Installing firefox and xvfb"
echo ""

## installing firefox and xvfb
sudo apt-get install -y firefox xvfb -q
