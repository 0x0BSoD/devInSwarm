# Swarm cluster for devlopment
## Based on Centos 8

Contains registry and visualizer

### Requirements
 - Virtualbox
 - Vagrant
 - Ansible
 - Packer

For deploy check the Vagrant file and change it.

If you want yous the box from Vagrantfile then necessary build it with Packer.

*Pay attention to provision block in Vagrantfile add right path to your ssh pub key*

```sh
packer build centos8.json
# wait to finish and then
vagrant box add --name centos_8 centos_8-virtualbox.box
```

How to up cluster
```sh
vagrant up
ansible-playbook swarm.yml 
```