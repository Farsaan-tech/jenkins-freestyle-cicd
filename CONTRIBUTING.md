# Contributing

1. Open an issue describing the change or operational problem.
2. Keep secrets, real IP addresses, tokens, and credentials out of commits.
3. Test Terraform with `terraform fmt -check -recursive` and `terraform validate`.
4. Test YAML syntax and run `ansible-playbook --syntax-check` where applicable.
5. Update the runbook and changelog for behavior changes.
6. Submit a pull request with validation evidence and any required rollback notes.

Do not describe an untested cloud deployment as production-verified.
