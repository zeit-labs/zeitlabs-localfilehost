
docker.build:
	docker-compose build

run:
	HOST_USER=$(id -u) HOST_GROUP=$(id -g) docker-compose up

cert.generate:
	docker-compose stop
	rm -f ./certs/localhost.pem ./certs/localhost-key.pem
	docker-compose up
