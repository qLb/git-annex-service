FROM ubuntu:16.04

MAINTAINER Matthew Forrester <github@speechmarks.com>

# These three environmental variables are meant for customization
ENV NAME_OF_REPOS The Repository
ENV YOUR_NAME Mister Anonymous
ENV YOUR_EMAIL mister@anonymous.com

# Customize these also as per standard docker
VOLUME /repos /repos
EXPOSE 7000

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get install -y \
        git-annex \
        nginx \
    && apt-get clean -y

RUN mkdir /annex-boot

ENV LOCATION_OF_REPOS /repos

ADD boot /annex-boot/boot
ADD annex /annex-boot/annex
ADD proxy /annex-boot/proxy
ADD nginx.conf.tpl /annex-boot/nginx.conf.tpl

CMD /annex-boot/boot
