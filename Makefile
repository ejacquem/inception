
all:
	cd srcs && docker compose up -d --build

up:
	cd srcs && docker compose up -d

down:
	cd srcs && docker compose down --volumes

build:
	cd srcs && docker compose build --progress=plain --no-cache

space: down
	docker system prune -af --volumes

ls:
	@docker ps -a
	@docker images -a
	@docker volume ls
	@docker network ls

re: down build up
