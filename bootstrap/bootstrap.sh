#!/bin/bash

if [ -x "$(command -v dnf)" ]; then 
    sudo dnf -y install ansible git
else 
    echo Not sure which package manager is running on this machine
    exit 1
fi

#clone from GIT
git clone https://github.com/billwheatley/provision-home-server0.git

# Make sure plain 'python' is in path (ansible does not do will without it)
if [ ! `which python` ]; then
  PYTHON3_LOC=$(which python3)
  PYTHON_LOC=$(dirname $PYTHON3_LOC)/python
  echo Need to Link $PYTHON3_LOC $PYTHON_LOC [using sudo]
  sudo ln -s $PYTHON3_LOC $PYTHON_LOC
fi

#Call key setup playbook
PRIMARY_USER_GROUP=`id -gn`
cd provision-home-server0/bootstrap

sudo ansible-playbook local-bootstrap.yaml --extra-vars="localhost_user=${USER} localhost_user_group=${PRIMARY_USER_GROUP} ansible_user_dir=${HOME}"

