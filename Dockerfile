FROM php:7.1-fpm

ENV CADDY_HOSTNAME=0.0.0.0

# Install the confd binary
ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd \
    && mkdir -p /etc/confd/conf.d /etc/confd/templates

COPY confd-configs/conf.d/ /etc/confd/conf.d/
COPY confd-configs/templates/ /etc/confd/templates/
COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]