FROM debian:13
RUN sed -i 's|deb.debian.org/debian|ftp.fr.debian.org/debian|g' /etc/apt/sources.list.d/debian.sources
RUN apt-get update -y
RUN apt-get install mariadb-server -y

WORKDIR /etc/mysql
COPY ./my.cnf ./my.cnf

WORKDIR /usr/local/bin
COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
RUN mkdir -p /run/mysqld
RUN chown mysql:mysql /run/mysqld

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["mariadbd", "--user=mysql"]
