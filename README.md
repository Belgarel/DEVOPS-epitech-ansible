# DEVOPS-epitech-ansible
Ansible project for T-NSA-700 (school project)

## Prerequesite
The /etc/hosts file is expected to fill information for the following hosts:
* pf (prod front)
* pa (prod app)
* pb (prod back)
The user ansible/***** is expected to exist on these 3 machines.

## What it can do
For now, this is very basic: ping the hosts

## How to do it
* Launch the init.sh script to generate and deploy the ssh keys on all machines
* command: ansible all -i production.yml -m ping
