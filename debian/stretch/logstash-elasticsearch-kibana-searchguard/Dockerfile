#####################################################################
# broadtech/debian-stretch-logstash-elasticsearch-kibana-searchguard
# This Dockerfile creates an image that deploys
# 1) Logstash
# 2) Elastic Search
# 3) Kibana
# 4) Search Guard
# services on Debian Linux ( Stretch )
#
# To deploy these services  on debian stretch just run this single command
#
#     $ sudo docker run broadtech/debian-stretch-logstash-elasticsearch-kibana-searchguard:v1
#
# You could customize this Docker file to create your own image

# Base Image
FROM debian

LABEL "vendor"="BroadTech Innovations PVT LTD"
LABEL "vendor.url"="http://www.broadtech-innovations.com/"
LABEL "maintainer"="sgeorge.ml@gmail.com"

# Update Local Repository Index
RUN apt-get update

# Upgrade packages in base image and apply security updates
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -yq

# Install JRE
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq default-jre

# Install Utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq wget procps vim net-tools

# Create directory to store downloaded software during installation
RUN mkdir -p /var/software

# Download and install Logstash
RUN cd /var/software
RUN wget -c https://artifacts.elastic.co/downloads/logstash/logstash-6.3.0.deb

RUN dpkg -i logstash-6.3.0.deb

# Download and install Elastic Search
RUN wget -c https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.0.deb
RUN dpkg -i elasticsearch-6.3.0.deb

# Download and install Kibana
RUN wget -c https://artifacts.elastic.co/downloads/kibana/kibana-6.3.0-amd64.deb
RUN dpkg -i kibana-6.3.0-amd64.deb

# Configure Logstash
RUN mkdir -p /usr/share/logstash/drivers && cd  /usr/share/logstash/drivers
RUN wget -c https://jdbc.postgresql.org/download/postgresql-42.2.2.jar

COPY /home/siju/Conf/logstash/db.conf /usr/share/logstash/db.conf

# Remove retrieved package files from local cache
#RUN apt-get clean

# Cleanup unwanted files
#RUN rm -rf /var/lib/apt/lists/

# -------------------------END----------------------------------------#
