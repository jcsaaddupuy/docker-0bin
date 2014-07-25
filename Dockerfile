FROM debian:wheezy

## Base packages
RUN apt-get update -qq && apt-get upgrade -y -qq
RUN apt-get install -y python2.7 python-pip
######

## Zerobin installation
RUN pip install zerobin
######

# Create some folder
RUN mkdir -p /data
RUN mkdir -p /conf
######

# Adds custom config in the right place
ADD settings.py /conf/settings.py
######

 
EXPOSE 8000
CMD ["zerobin", "--settings-file", "/conf/settings.py"]
