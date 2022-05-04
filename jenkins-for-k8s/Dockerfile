FROM jenkins/jenkins:2.303.1-jdk11
RUN jenkins-plugin-cli --plugins \
  git:4.8.3 \
  kubernetes:1.30.1 \
  workflow-aggregator:2.6 \
  configuration-as-code:1.52 \
  # additional plugins
  credentials:2.6.1 \
  blueocean:1.24.8 \
  antisamy-markup-formatter:2.1 \
  email-ext:2.83 \
  bitbucket-oauth:0.12 \
  cloudbees-bitbucket-branch-source:2.9.11 \
  matrix-auth:2.6.8\
  sonar:2.13.1 \
  strict-crumb-issuer:2.1.0 \
  next-build-number:1.6 \
  # sshd:3.1.0 \
  command-launcher:1.6 \
  jaxb:2.3.0.1 \