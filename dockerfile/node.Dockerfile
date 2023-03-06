FROM node:18.14.2-alpine3.17

WORKDIR /app
ADD . /app

RUN npm install
RUN npm run build
EXPOSE 3000

CMD npm run start