#######################################################################
# broadtech/odoo9
# This Dockerfile creates and image that deploys Odoo9
# To deploy Odoo9  on debian stretch just run this single command
#
#     $ sudo docker run broadtech/debian-stretch-odoo9:v1
#
# You could customize this Dockerfile to create your own image

# Base Image
FROM debian

LABEL "vendor"="BroadTech Innovations PVT LTD"
LABEL "vendor.url"="http://www.broadtech-innovations.com/"
LABEL "maintainer"="sgeorge.ml@gmail.com"

# Update Local Repository Index
RUN apt-get update

# Upgrade packages in base image and apply security updates
RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -yq

# Install Python dependencies for Odoo9
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
  python-dateutil python-docutils python-feedparser \
  python-jinja2 python-ldap python-libxslt1 python-lxml \
  python-mako python-mock python-openid python-psycopg2 \
  python-psutil python-babel python-pychart python-pydot \
  python-pyparsing python-reportlab python-simplejson python-tz \
  python-unittest2 python-vatnumber python-vobject python-webdav \
  python-werkzeug python-xlwt python-yaml python-zsi poppler-utils \
  python-pip python-pypdf2 python-passlib python-decorator

# Install supporting packages for Odoo9
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
  gcc python-dev mc bzr python-setuptools python-markupsafe \
  python-reportlab-accel python-zsi python-yaml python-argparse \
  python-openssl python-egenix-mxdatetime python-usb python-serial \
  python-jinja2 python-unittest2 python-mock python-docutils lptools \
  make python-pydot python-psutil python-paramiko poppler-utils \
  python-pdftools antiword

# Install Odoo9 web dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq npm
#RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g less@1.4.2 less-plugin-clean-css

# Some more
RUN pip install request pyPDF httpagentparser

# Set Timezone

# Others
RUN DEBIAN_FRONTEND=noninteractive apt-get install python-software-properties

# Create users & groups
RUN groupadd odoo
RUN useradd -m -g odoo odoo

# Specify Postgresql database
RUN echo "[options]
addons_path = /home/odoo/BTL_V9/addons
admin_passwd = odoo
csv_internal_sep = ,
data_dir = /home/odoo/.local/share/Odoo
db_host = 172.17.0.2
db_maxconn = 400
db_name = odoo
db_password = odoo
db_port = 5432
db_template = template1
db_user = odoo
dbfilter = .*
debug_mode = False
demo = {}
dev_mode = False
email_from = False
geoip_database = /usr/share/GeoIP/GeoLiteCity.dat
import_partial =
limit_memory_hard = 8605306368
limit_memory_soft = 8271088640

limit_request = 8192
limit_time_cpu = 2400
limit_time_real = 2400
list_db = True
log_db = False
log_db_level = warning
log_handler = :INFO
log_level = info
logfile = /var/log/odoo/odoo-server.log
logrotate = True
longpolling_port = 8072
max_cron_threads = 2
osv_memory_age_limit = 1.0
osv_memory_count_limit = False
pg_path = None
pidfile = None
#proxy_mode = False
proxy_mode = True

reportgz = False
server_wide_modules = None
smtp_password = False
smtp_port = 25
smtp_server = localhost
smtp_ssl = False
smtp_user = False
syslog = False
test_commit = False
test_enable = False
test_file = False
test_report_directory = False
translate_modules = ['all']
unaccent = False
without_demo = False

#workers = 8
workers = 0

xmlrpc = True
xmlrpc_interface = 127.0.0.1
xmlrpc_port = 8069" > /etc/odoo-server.conf

# Expose ports
# Odoo port
EXPOSE 8069

###############################################################################
