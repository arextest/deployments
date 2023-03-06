FROM node:18.14.2

WORKDIR /app
ADD . /app

RUN npm install
RUN npm run build
EXPOSE 3000

CMD npm run start