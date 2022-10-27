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
bash $miniconda -b -p $HOME/.miniconda3
echo 'export PATH='$HOME/.miniconda3/bin:$PATH'' >>$HOME/.bashrc
source $HOME/.bashrc
conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda info -a

# source it
source $HOME/.miniconda3/etc/profile.d/conda.sh
