FROM ubuntu:18.04
MAINTAINER 121

RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors\.tuna\.tsinghua\.edu\.cn\/ubuntu\//g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    tar supervisor rsync

ENV LANG zh_CN.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y tzdata ntpdate && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

COPY ZenTaoPMS.11.5.1.zbox_64.tar.gz /
RUN tar -zxvf /ZenTaoPMS.11.5.1.zbox_64.tar.gz -C /opt

RUN mkdir /logs
COPY ./zentao.conf /etc/supervisor/conf.d/

CMD [ "supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
