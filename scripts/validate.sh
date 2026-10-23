#!/usr/bin/env bash
set -euo pipefail
command -v terraform >/dev/null && terraform -chdir=terraform fmt -check -recursive && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate || { echo "Terraform checks skipped or failed; inspect output."; exit 1; }
if command -v ansible-playbook >/dev/null; then ansible-playbook -i ansible/inventory.example.ini ansible/preflight.yml --syntax-check; else echo "ansible-playbook not installed; skipping Ansible syntax check"; fi
