FROM node:8.11.2-alpine

# Install Dependencies
# tini
# ------ 
# spawn a single child (Tini is meant to be run in a container), and wait for it
# to exit all the while reaping zombies and performing signal forwarding.
# 
# su-exec
# ----------
# switch user and group id and exec. 
# It does more or less exactly the same thing as gosu but very lightweight.

RUN apk add --no-cache \
  tini \
  su-exec \
  git

RUN yarn global upgrade yarn@1.7.0 && yarn cache clean

# a script to handle user permissions:
# It will change ownership of current directory and step-down from user "root" 
# to "node" when you run any npm commands. 
# For everything else it will run the command directly without changing any user permissions.
# make sure docker-entrypoint.sh is executable. If not run this before building the image:
# chmod +x docker-entrypoint.sh
COPY docker-entrypoint.sh /usr/local/bin/

# Wrap every executed command with Tini (available at /sbin/tini)
ENTRYPOINT ["/sbin/tini", "--", "docker-entrypoint.sh"]

ENV APP_DIR /home/node/app
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}
