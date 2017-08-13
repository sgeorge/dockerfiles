
This folder contains

    1. Dockerfile to create a Docker Image that Deploys Nginx web
       server on Alpine Linux
    2. Configuration files for Nginx
    
You can build this image using the command

    $ sudo docker build -t <anyrepository>/<any-image-name>

You can customize the Dockerfile.  
Refer https://docs.docker.com/engine/reference/builder/

You can also customize the configuration files

If you donot want to build your own customized image you can
use the images in Docker Hub which were built using these files
Repository: https://hub.docker.com/u/broadtech/ 

To deploy Nginx:

    $ sudo docker run broadtech/alpine-nginx

Once the container starts you can get its container ID

    $ sudo docker ps

Once you get the container ID you can get its IP Address

    $ sudo docker inspect <container ID> |grep IPAddress

Once you get the IP Address point your browser to it
 
    http://IPAddress

You will get more details about the image and how to use it


To run the container in the background use the "-d" option

    $ sudo docker run -d broadtech/alpine-nginx

To run a shell in the container to make modifications before 
the container starts

    $ sudo docker run -it --entrypoint="/bin/sh" broadtech/alpine-nginx

You can place the files you want to serve using Nginx in
    
    /var/www/localhost/htdocs

directory

For detailed Documentation on customization please visit

    https://github.com/sgeorge/dockerfiles/wiki/Nginx-Simple-Webserver
    

