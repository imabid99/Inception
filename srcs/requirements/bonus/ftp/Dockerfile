FROM  debian:buster


RUN apt-get update && apt-get install vsftpd -y

COPY ./tools/script.sh /

CMD ["bash","script.sh"]