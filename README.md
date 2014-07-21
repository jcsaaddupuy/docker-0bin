docker-0bin
===========

A base debian wheezy with [0bin](https://github.com/sametmax/0bin) installed.

Default settings
================
The default settings.py contains the folowing config :

```
HOST = "0.0.0.0"
PORT = "8000"
# Encrypted pastes will be saved in this location
PASTE_FILES_ROOT = "/var/zerobin/content"
```

In the case you would want to access to the content folder from another container, 
the folder /var/zerobin/content is exported as a volume.

How to use it
=============

Simple launch :
```
docker run -p 8000:8000 -d 0bin
```

To make data persistent accross container restart :
```
# Create 
mkdir /some/location
docker run -p 8000:8000 -v /some/location/:/var/zerobin/content -d 0bin
```

