run:
	docker-compose up

build:
	docker-compose build

drop:
	docker-compose run --rm app rails db:drop

create:
	docker-compose run --rm app rails db:create

migrate:
	docker-compose run --rm app rails db:migrate

seed:
	docker-compose run --rm app rails db:seed

console:
	docker-compose run --rm app rails console

db_resume: drop create migrate seed

make kill:
	docker-compose down

prepare: kill build db_resume

run_tests: 
	docker-compose run --rm app bin/bundle exec rspec spec -f d