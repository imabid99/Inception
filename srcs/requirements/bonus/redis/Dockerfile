FROM debian:buster

RUN apt-get update && \
    apt-get install -y redis-server

COPY /tools/redis.conf /etc/redis/redis.conf

CMD ["redis-server", "/etc/redis/redis.conf"]