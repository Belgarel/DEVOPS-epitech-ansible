#!/bin/bash

ansible_user="ansible"

######################
# installation
######################
apt_sources="/etc/apt/sources.list"
deb_rep="deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"
grep "$deb_rep" "$apt_sources" 2>/dev/null
# ensure that ansible is installed
if [ "$?" != "0" ] ; then
	echo "Adding repository $deb_rep to $apt_sources"
	echo "Installing."
	su -c "apt-get install gnupg" root
	su -c "apt-key adv --key-server.ubuntu.com --recv-keys 93C4A3FD7BB9C367" root
	su -c "apt update" root
	su -c "apt install ansible" root
else
	echo "Repository was already found. Not installing."
fi
ansible-galaxy install -r requirements.yml

######################
# keys creation
######################
rm -r keys 2>/dev/null
mkdir -p keys 2>/dev/null
mkdir -p keys/pf 2>/dev/null
mkdir -p keys/pa 2>/dev/null
mkdir -p keys/pb 2>/dev/null
ssh-keygen -q -b 2048 -t rsa -N '' -C 'ansible@pf' -f keys/pf/id_rsa
ssh-keygen -q -b 2048 -t rsa -N '' -C 'ansible@pa' -f keys/pa/id_rsa
ssh-keygen -q -b 2048 -t rsa -N '' -C 'ansible@pb' -f keys/pb/id_rsa

######################
# keys deployment
######################
ssh-copy-id -i keys/pf/id_rsa ansible@pf
ssh-copy-id -i keys/pa/id_rsa ansible@pa
ssh-copy-id -i keys/pb/id_rsa ansible@pb

######################
# add key to auth agent
######################
grep "SSH_AUTH_SOCK" "~/.bashrc" 2>/dev/null
if [ "$?" != "0" ] ; then
	ssh-agent >> ~/.bashrc
fi
ssh-add keys/pf/id_rsa
ssh-add keys/pa/id_rsa
ssh-add keys/pb/id_rsa
