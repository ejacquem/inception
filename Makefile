
all:
	cd srcs && docker compose up -d --build

up:
	cd srcs && docker compose up -d

down:
	cd srcs && docker compose down

build:
	cd srcs && docker compose build --progress=plain --no-cache

re: down build up
