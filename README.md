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
- Deploy Datadog Agent: `make datadog`
- Edit secrets: `make vault_edit`

### Redmine

The deployment runs three Docker containers on one server:

- `redmine-postgres` for PostgreSQL
- `redmine-1` for the first Redmine instance
- `redmine-2` for the second Redmine instance

Common variables are stored in `group_vars/webservers/vars.yml`.
Secret variables are stored in encrypted `group_vars/webservers/vault.yml`.
The local vault password file is `.vault_password`.

### Datadog

The Datadog Agent is installed only for the `webservers` group.
The API key is stored in Ansible Vault.
The `http_check` integration checks `https://opsinfrapath.ru/` and expects a `200` response containing `Redmine`.

### URL

- Redmine HTTPS: `https://opsinfrapath.ru/`
