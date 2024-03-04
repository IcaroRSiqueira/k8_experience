bash:
	docker-compose run --rm web /bin/bash

setup:
	docker-compose build
	docker-compose run --rm web bash -c "bundler install && rails db:create db:migrate db:seed"

run:
	docker-compose run --service-ports --rm web

down:
	docker-compose down --remove-orphans