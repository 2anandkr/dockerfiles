FROM anandkr/base-js:latest
COPY package.json yarn.lock ${APP_DIR}/
# install deps.
RUN yarn install --production && yarn cache clean
EXPOSE 8080
CMD ["yarn", "start"]
HEALTHCHECK --interval=10s CMD wget -qO- localhost:8080/api
# copy server code
COPY ./ ${APP_DIR}
