DOMAIN ?= opsinfrapath.ru
PLAYBOOK = ansible-playbook -i inventory.ini

.PHONY: install_requirements create_app prepare deploy ssl datadog vault_edit vault_view

install_requirements:
	ansible-galaxy install -r requirements.yml

create_app:
	$(PLAYBOOK) create_user.yml -u root

prepare: install_requirements
	$(PLAYBOOK) playbook.yml --tags prepare

deploy:
	$(PLAYBOOK) playbook.yml --tags deploy

ssl:
	$(PLAYBOOK) playbook.yml --tags ssl -e redmine_domain=$(DOMAIN)

datadog: install_requirements
	$(PLAYBOOK) playbook.yml --tags datadog

vault_edit:
	ansible-vault edit group_vars/webservers/vault.yml

vault_view:
	ansible-vault view group_vars/webservers/vault.yml
