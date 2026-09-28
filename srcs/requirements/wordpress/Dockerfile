FROM debian:13

RUN sed -i 's|deb.debian.org/debian|ftp.fr.debian.org/debian|g' \
        /etc/apt/sources.list.d/debian.sources

WORKDIR /tmp
RUN apt-get update -y
RUN apt-get install php8.4-fpm php8.4-mysqli curl unzip -y
RUN curl -o wordpress.zip https://wordpress.org/latest.zip
RUN mkdir -p /var/www/html
RUN unzip /tmp/wordpress.zip
RUN mv /tmp/wordpress/* /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN rm -rf /tmp/wordpress /tmp/wordpress.zip

WORKDIR /etc/php
COPY ./conf/www.conf /etc/php/8.4/fpm/pool.d/www.conf
CMD ["php-fpm8.4", "-F"]
