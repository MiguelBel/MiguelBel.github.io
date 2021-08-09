up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

shell:
	docker-compose run app /bin/sh

release:
	time sh deploy.sh

today:
	sh today.sh

check-links:
	docker-compose run app htmlproofer --checks-to-ignore=ImageCheck ./_site

generate-bookshelf:
	docker-compose run app ruby _books/generate_bookshelf.rb

add-book:
	docker-compose run app ruby _books/add_book.rb $(abid)

add-domains-log:
	docker-compose run app ruby _log/add_domains.rb $(file)

add-log-entry:
	docker-compose run app ruby _log/add_entry.rb 'Fill your title' $(slug)
