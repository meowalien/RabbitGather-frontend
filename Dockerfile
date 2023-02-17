FROM node:14.20.1-alpine3.16 as build-stage

WORKDIR /app
COPY ./src .

RUN yarn install && yarn build

FROM nginx:1.23.2
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=build-stage /app/dist /usr/share/nginx/html
