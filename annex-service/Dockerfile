FROM ubuntu:16.04

MAINTAINER Matthew Forrester <github@speechmarks.com>

ENV REPO_NAME "The Repo"
VOLUME /repos /repos
EXPOSE 7000

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get install -y \
        git-annex \
    && apt-get clean -y

RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y nginx
RUN mkdir /annex-boot

ADD boot /annex-boot/boot
ADD annex /annex-boot/annex
ADD proxy /annex-boot/proxy
ADD nginx.conf.tpl /annex-boot/nginx.conf.tpl

# CMD ["/annex-boot", "/repos", "$REPO_NAME", "$YOUR_NAME", "$YOUR_EMAIL", "7000"]
CMD /annex-boot/boot "/repos" "$REPO_NAME" "$YOUR_NAME" "$YOUR_EMAIL" "7000"
# CMD git -C "$REPO_DIR" annex webapp
