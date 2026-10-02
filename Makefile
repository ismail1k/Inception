up:
	docker compose -f srcs/docker-compose.yml up

down:
	docker compose -f srcs/docker-compose.yml down

build:
	docker compose -f srcs/docker-compose.yml build

list:
	docker compose -f srcs/docker-compose.yml ps -a

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v --remove-orphans
