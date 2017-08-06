#####################################################################
# broadtech/alpine-nginx
# This Dockerfile creats an image that deploys Nginx webserver
# on Alpine Linux
# To deploy nginx on alpine just run this single command
#
#     $ sudo run broadtech/alpine-nginx
#
# To run nginx in the background use the "-d" option
#
#     $ sudo run -d broadtech/alpine-nginx
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

# Install apache from packages with out caching install files
RUN apk add --no-cache nginx

# Configure Nginx
COPY nginx.conf /etc/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY site.conf /etc/nginx/conf.d

# Add a welcome file
COPY index.html /var/www/localhost/htdocs

# Create directory for pid file
RUN mkdir /run/nginx

# Open port to access Nginx
EXPOSE 80

# Run Nginx when container starts
CMD ["/usr/sbin/nginx"]

# -------------------------END----------------------------------------#


