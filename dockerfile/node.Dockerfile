FROM node:16.14.0

WORKDIR /app
ADD . /app

RUN npm install
RUN npm run build
EXPOSE 3000

CMD npm run start