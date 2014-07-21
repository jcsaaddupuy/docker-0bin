FROM debian:wheezy

RUN apt-get update -qq && apt-get upgrade -y -qq
RUN apt-get install -y python2.7 python-pip
RUN apt-get install -y ipython python-ipdb

RUN pip install zerobin

RUN mkdir -p /var/zerobin/content
RUN mkdir -p /etc/zerobin/
RUN mkdir -p /var/zerobin/content

ADD settings.py /etc/zerobin/settings.py
 
EXPOSE 8000
CMD ["zerobin", "--settings-file", "/etc/zerobin/settings.py"]
