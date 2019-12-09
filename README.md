# DEVOPS-epitech-ansible
Ansible project for T-NSA-700 (school project)

## Prerequesite
The /etc/hosts file is expected to fill information for the following hosts:
* pf (prod front)
* pa (prod app)
* pb (prod back)
The user ansible/***** is expected to exist on these 3 machines. It is also expected to be sudoable.

## What it can do
* init.sh: execute this script the first time to deploy the ssh certificates.
* ping the hosts: `ansible all -i inventory.yml -m ping`
* deploy: `ansible-playbook -i inventory.yml playbook.yml --ask-vault-pass` (vault secret: `NSA`)

TODO: tags

## How to do it
* Launch the init.sh script to generate and deploy the ssh keys on all machines
* command: ansible all -i production.yml -m ping
* git-galaxy install -r requirements.yml
