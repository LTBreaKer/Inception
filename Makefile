
all:
	docker-compose --project-directory "srcs/" up -d

down:
	docker-compose --project-directory "srcs/" down

fclean: down
	docker rmi nginx mariadb wordpress adminer portainer

vclean:
	sudo rm -rf /home/aharrass/data/wordpress/* /home/aharrass/data/mariadb/* 

re: fclean vclean all