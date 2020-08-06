all: docker-container

PREFIX?=registry.aliyuncs.com/acs
VERSION?=v1.0.0

docker-container:
	docker build --pull -t  $(PREFIX)/custom-sys-image:$(VERSION) -f builder/Dockerfile .

.PHONY: all docker-container