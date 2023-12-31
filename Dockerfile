FROM node:16
WORKDIR /app
RUN apt-get update
COPY package.json .
RUN npm install
COPY . .
RUN npm run build --prod
FROM nginx:latest
COPY dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
