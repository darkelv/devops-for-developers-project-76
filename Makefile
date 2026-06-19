.PHONY: install_requirements create_app prepare nginx site index

install_requirements:
	ansible-galaxy install -r requirements.yml

create_app:
	ansible-playbook -i inventory.ini create_user.yml -u root

prepare: install_requirements
	ansible-playbook -i inventory.ini playbook.yml --tags prepare

nginx:
	ansible-playbook -i inventory.ini playbook.yml --tags nginx

site:
	ansible-playbook -i inventory.ini playbook.yml --tags site

index:
	ansible-playbook -i inventory.ini playbook.yml --tags index
