################################################################
# broadtech/alpine-apache2
# This Dockerfile creats an image that deploys apache2
# web server on Alpine Linux
# To deploy apache2 on alpine just run this single command
#
#     $ sudo docker run broadtech/alpine-apache2
#
# You cound use this Docker file to create your own image
# Why Alpine Linux?
# Ans: Small, Simple, Secure. https://alpinelinux.org/about/

# Base Image - Official Alpine
FROM alpine

LABEL "vendor"="BroadTech Innovations PVT LTD"
LABEL "vendor.url"="http://www.broadtech-innovations.com/"
LABEL "maintainer"="sgeorge.ml@gmail.com"

# Upgrade existing packages in the base image
RUN apk --no-cache upgrade

# Install apache from packages with out caching install files
RUN apk add --no-cache apache2

# Creat directory for apache2 to store PID file
RUN mkdir /run/apache2

# Open port for httpd access
EXPOSE 80

# Run httpd in foreground so that the container does not quit
# soon after start
# To run this container in the back ground use the -d option
#
#     $ sudo docker run -d broadtech/alpine-apache2
#
CMD ["-D","FOREGROUND"]

# Srart httpd when container runs
ENTRYPOINT ["/usr/sbin/httpd"]

###--------------------END-------------------------------------#
