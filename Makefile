run: migrate
	bin/rails server

lint:
	rubocop -l

lint-fix:
	rubocop -A

migrate:
	bin/rails db:migrate
