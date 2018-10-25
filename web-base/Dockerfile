FROM 8.12.0-alpine

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

# RUN apk del yarn
RUN apk add --no-cache \
  tini \
  su-exec \ 
  imagemagick \
  git

# a script to handle user permissions:
# It will change ownership of current directory and step-down from user "root" 
# to "node" when you run any npm commands. 
# For everything else it will run the command directly without changing any user permissions.
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Wrap every executed command with Tini (available at /sbin/tini)
ENTRYPOINT ["/sbin/tini", "--", "docker-entrypoint.sh"]

ENV APP_DIR /home/node/app
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}
