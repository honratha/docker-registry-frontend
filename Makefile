IMAGE_NAME=registry-ui

all: compile redeploy

compile:
	docker run --rm -it -v $(shell pwd):/app -w /app digitallyseamless/nodejs-bower-grunt sh -c '\
		npm install --silent && \
		bower install --silent --config.interactive=false && \
		grunt build --force \
	'

build:
	docker build -t $(IMAGE_NAME) .

redeploy:
	docker-compose stop frontend && docker-compose rm -f frontend && docker-compose build && docker-compose up -d
