#!/bin/bash 
WEBVERSION=$(curl -sIkL "https://www.dropbox.com/download?plat=lnx.x86_64" |grep Location |sed 's/.*dropbox-lnx.x86_64-//g' | sed 's/.tar.gz.*//g') 
LOCALVERSION=$(< /root/.dropbox-dist/VERSION)

echo 
echo "| Local version : $LOCALVERSION "
echo "|   Web Version : $WEBVERSION"
echo

if [[ $LOCALVERSION != $WEBVERSION ]] ; 
then
  echo
  echo "+----------------------+"
  echo "| Download New Version |"
  echo "+----------------------+"
  cd /root
  curl -L -o /dropbox.tgz "https://www.dropbox.com/download?plat=lnx.x86_64"
  tar xfvz /dropbox.tgz 
  rm /dropbox.tgz
  curl -L -o /usr/bin/dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py"
  chmod +x /usr/bin/dropbox.py
else
  echo
  echo "+--------------------+"
  echo "| Already Up To date |"
  echo "+--------------------+"
fi

