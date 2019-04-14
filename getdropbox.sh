#!/bin/bash 

if [[ $(< /.dropbox-dist/VERSION) != $(curl -sIkL "https://www.dropbox.com/download?plat=lnx.x86_64" |grep Location |sed 's/.*dropbox-lnx.x86_64-//g' | sed 's/.tar.gz.*//g') ]] ; 
then
  echo Download New Version 
  cd /
  curl -C - -L -o /dropbox.tgz "https://www.dropbox.com/download?plat=lnx.x86_64"
  tar xfvz /dropbox.tgz 
  rm /dropbox.tgz
  curl -L -o /usr/bin/dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py"
  chmod +x /usr/bin/dropbox.py
else
  echo Already Up To date
fi

