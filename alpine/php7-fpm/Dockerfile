#####################################################################
# broadtech/alpine-php-fpm
# This Dockerfile creats an image to deploy php-fpm on Alpine Linux
# using a single command
#
#     $ sudo docker run broadtech/alpine-php-fpm
#
# To run the php-fpm service in the background use the "-d" opton
#
#     $ sudo docker run -d broadtech/alpine-php-fpm
#
# You cound use this Docker file to create your own image
# Why Alpine Linux?
# Ans: Small, Simple, Secure. https://alpinelinux.org/about/

# Base Image
FROM alpine

LABEL "vendor"="BroadTech Innovations PVT LTD"
LABEL "vendor.url"="http://www.broadtech-innovations.com/"
LABEL "maintainer"="sgeorge.ml@gmail.com"

# Update local package repository index 
RUN apk update

# Upgrade existing packages in the base image
RUN apk upgrade

# Install php-fpm from packages with out caching install files
RUN apk add --no-cache php7-fpm 

# Install phpmyadmin dependencies from packages
RUN apk add --no-cache busybox php7 php7-bz2 php7-ctype php7-gd
RUN apk add --no-cache php7-json php7-mcrypt php7-mysqli
RUN apk add --no-cache php7-zip php7-zlib

# Donot daemonize FPM ( Run in Foreground ). This is required
# to prevent the container from exiting soon after start
RUN sed -i '/;daemonize = yes/c\daemonize = no'  /etc/php7/php-fpm.conf

# Configure FPM to listen on external IP Address
RUN sed -i '/listen = 127.0.0.1:9000/c\listen = 0.0.0.0:9000' /etc/php7/php-fpm.d/www.conf

# Open port to access FPM 
EXPOSE 9000

# Run PHP-FPM when container starts
CMD ["/usr/sbin/php-fpm7"]

# -------------------------END----------------------------------------#



