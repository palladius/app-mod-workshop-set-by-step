
SHELL := /bin/bash

build:
	docker build -t phpapp-gemini .

run: build
	docker run -it -p 8080:80 phpapp-gemini
