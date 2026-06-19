### Hexlet tests and linter status:
[![Actions Status](https://github.com/darkelv/devops-for-developers-project-76/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/darkelv/devops-for-developers-project-76/actions)

### Requirements

- Ansible
- make

### Instructions

- Create deploy user: `make create_app`
- Prepare server: `make prepare`
- Deploy Redmine: `make deploy`
- Issue HTTPS certificate: `make ssl`
- Edit secrets: `make vault_edit`

### Redmine

The deployment runs three Docker containers on one server:

- `redmine-postgres` for PostgreSQL
- `redmine-1` for the first Redmine instance
- `redmine-2` for the second Redmine instance

Common variables are stored in `group_vars/webservers/vars.yml`.
Secret variables are stored in encrypted `group_vars/webservers/vault.yml`.
The local vault password file is `.vault_password`.

### URL

- Redmine HTTPS: `https://opsinfrapath.ru/`
