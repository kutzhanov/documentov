#!/usr/bin/env bash

service mysql start
service nginx start
service php7.2-fpm start
update-rc.d mysql defaults
update-rc.d nginx enable
chkconfig php-fpm on
