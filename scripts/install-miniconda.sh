#!/bin/bash

set -e # exit immediatly on error
set -v # Print commands and their arguments as they are executed.
set -x

SSH_USER=${SSH_USERNAME:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

echo ""
echo "[+] Installing miniconda3"
echo ""

# https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
miniconda=Miniconda3-latest-Linux-x86_64.sh
wget --quiet https://repo.anaconda.com/miniconda/$miniconda
bash $miniconda -b -p $SSH_USER_HOME/miniconda3

export PATH=$SSH_USER_HOME/miniconda3/bin:$PATH
echo 'export PATH='$SSH_USER_HOME/miniconda3/bin:$PATH'' >>$SSH_USER_HOME/.bashrc
source $SSH_USER_HOME/.bashrc

hash -r

# some configurations
conda config --set always_yes yes --set changeps1 no
conda update -q conda

# display info
conda info -a
