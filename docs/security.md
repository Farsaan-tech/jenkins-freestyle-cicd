# Security notes

The source PDF includes examples that should not be copied literally into a public or production environment.

- Do not use `admin123`, `deployer/deployer`, or any sample password. Use unique, rotated secrets stored in Jenkins Credentials.
- The PDF's Nexus example grants the `nexus` user passwordless sudo (`NOPASSWD: ALL`). Do not apply this broad privilege. Run Nexus as a dedicated unprivileged service account with only required filesystem access.
- Do not expose SonarQube, Nexus, Jenkins, or Tomcat Manager directly to the public internet. Prefer private subnets, VPN/bastion access, and security-group allowlists.
- Use HTTPS/TLS and supported versions. The historical Nexus `3.0.2-02` and Tomcat `10.1.33` versions in the PDF require version/security review before use.
- Store SonarQube tokens, Slack tokens, Nexus credentials, and Tomcat deployment credentials in Jenkins Credentials; never place them in job parameters, source control, screenshots, or console output.
- Restrict Tomcat Manager access to the Jenkins host/network and use a dedicated deployment identity. Do not disable access controls in `context.xml` as a shortcut.
- Apply least privilege to AWS identities; restrict SSH to a trusted IP/CIDR. Avoid unrestricted inbound rules.
- Sanitize screenshots and logs before publishing.
