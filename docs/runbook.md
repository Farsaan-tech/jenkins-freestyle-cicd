# Operations runbook

## Before the first build

- Confirm Git URL, branch, and Jenkins agent checkout permissions.
- Confirm Java/Maven versions are compatible with `pom.xml`.
- Test SonarQube URL and token credentials from Jenkins.
- Confirm Nexus repository type, coordinates, endpoint, and credentials.
- Confirm Slack workspace, credential, and channel.
- Confirm Tomcat version, deployment endpoint, network path, and a dedicated account.
- Back up Jenkins `$JENKINS_HOME` and take an AWS AMI/EBS snapshot where appropriate. Test restoration, not just backup creation.

## Freestyle build order

1. Source Code Management: Git URL `https://github.com/betawins/hiring-app.git`.
2. Build environment: inject/configure SonarQube environment and required tool installations.
3. SonarQube analysis: use project-specific properties from `pom.xml` and scanner documentation.
4. Maven build: typically `clean verify`; validate expected goals first.
5. Nexus upload: upload the exact generated WAR with coordinates matching the project and repository.
6. Post-build actions: Slack success/failure notification and Tomcat deployment. Choose ordering deliberately so deployment only follows a successful build and required quality gate.

## Verification checklist

- [ ] Jenkins build result is successful.
- [ ] Console log confirms the intended Git commit.
- [ ] Maven tests and packaging completed.
- [ ] SonarQube project shows a fresh analysis and quality-gate status.
- [ ] Nexus contains the expected artifact/version.
- [ ] Slack notification references the correct build.
- [ ] Tomcat deploys the expected version and application smoke test passes.

## Failure handling

- **Checkout failure:** validate repository URL, branch, credentials, DNS, and outbound access.
- **Maven failure:** inspect test/compile logs and tool versions; do not skip tests just to get a green build.
- **SonarQube failure:** verify server availability, token permissions, scanner configuration, and quality-gate result.
- **Nexus upload failure:** check repository type, artifact coordinates, permissions, and TLS.
- **Tomcat deployment failure:** verify manager endpoint, deployment user roles, target compatibility, and Tomcat logs. Roll back to the last known-good artifact if needed.

## Rollback

Retain versioned artifacts in Nexus. Redeploy the previous known-good WAR through the approved deployment method, verify health, and document the incident. A Jenkins backup alone does not roll back the deployed application.
