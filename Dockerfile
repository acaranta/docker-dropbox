FROM ubuntu:14.04
MAINTAINER arthur@caranta.com
RUN apt-get update && apt-get install -y psmisc
ADD https://www.dropbox.com/download?plat=lnx.x86_64 /dropbox.tgz
RUN tar xfvz /dropbox.tgz && rm /dropbox.tgz
ADD https://www.dropbox.com/download?dl=packages/dropbox.py /usr/bin/dropbox.py 
RUN chmod +x /usr/bin/dropbox.py


CMD while true ; do echo "Restarting Dropbox Daemon" ;killall -9 /.dropbox-dist/dropboxd; /.dropbox-dist/dropboxd; done
