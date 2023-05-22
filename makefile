start:
	docker-compose up -d

build:
	copy .example.env .env
	docker-compose up --build -d

stop:
	docker-compose down
