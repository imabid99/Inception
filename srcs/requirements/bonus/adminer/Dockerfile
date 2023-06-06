FROM debian:buster

RUN apt-get update && apt-get install -y wget && apt-get install php php-mysql -y

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
    -O /var/www/html/wop/index.php

WORKDIR /var/www/html/wop

CMD [ "php", "-S", "0.0.0.0:8080" , "index.php" ]