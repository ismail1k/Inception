FROM debian:13
RUN sed -i 's|deb.debian.org/debian|ftp.fr.debian.org/debian|g' /etc/apt/sources.list.d/debian.sources
RUN apt-get update -y
RUN apt-get install php8.4-fpm php8.4-mysqli curl unzip -y

WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN curl -o wordpress.zip https://wordpress.org/latest.zip
RUN unzip wordpress.zip; mv wordpress/* ./; rm -rf wordpress wordpress.zip
COPY ./wp-config.php ./wp-config.php

WORKDIR /etc/php/8.4
COPY ./www.conf ./fpm/pool.d/www.conf

CMD ["php-fpm8.4", "-F"]
