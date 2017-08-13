
This directory contains

    1. Dockerfile to build a Docker Image that deploys PHP7 FPM service
    2. Configuration files for php7-fpm

From this directory you can build the image using the command

    $ sudo docker build -t <anyrepository>/<any-image-name>

To customize the Dockerfile please refer 

    https://docs.docker.com/engine/reference/builder/
    https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/

To configure automated build on Docker HUB please refer

    https://docs.docker.com/docker-hub/builds/

If you do not wish to build your own customized image you can use the images
in Docker HUB which were built using these files

    Repository: https://hub.docker.com/u/broadtech/

To deploy PHP7-FPM

    $ sudo docker run broadtech/alpine-php7-fpm

Once the container starts you can get its container ID

    $ sudo docker ps

Once you get the container ID you can get its IP Address

    $ sudo docker inspect <container ID> |grep IPAddress

To run the container in the background use the "-d" option

    $ sudo docker run -d broadtech/alpine-php7-fpm

To run a shell in the container to make modifications before 
the container starts

    $ sudo docker run -it --entrypoint="/bin/sh" broadtech/alpine-php7-fpm

You can place the files you want to serve using php7-fpm in
    
    /var/www/localhost/htdocs

directory

For detailed Documentation on customization please visit

    https://github.com/sgeorge/dockerfiles/wiki/PHP-7-FPM
