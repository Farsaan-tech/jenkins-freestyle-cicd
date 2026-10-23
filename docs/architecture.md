# Architecture

## Components

- **Source control:** `betawins/hiring-app` Git repository.
- **CI coordinator:** Jenkins Freestyle job, configured through the Jenkins UI.
- **Code quality:** SonarQube receives analysis from the Maven project.
- **Build:** Maven compiles/tests/packages the application as a WAR, subject to the source project's build configuration.
- **Artifact repository:** Nexus stores the published build artifact.
- **Notification:** Slack receives job result notifications.
- **Runtime:** Apache Tomcat hosts the deployed application.

## Data flow

1. A push or configured manual trigger starts Jenkins.
2. Jenkins checks out the selected Git revision.
3. SonarQube Scanner analyzes the code.
4. Maven runs the configured goals and creates a WAR artifact.
5. Jenkins uploads the artifact to the configured Nexus repository.
6. Jenkins deploys the WAR to Tomcat using authenticated deployment credentials.
7. Slack reports the result.

## Boundaries

The source PDF describes a manually configured Freestyle job. This repository does not claim that a Jenkinsfile or automatic provisioning of all services existed in the original project. Terraform examples are an added optional scaffold.
