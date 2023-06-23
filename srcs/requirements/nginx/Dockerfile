FROM debian:buster

RUN apt-get update && apt-get install nginx -y && apt-get install openssl 

COPY /conf/default /etc/nginx/sites-enabled/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=imabid.42.fr"

CMD ["nginx", "-g", "daemon off;"]
