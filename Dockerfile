FROM ubuntu:14.04
MAINTAINER lucas@rufy.com

ADD https://www.dropbox.com/download?plat=lnx.x86_64 /dropbox.tgz
RUN tar xfvz /dropbox.tgz && rm /dropbox.tgz

CMD while true ; do echo "Restarting Dropbox Daemon" ;/.dropbox-dist/dropboxd; done
