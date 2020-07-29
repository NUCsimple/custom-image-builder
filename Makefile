all: docker-container

PREFIX?=registry.aliyuncs.com/acs
VERSION?=v1.0.0

docker-container:
	docker build --pull -t  $(PREFIX)/custom-sys-image:$(VERSION) -f builder/Dockerfile .

custom-build:
	docker run -v /data:/data  $(PREFIX)/custom-sys-image:$(VERSION)  /data/alicloud.json

.PHONY: all docker-container