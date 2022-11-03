#!/bin/bash

set -e # exit immediatly on error
set -v # Print commands and their arguments as they are executed.
set -x

SSH_USER=${SSH_USERNAME:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

# git clone openwpm
cd /opt

sudo git clone https://github.com/openwpm/OpenWPM.git

# install conda environment and dependencies
echo ""
echo "> Building the openwpm conda environment"
echo ""

cd OpenWPM/
source $SSH_USER_HOME/miniconda3/etc/profile.d/conda.sh
# Make conda available to shell script
eval "$(conda shell.bash hook)"
if [ "$1" != "--skip-create" ]; then
    echo 'Creating / Overwriting openwpm conda environment.'
    # `PYTHONNOUSERSITE` set so python ignores local user site libraries when building the env
    # See: https://github.com/openwpm/OpenWPM/pull/682#issuecomment-645648939
    PYTHONNOUSERSITE=True conda env create --force -q -f environment.yaml
fi
echo 'Activating environment.'
conda activate openwpm
echo 'Installing firefox.'
./scripts/install-firefox.sh
echo 'Building extension.'
./scripts/build-extension.sh
echo 'Installation complete, activate your new environment by running:'
echo 'conda activate openwpm'
