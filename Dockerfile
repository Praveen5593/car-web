# Stage 1: Build the app
FROM node:20 AS build

WORKDIR /app

# install dependencies
COPY package.json package-lock.json ./
RUN npm install

# copy source code
COPY . .

# build production files
RUN npm run build


# Stage 2: Serve with Nginx
FROM nginx:alpine

# copy build output to nginx folder
COPY --from=build /app/dist /usr/share/nginx/html

# expose port
EXPOSE 80

# run nginx
CMD ["nginx", "-g", "daemon off;"]
