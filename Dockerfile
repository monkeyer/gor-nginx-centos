FROM centos

MAINTAINER 15950194@qq.com

# Variables

# ENV GOR_VERSION 0.16.1

# Update Centos

RUN yum update -y && \
    yum install -y zlib zlib-devel pcre pcre-devel openssl openssl-devel wget make gcc gcc-c++

# set workdir

RUN cd / && mkdir downloads

WORKDIR /downloads

# Install nginx

RUN wget https://nginx.org/download/nginx-1.10.1.tar.gz && \
    tar -zxvf nginx-1.10.1.tar.gz && \
    cd nginx-1.10.1 && ./configure && \
    make && make install && \
    cd /usr/local/nginx/sbin && \
    ./nginx

# update timezone

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Install goreplay

COPY ./gor/goreplay /usr/local/bin/gor

#RUN gor --input-raw :80 –-output-file requests.gor


