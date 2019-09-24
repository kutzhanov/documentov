# Dockerfile to setup Documentov on Ubuntu 18.04

FROM ubuntu:18.04
ENV TZ=Asia/Almaty
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

LABEL maintainer="kutzhanov@gmail.com"

# installation of Nginx + PHP-FPM + MySQL
RUN apt update -y && apt install -y \
nginx \
mysql-server \
php7.2 \
php7.2-fpm \
php7.2-mysql \
php7.2-cli \
php7.2-curl \
php7.2-gd \
php-tidy \
php7.2-zip \
php-mbstring \
zip \
unzip

# copy nginx site configuration
COPY default /etc/nginx/sites-available/default

# unzip Documentov files
RUN unzip Documentov.zip -d /var/www/html/

WORKDIR /var/www/html/
RUN chown -R www-data image system/storage config.php
RUN chmod -R 755 *
RUN chmod -R 777 config.php image system/storage

# restart nginx server
RUN service nginx restart

EXPOSE 80

# Create mysql database and user
RUN mysql -u root -e "CREATE USER 'documentov'@'localhost' IDENTIFIED BY 'password';"
RUN mysql -u root -e "CREATE DATABASE documentov CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
RUN mysql -u root -e "GRANT ALL PRIVILEGES ON documentov . * TO 'documentov'@'localhost';"
RUN mysql -u root -e "FLUSH PRIVILEGES;"
