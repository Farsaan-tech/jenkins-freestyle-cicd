# Optional Terraform lab scaffold

This creates one Jenkins EC2 instance in the default VPC with SSH and port 8080 restricted to `admin_cidr`. It does **not** install Jenkins or provision SonarQube, Nexus, Slack, or Tomcat. Those services are documented as separately managed components in the source project.

1. Ensure an appropriate default VPC/subnet exists.
2. Create or select an EC2 key pair.
3. Copy `terraform.tfvars.example` to `terraform.tfvars` and replace the AMI, key pair, and admin CIDR.
4. Run `terraform init`, `terraform fmt -check -recursive`, `terraform validate`, and `terraform plan`. Review the plan before `terraform apply`.
5. Use `terraform destroy` when finished.

Never use a placeholder AMI or example CIDR unchanged. AWS charges may apply.
