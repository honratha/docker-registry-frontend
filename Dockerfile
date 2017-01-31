FROM nginx:alpine

MAINTAINER Eric Muellenbach

ENV ENV_DOCKER_REGISTRY_HOST 'localhost'
ENV ENV_DOCKER_REGISTRY_PORT 5000

COPY dist /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
