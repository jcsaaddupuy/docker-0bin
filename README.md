docker-0bin
===========

A base debian jessie with [0bin](https://github.com/sametmax/0bin) installed.

Default settings
================
The default settings.py contains the folowing config :

```
HOST = "0.0.0.0"
PORT = "8000"
# Encrypted pastes will be saved in this location
PASTE_FILES_ROOT = "/data/0bin"
```

You can also set the CMD at container runtime and pass more options.

> Note that only certain options can be passed via the cli. See more below ("Build your own")

How to use it
=============

Build it
--------
```
docker build -t 0bin .
```

Simple launch :
```
docker run -p 8000:8000 -d 0bin
```

To make data persistent accross container restart :
```
# Create a folder for datas on the host
mkdir /some/location
# laucn the container with the host folder mounted as a data volume
docker run -p 8000:8000 -v /some/location/:/data -d 0bin
```

Build your own
==============
Depending on your wanted customizations, you can either sepcify a different
CMD at runtime passing certain options or build a custom Dockerfile and a
custom settings.py file in the same folder.

Look at [the default config file](https://github.com/sametmax/0bin/blob/master/zerobin/default_settings.py) for availables settings.

Create a Dockerfile containing:

```
FROM jcsaaddupuy/0bin

# Adds custom config in the right place
ADD settings.py /conf/settings.py
```

You can build it / start it in the same way.


