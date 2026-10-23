# Jenkins Freestyle job configuration checklist

## Global tools and integrations
- JDK installation: Java 17 only if supported by the selected Jenkins and application versions.
- Maven installation: select a maintained Maven 3.x version compatible with the project. The PDF used Maven 3.9.9.
- SonarQube server: configure URL and a Jenkins Credentials secret text token.
- Slack: configure workspace/credential and channel.
- Nexus: configure endpoint and credentials through a supported plugin or Maven settings/credential binding.
- Tomcat: configure a private deployment endpoint and dedicated manager-script account.

## Job configuration
- Type: Freestyle project.
- SCM: Git, repository `https://github.com/betawins/hiring-app.git`.
- Trigger: manual initially; add webhook or polling only after authentication and network setup.
- Build steps: SonarQube analysis configured for this project; Maven goals `clean verify`; quality-gate enforcement; publish WAR to Nexus. Adapt order to ensure analysis and quality gate are enforced before release.
- Post-build: Slack status notification; deploy only if all required checks pass.

## Artifact coordinates
Read the groupId, artifactId, version, packaging, and final WAR path from `pom.xml` and actual Maven output. Do not copy guessed values from screenshots.
