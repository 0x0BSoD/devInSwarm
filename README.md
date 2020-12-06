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
cd packer
packer build centos8.json
# wait to finish and then
vagrant box add --name centos_8 centos_8-virtualbox.box
```

### How to up cluster

In file `ansible/hosts` check ethernet device name and fqdn for docker registry
Add this fqdn to the system hosts file

For connect to remote docer daemon add env var `DOCKER_HOST=tcp://10.1.1.100:2375`

```sh
vagrant up
cd ansible
ansible-playbook swarm.yml 
```

---

## Services

Cluster contain two bulletin services:
 | Name | Ports |
 | :----------   | :---------- |
 | visualizer    |    *:8080->8080/tcp |
 | registry      |    *:5000->5000/tcp |

### Monitoring

 | Name | Ports |
 | :----------   | :---------- |
 | Grafana        |   *:3000->3000/tcp |
 | Cadvisor        |  |
 | node-exporter  |  |
 | dockerd-exporter | |
 | prometheus       | *:9090->9090/tcp |

For up monitoring stack:
```sh
cd monitoring/grafana
docker build . -t %REGISTRY_FQDN%:5000/grafana
docker push %REGISTRY_FQDN%:5000/grafana
cd ..
# check in stack grafana service, change if needed 'image'
docker stack deploy -c docker-compose.stack.yml docker-swarm-monitor
```
