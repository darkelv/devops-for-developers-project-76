DOMAIN ?= opsinfrapath.ru

.PHONY: install_requirements create_app prepare deploy ssl

install_requirements:
	ansible-galaxy install -r requirements.yml

create_app:
	ansible-playbook -i inventory.ini create_user.yml -u root

prepare: install_requirements
	ansible-playbook -i inventory.ini playbook.yml --tags prepare

deploy:
	ansible-playbook -i inventory.ini playbook.yml --tags deploy

ssl:
	ansible-playbook -i inventory.ini playbook.yml --tags ssl -e redmine_domain=$(DOMAIN)
