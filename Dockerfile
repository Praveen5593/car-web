# Build Stage
FROM node:20 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Production StageFROM nginx:alpine

COPY . /usr/share/nginx/html

EXPOSE 80
