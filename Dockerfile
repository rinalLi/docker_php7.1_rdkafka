FROM rinalli/php7.1_nginx:latest
MAINTAINER rinalli php7.1_rdkafka <liguoqiang@hollo.cn>

RUN cd /var/www/html && git clone https://github.com/edenhill/librdkafka.git && cd librdkafka && \
    ./configure && make && make install && pecl install rdkafka

RUN echo "extension=rdkafka.so" > /etc/php/7.1/cli/conf.d/20-rdkafka.ini && \
    echo "extension=rdkafka.so" > /etc/php/7.1/fpm/conf.d/20-rdkafka.ini

RUN cd /var/www/html && rm -rf librdkafka
