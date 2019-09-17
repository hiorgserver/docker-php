FROM debian:stretch-slim

ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN \
    php_version=7.0 \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates git curl unzip apt-transport-https \
        php${php_version}-mysqli \
        php${php_version}-cli \
        php${php_version}-mcrypt \
        php${php_version}-mbstring \
        php${php_version}-curl \
        php${php_version}-soap \
        php${php_version}-xml \
        php${php_version}-zip \
        php${php_version}-gd \
        wget \
    && apt-get autoclean \
    && apt-get clean \
    && apt-get autoremove \
    && curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin \
    && rm -rf /root/.composer /tmp/* /var/lib/apt/lists/*
