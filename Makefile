
build:
	docker build -t spc-web-gateway .

test:
	docker run -it --rm --network host spc-web-gateway
