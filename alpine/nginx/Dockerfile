#me####################################################################
# broadtech/alpine-nginx
# This Dockerfile creats an image that deploys Nginx webserver
# on Alpine Linux

# Base Image
FROM alpine

LABEL "vendor"="BroadTech Innovations PVT LTD"
LABEL "vendor.url"="http://www.broadtech-innovations.com/"
LABEL "maintainer.name"="Siju Oommen George"
LABEL "maintainer.email"="sgeorge.ml@gmail.com"

# Upgrade existing packages in the base image
RUN apk --no-cache upgrade

# Install apache from packages with out caching install files
RUN apk add --no-cache nginx

# Configure Nginx
COPY conf/nginx.conf /etc/nginx
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY conf/site.conf /etc/nginx/conf.d
RUN chown -R nginx.nginx /var/www/localhost/htdocs
RUN chmod -R 0760 /var/www/localhost/htdocs

# Add a welcome file
COPY www/index.html /var/www/localhost/htdocs

# Create directory for pid file
RUN mkdir /run/nginx

# Create a directory for entrypoint scripts
RUN mkdir /etc/docker-entrypoint.d

# Add entrypoint scripts and make them executable
COPY docker-entrypoint.d/* /etc/docker-entrypoint.d/
RUN chmod u+x /etc/docker-entrypoint.d/*

COPY scripts/run_parts_entrypoint.sh /usr/sbin
RUN chmod u+x /usr/sbin/run_parts_entrypoint.sh

# Open port to access Nginx
EXPOSE 80

# Start container service
ENTRYPOINT ["/usr/sbin/run_parts_entrypoint.sh"]
#
# -------------------------END----------------------------------------#
