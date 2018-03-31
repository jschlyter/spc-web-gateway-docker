
build:
	docker build -t spc-web-gateway .

test:
	docker run -it --rm spc-web-gateway
