FROM jenkins/jenkins:2.303.1-jdk11
RUN jenkins-plugin-cli --plugins \
  kubernetes:1.30.1 \
  workflow-aggregator:2.6 \
  git:4.8.2 \
  git-client:3.9.0 \
  configuration-as-code:1.52 \
  # additional plugins
  credentials:2.5 \
  blueocean:1.24.8 \
  antisamy-markup-formatter:2.1 \
  email-ext:2.83 \
  bitbucket-oauth:0.10 \
  cloudbees-bitbucket-branch-source:2.9.11 \
  matrix-auth:2.6.8\
  sonar:2.13.1 \
  strict-crumb-issuer:2.1.0 \
  next-build-number:1.6 \
  sshd:3.1.0 \




# FROM jenkins/jenkins:2.289.1-jdk11
# RUN jenkins-plugin-cli --plugins \
#   kubernetes:1.30.1 \
#   workflow-aggregator:2.6 \
#   git:4.8.2 \
#   configuration-as-code:1.52 \
#   # additional plugins
#   credentials:2.5 \
#   blueocean:1.24.7 \
#   antisamy-markup-formatter:2.1 \
#   email-ext:2.83 \
#   bitbucket-oauth:0.10 \
#   matrix-auth:2.6.7\
#   sonar:2.13.1 \
#   strict-crumb-issuer:2.1.0 \
#   next-build-number:1.6    