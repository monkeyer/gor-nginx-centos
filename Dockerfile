FROM centos

MAINTAINER 15950194@qq.com

# Variables

# ENV GOR_VERSION 0.16.1

# Update Centos

RUN yum update -y && \
    yum install -y zlib zlib-devel pcre pcre-devel openssl openssl-devel wget make gcc gcc-c++

# Install nginx

RUN cd / && mkdir downloads && cd /downloads && \
    wget https://nginx.org/download/nginx-1.10.1.tar.gz && \
    tar -zxvf nginx-1.10.1.tar.gz && \
    cd nginx-1.10.1 && ./configure && \
    make && make install && \
    cd /usr/local/nginx/sbin && \
    ./nginx

# update timezone

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Install goreplay

RUN cd /download && \
    wget https://github.com/buger/goreplay/releases/download/v0.16.1/gor_0.16.1_x64.tar.gz && \
    tar xzvf gor_0.16.1_x64.tar.gz && \
    cp goreplay /usr/local/bin/gor

#RUN gor --input-raw :80 –-output-file requests.gor


