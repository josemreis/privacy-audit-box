#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

set -e # exit immediatly on error
set -v # Print commands and their arguments as they are executed.
set -x

# clean out the cached package data
apt-get -y autoremove --purge
apt-get clean -q

# Perform an update and full upgrade.
apt-get update -q
apt-get -y upgrade -q

# Install necessary libraries for guest additions and Vagrant NFS Share
# Also install curl, comes with most "cloud images" distributed by Ubuntu by default
# TODO: some of this is already installed via ../http/bionic_preseed_template.cfg on bionic? deduplicate?
apt-get -y install --no-install-recommends build-essential ssh curl dkms linux-headers-$(uname -r) nfs-common

# installing dependencies
apt-get install -y libterm-readkey-perl ca-certificates wget curl git expect iproute2 procps libnm0 make npm -qq

# install firefox and xvfb which we will need for openwpm
echo ""
echo "[+] Installing firefox and xvfb"
echo ""

## installing firefox and xvfb
sudo apt-get install -y firefox xvfb -q
