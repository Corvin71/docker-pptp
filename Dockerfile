FROM centos:7

MAINTAINER Kevin Printz <printz.kevin@gmail.com>

RUN yum -y install epel-release
RUN yum -y install pptpd

RUN echo "localip 192.168.10.1" >> /etc/pptpd.conf && \
    echo "remoteip 192.168.10.10-20" >> /etc/pptpd.conf && \
    echo "ms-dns 8.8.8.8" >> /etc/ppp/options.pptpd && \
    echo "ms-dns 8.8.4.4" >> /etc/ppp/options.pptpd

EXPOSE 1723

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0700 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pptpd","--fg"]
