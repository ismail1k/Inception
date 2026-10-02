FROM debian:13
RUN sed -i 's|deb.debian.org/debian|ftp.fr.debian.org/debian|g' /etc/apt/sources.list.d/debian.sources
RUN apt-get update -y
RUN apt-get install nginx openssl -y

WORKDIR /etc/nginx
ARG DOMAIN_NAME
RUN mkdir -p ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/${DOMAIN_NAME}.key -out /etc/nginx/ssl/${DOMAIN_NAME}.crt -subj "/CN=${DOMAIN_NAME}"
COPY ./nginx.conf ./nginx.conf

CMD ["nginx", "-g", "daemon off;"]
