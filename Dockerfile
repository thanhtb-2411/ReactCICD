FROM node:13.12.0-alpine AS myapp

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && npm install react-scripts@3.4.1 -g --silent 

COPY . ./

RUN npm run build

FROM nginx:latest
COPY --from=myapp /usr/src/app/build /usr/share/nginx/html
 