# Dockerfile to setup Documentov on Ubuntu 18.04

FROM ubuntu:18.04

# Time Zone configuration
ENV TZ=Asia/Almaty
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

LABEL maintainer="kutzhanov@gmail.com"

# installation of Nginx + PHP-FPM + MySQL
RUN apt-get update -y && apt-get install --no-install-recommends --no-install-suggests -y \
dialog \
apt-utils \
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
# COPY default /etc/nginx/sites-available/default

COPY services.sh /root/services.sh
RUN chmod +x /root/services.sh

# unzip Documentov files
COPY Documentov.zip .
# RUN unzip Documentov.zip -d /var/www/html/

# WORKDIR /var/www/html/
# RUN chown -R www-data image system/storage config.php
# RUN chmod -R 755 *
# RUN chmod -R 777 config.php image system/storage

EXPOSE 80

# VOLUME ["/var/www/html/", "/var/log/nginx/"]

# Create mysql database and user
RUN /etc/init.d/mysql start && sleep 5 && \
mysql -u root -e "CREATE USER 'documentov'@'localhost' IDENTIFIED BY 'password';" && \
mysql -u root -e "CREATE DATABASE documentov CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" && \
mysql -u root -e "GRANT ALL PRIVILEGES ON documentov . * TO 'documentov'@'localhost';" && \
mysql -u root -e "FLUSH PRIVILEGES;"

# CMD /root/services.sh
CMD ["mysqld"]
