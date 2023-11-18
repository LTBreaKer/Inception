
all:
	docker-compose --project-directory "srcs/" up -d --build

down:
	docker-compose --project-directory "srcs/" down -v

fclean: down
	docker rmi nginx mariadb wordpress adminer portainer hugo redis ftp

vclean:
	sudo rm -rf /home/aharrass/data/wordpress/* /home/aharrass/data/mariadb/* 

re: fclean vclean all