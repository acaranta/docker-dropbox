FROM ubuntu:14.04
MAINTAINER arthur@caranta.com
RUN apt-get update && apt-get install -y psmisc curl libatomic1
RUN mkdir /root/.dropbox-dist && touch /root/.dropbox-dist/VERSION

ADD getdropbox.sh /
RUN /getdropbox.sh

WORKDIR /root

CMD while true ; do /getdropbox.sh ; echo "Cleaning Dropbox Processes" ;killall -9 $(ls /root/.dropbox-dist/dropbox-lnx*/dropbox) ; killall -9 /root/.dropbox-dist/dropboxd; echo "Restarting Dropbox" ; /root/.dropbox-dist/dropboxd ; sleep 5 ; done
