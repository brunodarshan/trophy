run:
	docker-compose up

build:
	docker-compose build

prepare:
	docker-compose run --rm app rails db:create db:migrate db:seed

make kill:
	docker-compose down