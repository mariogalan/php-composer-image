FROM ubuntu:18.04

MAINTAINER Mario Galan <mario.galan@gmail.com>

EXPOSE 80 8080 8000 9000

ENV TZ 'Europe/Madrid'
RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean


RUN apt-get install -y git curl php-cli php7.1-dom

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=bin --filename=composer

CMD [']