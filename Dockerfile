
FROM nginx:alpine

RUN rm -rf usr/share/nginx/html/*

COPY . /usr/share/nginx/html

RUN apk update && apk upgrade libxml2

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]