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
# Create a folder for datas on the host
mkdir /some/location
# laucn the container with the host folder mounted as a data volume
docker run -p 8000:8000 -v /some/location/:/var/zerobin/content -d 0bin
```

Build your own
==============
You will need a custom Dockerfile and a custom settings.py file in the same folder.

Look at [the default config file](https://github.com/sametmax/0bin/blob/master/zerobin/default_settings.py) for availables settings.


Create a Dockerfile containing :

```
FROM jcsaaddupuy/0bin

# Adds custom config in the right place
ADD settings.py /etc/zerobin/settings.py

EXPOSE 8000
CMD ["zerobin", "--settings-file", "/etc/zerobin/settings.py"]
```
