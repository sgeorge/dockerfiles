
Please read the Dockerfile for this image, it is well commented.

 To deploy mariadb on alpine just run this single command

     $ sudo run broadtech/alpine-mariadb

 To run mariadb in the background use the "-d" option

     $ sudo run -d broadtech/alpine-mariadb

 To connect to mariadb server use
     $ mysql -u root -h <containerIPAddress> -pINSecure

CHANGE PASSWORDS FOR ALL 'root' users before final deployment
The current image allows user root@% to connect from anywhere
using default password 'INSecure'

 You cound customize this Dockerfile to create your own image
 Why Alpine Linux?
 Ans: Small, Simple, Secure. https://alpinelinux.org/about/

Docker Hub Image Repository

     https://hub.docker.com/r/broadtech/alpine-mariadb
