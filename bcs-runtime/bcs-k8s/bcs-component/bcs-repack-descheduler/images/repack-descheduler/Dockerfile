FROM centos:7
RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo && sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo && sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo

#for command envsubst
RUN yum install -y gettext

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'LANG="en_US.UTF-8"' > /etc/locale.conf
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN mkdir -p /data/bcs/logs/bcs

ADD bcs-repack-descheduler /data/bcs/bcs-repack-descheduler/
ADD bcs-repack-descheduler.json.template /data/bcs/bcs-repack-descheduler/
ADD container-start.sh /data/bcs/bcs-repack-descheduler/

RUN chmod +x /data/bcs/bcs-repack-descheduler/container-start.sh
RUN chmod +x /data/bcs/bcs-repack-descheduler/bcs-repack-descheduler

WORKDIR /data/bcs/bcs-repack-descheduler/
CMD [ "/data/bcs/bcs-repack-descheduler/container-start.sh" ]
