#!/bin/sh
#
# Entrypoint scripts directory
DIR="/etc/docker-entrypoint.d"

# Run entrypoint scripts
if [ -d "$DIR" ]
then
	  /bin/run-parts "$DIR"
fi
#
############---END---########################

