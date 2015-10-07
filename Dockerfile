FROM debian:jessie

## Set the 0bin version to install: https://pypi.python.org/pypi/zerobin
ENV ZEROBIN_VERSION 0.5

## Base packages
RUN apt-get update -qq && apt-get upgrade -y -qq
RUN apt-get install -y python2.7 python-pip
######

## Zerobin installation
RUN pip install zerobin==${ZEROBIN_VERSION}
######

# Create some folder
RUN mkdir -p /data
RUN mkdir -p /conf
######

# Adds custom config in the right place
ADD settings.py /conf/settings.py
######

EXPOSE 8000

ENTRYPOINT ["zerobin"]

## By default, we'll specify some basically acceptable defaults in a settings.py file. However, the CMD can be changed at runtime to pass other options: https://0bin.readthedocs.org/en/latest/en/options.html
CMD ["--settings-file", "/conf/settings.py", "--compressed-static"]
