
docker.build:
	docker-compose build

run:
	HOST_USER=$(id -u) HOST_GROUP=$(id -g) docker-compose up

run.detached:
	HOST_USER=$(id -u) HOST_GROUP=$(id -g) docker-compose up -d

stop:
	docker-compose stop

restart:
	docker-compose restart

cert.generate:
	docker-compose stop
	rm -f ./certs/localhost.pem ./certs/localhost-key.pem
	docker-compose up
