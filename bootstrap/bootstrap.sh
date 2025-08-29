#!/bin/bash

if [ -x "$(command -v dnf)" ]; then 
    sudo dnf -y install ansible-core git
else 
    echo Not sure which package manager is running on this machine
    exit 1
fi

#clone from GIT
git clone https://github.com/billwheatley/provision-home-server0.git

PRIMARY_USER_GROUP=`id -gn`
cd provision-home-server0/bootstrap

mkdir -p ../../collections

ansible-galaxy collection install community.crypto

#Call bootstrap playbook
sudo ansible-playbook local-bootstrap.yaml --extra-vars="localhost_user=${USER} localhost_user_group=${PRIMARY_USER_GROUP} ansible_user_dir=${HOME}"

