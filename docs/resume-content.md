# Resume and LinkedIn content

## Project title
Jenkins Freestyle CI/CD Pipeline for Maven Application Delivery

## Project description (approximately 150 words)
Designed and documented a Jenkins Freestyle CI/CD workflow for a Maven-based Java web application, connecting source control, code-quality analysis, artifact management, notifications, and application deployment. The job checks out the hiring-app repository, runs SonarQube analysis, builds and packages the application with Maven, publishes the resulting WAR to Nexus Repository Manager, sends build notifications to Slack, and deploys the application to Apache Tomcat. The implementation uses Jenkins-managed credentials and configured tool installations to integrate the services. The supporting runbook covers environment setup, plugin configuration, artifact coordinates, verification checkpoints, common failure modes, and rollback considerations. An optional Terraform scaffold and Ansible preflight playbook document infrastructure and connectivity automation. Security improvements include replacing sample credentials, restricting service access, avoiding public exposure of administration endpoints, and validating historical component versions before deployment. The repository separates source-derived workflow details from recommended hardening steps and does not claim an end-to-end deployment has been independently tested.

## Resume bullets
- Configured a Jenkins Freestyle job to check out a Maven application from Git and automate build/package steps.
- Integrated SonarQube analysis into the build workflow using Jenkins-managed credentials.
- Documented Nexus artifact publication using Maven-generated WAR files and project-specific coordinates.
- Added Slack build notifications and Tomcat deployment steps with verification and rollback guidance.
- Created an operational runbook covering tool configuration, troubleshooting, artifact verification, and security controls.
- Added optional Terraform and Ansible examples for repeatable infrastructure and connectivity checks.

Only retain claims corresponding to tasks you personally implemented and tested.

## LinkedIn description
Documented a Jenkins Freestyle CI/CD workflow for a Maven web application, integrating Git checkout, SonarQube code analysis, Maven packaging, Nexus artifact publication, Slack notifications, and Tomcat deployment. Added operational verification, troubleshooting, security guidance, and optional Terraform/Ansible examples.
