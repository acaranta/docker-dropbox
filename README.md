docker-dropbox
===================
A headless containerized docker container for dropbox.

==How to use

```
#first create the persistent file paths (ie in /srv) :
mkdir -p /srv/dropbox/{data,conf}
#then run the dropbox container for the first time :
docker run --rm -ti -v /srv/dropbox/conf:/.dropbox -v /srv/dropbox/data:/Dropbox acaranta/docker-dropbox

# Dropbox will then tell you to visit a link
#in your browser to link this container
#to your dropbox account
# Once done, kill the container you juste launched [CTRC]+C just work
#and run :
docker run -d -v /srv/dropbox/conf:/.dropbox -v /srv/dropbox/data:/Dropbox acaranta/docker-dropbox
```

==Source
the Dockerfile is greatly inspired from https://github.com/CenturyLinkLabs/ctlc-docker-dropbox
hence the LICENSE ;)
