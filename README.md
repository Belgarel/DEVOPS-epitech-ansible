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

## How to do it
* Launch the init.sh script to generate and deploy the ssh keys on all machines
* command: ansible all -i production.yml -m ping
* git-galaxy install -r requirements.yml

## Sensible information

* The **roles/hosts/files/ref_hosts** file determines the **/etc/hosts** file of all known hosts. It should be a copy of the local **/etc/hosts** file.
* Two passwords are encrypted using the ansible vault in the group_vars directory. To modify it, use the ansible-vault encrypt_string --ask-vault-pass command.
  * The current ansible password is: **NSA**
  * The database password in production.yml is: **prodword**
  * The root password is: **dev0ps**

## Tags
The following tags have been implemented.

Add --tags "tag1,tag2" to restrict the tagged tags (all tags must be included).

Add --skip-tags "tag1,tag2" to exclude certain tags (typically, tag `wip`).

* front: for front installation and deployment
* app: for application installation and deployment
* bdd: for database installation and deployment

* hosts: for deployment of the hosts file
* install: for first installation actions specifically
* wip: for taks that do not work yet
