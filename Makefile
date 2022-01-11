
IMAGE_PREFIX ?= minotar

IMAGE_TAG := $(shell ./build/image-tag)


image:
	docker build -t $(IMAGE_PREFIX)/minotar.net:$(IMAGE_TAG) -f Dockerfile .

image-push:
	docker push $(IMAGE_PREFIX)/minotar.net:$(IMAGE_TAG)

image-run:
	docker run --rm -it -p 8080:80 $(IMAGE_PREFIX)/minotar.net:$(IMAGE_TAG)
