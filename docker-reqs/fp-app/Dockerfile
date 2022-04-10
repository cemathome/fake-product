FROM node:17-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
# https://blog.npmjs.org/post/171556855892/introducing-npm-ci-for-faster-more-reliable
# https://stackoverflow.com/questions/52499617/what-is-the-difference-between-npm-install-and-npm-ci
# package-lock.json is required, It never writes to package.json or package-lock.json.
# RUN npm ci --only=production
# cache ?

# ADD package.json /tmp/package.json
# RUN cd /tmp && npm install
# RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

COPY . .

EXPOSE 8080

CMD [ "node", "example_code.js" ]

