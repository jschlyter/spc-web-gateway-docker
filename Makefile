VERSION=	1.5
SOURCE_DIR=	spc-web-gateway-$(VERSION)
CONFIG_DIR=	$(shell pwd)/etc
AUTH_FILES=	edp_key passwd_get passwd_put passwd_ws license
IMAGE_NAME=	spc-web-gateway


build:
	docker build \
		--pull \
		--build-arg VERSION=$(VERSION) \
		--build-arg SOURCE_DIR=$(SOURCE_DIR) \
		--tag $(IMAGE_NAME):$(VERSION) \
		--tag $(IMAGE_NAME):latest \
		.

etc:
	mkdir etc

config:
	install -d $(CONFIG_DIR)
	install -d $(CONFIG_DIR)/auth
	cp $(SOURCE_DIR)/config.xml $(CONFIG_DIR)/
	for file in $(AUTH_FILES); do cp $(SOURCE_DIR)/auth/$$file $(CONFIG_DIR)/auth; done

bootstrap:
	docker run -it --rm \
		--network host \
		--entrypoint /opt/spc-web-gateway/bootstrap.sh \
		--volume $(CONFIG_DIR)/auth:/opt/spc-web-gateway/auth:z \
		--volume $(CONFIG_DIR)/config.xml:/opt/spc-web-gateway/config.xml:ro \
		$(IMAGE_NAME):latest

test:
	docker run -it --rm \
		--network host \
		--volume $(CONFIG_DIR)/auth:/opt/spc-web-gateway/auth:z \
		--volume $(CONFIG_DIR)/config.xml:/opt/spc-web-gateway/config.xml:ro \
		$(IMAGE_NAME):latest
