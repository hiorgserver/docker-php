FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY yaml.ini /etc/php/7.3/mods-available/yaml.ini

RUN \
    php_version=7.3 \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates git curl unzip apt-transport-https \
        build-essential \
        php${php_version}-apcu \
        php${php_version}-bcmath \
        php${php_version}-cli \
        php${php_version}-curl \
        php${php_version}-dom \
        php${php_version}-gd \
        php${php_version}-intl \
        php${php_version}-mbstring \
        php${php_version}-mysqli \
        php${php_version}-soap \
        php${php_version}-xml \
        php${php_version}-zip \
        php${php_version}-dev \
        libyaml-dev \
        php-pear \
        wget \
    && pecl install yaml \
    && phpenmod -v ${php_version} yaml \
    && rm /etc/localtime && echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get autoremove && apt-get autoclean && apt-get clean \
    && curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin \
    && rm -rf /root/.composer /tmp/* /var/lib/apt/lists/*
