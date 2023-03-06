FROM node:18.14.2

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./
COPY . .

RUN npm install  --loglevel verbose
RUN npm run build

# Bundle app event
# COPY . .

EXPOSE 8080
CMD [ "node", "server.js",">","./logs/app.log","2>", "./logs/error.log"]

