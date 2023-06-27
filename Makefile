all : up

up : 
	@mkdir -p /Users/imabid/Desktop/Inception/srcs/wordpress
	@mkdir -p /Users/imabid/Desktop/Inception/srcs/mariadb
	# @mkdir -p /home/kali/data/mariadb
	# @mkdir -p /home/kali/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down : 
	@docker-compose -f ./srcs/docker-compose.yml down -v
	
status : 
	@docker ps

clean  : down
	@docker system prune --all --force --volumes