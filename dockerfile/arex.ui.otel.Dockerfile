FROM node:18.14.2-alpine3.17

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./
COPY . .
RUN npm install --save @opentelemetry/api
RUN npm install --save @opentelemetry/instrumentation
RUN npm install --save @opentelemetry/tracing
RUN npm install --save @opentelemetry/exporter-trace-otlp-http
RUN npm install --save @opentelemetry/resources
RUN npm install --save @opentelemetry/semantic-conventions
RUN npm install --save @opentelemetry/auto-instrumentations-node
RUN npm install --save @opentelemetry/sdk-node

RUN npm install pnpm -g
RUN pnpm install  --loglevel verbose
RUN pnpm run build

EXPOSE 8080
# CMD [ "node", "server.js",">","./logs/app.log","2>", "./logs/error.log"]
CMD [ "node", "packages/arex/server.js",">","./logs/app.log","2>", "./logs/error.log"]
