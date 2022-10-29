#!/bin/bash

set -e # exit immediatly on error
set -v # Print commands and their arguments as they are executed.
set -x

echo ""
echo "[+] Installing miniconda3"
echo ""

# https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
miniconda=Miniconda3-latest-Linux-x86_64.sh
wget --quiet https://repo.anaconda.com/miniconda/$miniconda
bash $miniconda -b -p $HOME/miniconda3

export PATH=$HOME/miniconda3/bin:$PATH
echo 'export PATH='$HOME/miniconda3/bin:$PATH'' >>$HOME/.bashrc
source $HOME/.bashrc

hash -r

# some configurations
conda config --set always_yes yes --set changeps1 no
conda update -q conda

# display info
conda info -a
