run:
	docker-compose up

build:
	docker-compose build

db_resume:
	docker-compose run --rm app rails db:create db:migrate db:seed

make kill:
	docker-compose down

make prepare: kill build db_resume