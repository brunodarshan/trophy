run:
	docker-compose up

build:
	docker-compose build

create:
	docker-compose run --rm app rails db:create

migrate:
	docker-compose run --rm app rails db:migrate

seed:
	docker-compose run --rm app rails db:seed

db_resume: create migrate seed

make kill:
	docker-compose down

make prepare: kill build db_resume