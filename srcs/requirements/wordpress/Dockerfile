FROM debian:buster

RUN apt-get update && apt-get install -y php-fpm php-mysql curl  && apt-get install mariadb-server -y
# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y php-fpm php-mysqli curl\
#     && apt-get install -y mariadb-server
COPY ./tools/wp-config.php /

COPY ./tools/script.sh /

CMD ["bash","script.sh"]
