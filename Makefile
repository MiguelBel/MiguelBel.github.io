up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

shell:
	docker-compose run app /bin/sh

deploy:
	time sh deploy.sh

check-links:
	docker-compose run app htmlproofer --checks-to-ignore=ImageCheck ./_site
