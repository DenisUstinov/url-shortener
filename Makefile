export

CONFIG_PATH = ./config/local.yaml

up:
	docker compose  up --build -d --force-recreate
	docker compose logs -f

down:
	docker compose down

mod:
	go mod tidy
