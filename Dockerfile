FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN \
	apt-get update \
	&& apt-get -y install wget apt-transport-https lsb-release ca-certificates curl \
	&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
	&& sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
    && php_version=8.0 \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        git unzip \
        php${php_version}-apcu \
        php${php_version}-bcmath \
        php${php_version}-cli \
        php${php_version}-curl \
        php${php_version}-dom \
        php${php_version}-gd \
        php${php_version}-imagick \
        php${php_version}-intl \
        php${php_version}-mbstring \
        php${php_version}-mysqli \
        php${php_version}-soap \
        php${php_version}-xml \
        php${php_version}-zip \
        php${php_version}-dev \
        libyaml-0-2 \
        libyaml-dev \
        php-pear \
    && pecl install yaml \
    && rm /etc/localtime && echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get autoremove && apt-get autoclean && apt-get clean \
    && curl -sSL https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin \
    && rm -rf /root/.composer /tmp/* /var/lib/apt/lists/*
