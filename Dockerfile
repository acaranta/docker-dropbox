FROM ubuntu:14.04
MAINTAINER arthur@caranta.com
RUN apt-get update && apt-get install -y psmisc curl
RUN mkdir /.dropbox-dist && touch /.dropbox-dist/VERSION

ADD getdropbox.sh /
RUN /getdropbox.sh

CMD while true ; do /getdropbox.sh ; echo "Restarting Dropbox Daemon" ;killall -9 /.dropbox-dist/dropboxd; /.dropbox-dist/dropboxd ; sleep 5 ; done
