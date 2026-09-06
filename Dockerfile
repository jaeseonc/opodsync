FROM php:8.5-alpine
LABEL Maintainer="jschoi260905 - BohwaZ <https://bohwaz.net/>" \
      Description="oPodSync"

# Setup document root
RUN mkdir -p /var/www/server/data

# Add application
WORKDIR /var/www/
COPY server /var/www/server/
COPY custom-php.ini /usr/local/etc/php/conf.d/custom-timeout.ini


EXPOSE 8080

VOLUME ["/var/www/server/data"]

ENV PHP_CLI_SERVER_WORKERS=2
#CMD ["php", "-S", "0.0.0.0:8080", "-t", "server", "server/index.php"]
CMD ["php", "-d", "max_execution_time=0", "-S", "0.0.0.0:8080", "-t", "server", "server/index.php"]
