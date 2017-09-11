FROM ubuntu:16.04
MAINTAINER Yun Tse Wu <windsor106@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget curl && \
    wget --no-check-certificate --content-disposition "http://www.opscode.com/chef/download-server?p=ubuntu&pv=16.04&m=x86_64&v=12&prerelease=false&nightlies=false" && \
    dpkg -i chef-server*.deb && \
    rm chef-server*.deb && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*
COPY run.sh configure_chef.sh /usr/local/bin/
VOLUME /var/log
CMD ["run.sh"]
