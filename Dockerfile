# Stage 1: Build React/Vite app
FROM node:20 AS build

WORKDIR /app

# install dependencies
COPY package.json package-lock.json ./
RUN npm install

# copy source code
COPY . .

# build production files
RUN npm run build


# Stage 2: Serve using Nginx
FROM nginx:alpine

# copy build output
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
