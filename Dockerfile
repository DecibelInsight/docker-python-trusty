FROM ubuntu:14.04
MAINTAINER Mike Christof <mhristof@gmail.com>

ARG python_version=2.7.6
ARG python_md5=bcf93efa8eaf383c98ed3ce40b763497
RUN apt-get update && apt-get install -y build-essential wget zlib1g-dev libssl-dev

RUN wget --quiet https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz &&\
        echo "$python_md5  Python-2.7.6.tar.xz" > python_tar.md5 &&\
        md5sum --check python_tar.md5 &&\
        tar xf Python-2.7.6.tar.xz &&\
        cd Python-2.7.6 &&\
        ./configure &&\
        make &&\
        make install &&\
        cd ../ &&\
        rm -rf Python-2.7.6 Python-2.7.6.tar.xz
RUN wget --quiet https://bootstrap.pypa.io/get-pip.py &&\
        python get-pip.py &&\
        rm -rf get-pip.py
ENV PATH /root/.local/bin:$PATH
