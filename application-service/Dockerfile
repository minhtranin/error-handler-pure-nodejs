FROM node:10-alpine
LABEL maintainer "minhtran.in@outlook.com"
WORKDIR /application-service
COPY package*.json ./
RUN npm i -q --no-optional
COPY . .
EXPOSE 9000
CMD ["npm","start"]

