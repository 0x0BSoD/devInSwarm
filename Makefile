## infra: Spin up vurtual machines with Vagrant
infra: 
	@vagrant up

## destroy: Force remove virtual mashines
destroy: 
	@vagrant destroy --force

## swarmup: Run ansible to up swarm cluster
swarmup:
	@cd ansible && ansible-playbook swarm.yml

all: infra swarmup

.PHONY: help
all: help
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo