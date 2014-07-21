FROM debian:wheezy

## Base packages
RUN apt-get update -qq && apt-get upgrade -y -qq
RUN apt-get install -y python2.7 python-pip
######

## Zerobin installation
RUN pip install zerobin
######

# Create some folder
RUN mkdir -p /var/zerobin/content
RUN mkdir -p /etc/zerobin/
######

# Adds custom config in the right place
ADD settings.py /etc/zerobin/settings.py
######

 
EXPOSE 8000
CMD ["zerobin", "--settings-file", "/etc/zerobin/settings.py"]
