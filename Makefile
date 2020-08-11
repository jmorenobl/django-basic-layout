.PHONY: startdb
startdb:
	docker run -d --name {{project_name}}_db \
		-v {{project_name}}_data:/var/lib/postgresql/data \
		-p 5432:5432 \
		-e POSTGRES_HOST_AUTH_METHOD=trust \
		postgres:12

.PHONY: removedb
removedb:
	docker stop {{project_name}}_db
	docker rm -v {{project_name}}_db

.PHONY: logsdb
logsdb:
	docker logs -f {{project_name}}_db

.PHONY: createdb
createdb:
	docker exec -it {{project_name}}_db createdb -U postgres {{project_name}}

.PHONY: setup
setup:
	pre-commit install
