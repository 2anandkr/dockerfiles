FROM node:10.16.0-alpine

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


RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
  tini \
  su-exec \
  # for puppeteer
  udev \
  ttf-freefont \
  # chromium==72.0.3582.0
  chromium


# Tell Puppeteer to skip installing Chrome and pass in binary location 
ENV CHROME_BIN="/usr/bin/chromium-browser" \
  PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

# a script to handle user permissions:
# It will change ownership of current directory and step-down from user "root" 
# to "node" when you run any npm commands. 
# For everything else it will run the command directly without changing any user permissions.
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Wrap every executed command with Tini (available at /sbin/tini)
ENTRYPOINT ["/sbin/tini", "--", "docker-entrypoint.sh"]

ENV APP_DIR /home/node/app
# USER node
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}
