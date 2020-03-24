# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: davyd11 <davyd11@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/23 12:46:30 by davyd11           #+#    #+#              #
#    Updated: 2020/03/24 14:12:09 by davyd11          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install nano && apt-get install -y wget
#update tools, install (nano: text editor like vim)(wget: tool to get files using protocl https...)
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
#install php7 (full instalation)
RUN apt-get -y install nginx
#install nginx 
RUN apt-get -y install mariadb-server
#install tools to build data base

COPY ./srcs/container_creation.sh ./
#?
COPY ./srcs/nginx-conf ./tmp/nginx-conf
#moving configuration of nginx into the tmp folder inside the container
COPY ./srcs/phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php
#moving files into it's proper folder in container
COPY ./srcs/wp-config.php ./tmp/wp-config.php
#moving files into it's proper folder in container
COPY ./srcs/phpMyAdmin-4.9.0.1-all-languages.tar.gz ./
COPY ./srcs/wordpress-5.3.2-es_ES.tar.gz ./tmp/
CMD bash container_creation.sh
#run comands on file .sh