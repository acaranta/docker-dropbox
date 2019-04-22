#!/bin/bash 
WEBVERSION=$(curl -sIkL "https://www.dropbox.com/download?plat=lnx.x86_64" |grep Location |sed 's/.*dropbox-lnx.x86_64-//g' | sed 's/.tar.gz.*//g') 
LOCALVERSION=$(< /root/.dropbox-dist/VERSION)
# Verison comparison source : https://stackoverflow.com/questions/4023830/how-to-compare-two-strings-in-dot-separated-version-format-in-bash
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

echo 
echo "| Local version : $LOCALVERSION "
echo "|   Web Version : $WEBVERSION"
echo

vercomp $WEBVERSION $LOCALVERSION
OPCODE=$?

if [[ $OPCODE == 1 ]] ;
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

