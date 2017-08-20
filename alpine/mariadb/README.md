
This directory contains all the information needed to build this image.
The Git repository for this image build files is

https://github.com/sgeorge/dockerfiles/tree/master/alpine/mariadb

You can build this image using the command

$ sudo docker build -t <anyrepository>/<any-image-name>

You can customize the Dockerfile.

Refer https://docs.docker.com/engine/reference/builder/

You can also customize the configuration files

If you donot want to build your own customized image you could
use the images in Docker Hub which were built using these files

Repository: https://hub.docker.com/u/broadtech/

Usage HowTo: https://github.com/sgeorge/dockerfiles/wiki

 To deploy mariadb on alpine just run this single command

     $ sudo run -e "MYSQL_ROOT_PASSWORD=<your-password>" broadtech/alpine-mariadb

 To run mariadb in the background use the "-d" option

     $ sudo run -d "MYSQL_ROOT_PASSWORD=<your-password>" broadtech/alpine-mariadb     

 To connect to mariadb server use

     $ mysql -u root -h <containerIPAddress> -p

Use the password you provided on the commandline to establish connection to the
server

 To find the <containerIPAddress>

    $ sudo docker inspect <containerID> | grep IPAddress

 To find the containerID

    $ sudo docker ps

 To run a shell in the container to make modifications before
 the container starts

    $ sudo docker run -it --entrypoint="/bin/sh" broadtech/alpine-mariadb

Why Alpine Linux?

Ans: Small, Simple, Secure.

     https://github.com/sgeorge/dockerfiles/wiki/Images-and-customization-information

     https://alpinelinux.org/about/

Docker Hub Image Repository:

     https://hub.docker.com/r/broadtech/alpine-mariadb

WiKi:

     https://github.com/sgeorge/dockerfiles/wiki/MariaDB-MySQL-Server
