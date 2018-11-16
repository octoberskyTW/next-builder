FROM ubuntu:18.04
MAINTAINER Dung-Ru  <octobersky.tw@gmail.com>
RUN apt-get update && apt-get install -y --fix-missing \
bison curl flex g++ libx11-dev libxml2-dev libxt-dev libmotif-common \
libmotif-dev make openjdk-8-jdk python2.7-dev swig zlib1g-dev \
llvm llvm-dev clang libclang-dev libudunits2-dev
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

CMD echo 'Going to install Armadillo'
RUN apt-get update && apt-get install -y --fix-missing libopenblas-dev libboost-dev libboost-all-dev cmake
COPY armadillo-9.200.4.tar.xz /tmp/
WORKDIR /tmp/
RUN tar -Jxvf armadillo-9.200.4.tar.xz
WORKDIR /tmp/armadillo-9.200.4
RUN ./configure && make && make install

CMD echo 'Going to install NASA Trick'
ADD ./trick /tmp/trick
WORKDIR /tmp/trick
RUN ./configure && make && make install

