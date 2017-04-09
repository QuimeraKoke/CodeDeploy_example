#!/bin/bash
cp ~/Assets/screenrc ~/.screenrc
mkdir $HOME/.venvs
virtualenv $HOME/.venvs/CODE_DEPLOY_EX
cd $HOME/.venvs/CODE_DEPLOY_EX
./bin/pip uninstall -y appdirs
./bin/pip install setuptools
./bin/pip install -r ~/Assets/requirements.txt
sudo virtualenv $HOME/.venvs/CODE_DEPLOY_EX

date > $HOME/install_executed.txt