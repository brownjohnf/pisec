VERSION= "0.0.1"

all: build_local prep

build_local:
	@docker build -t brownjohnf/pisec:$(VERSION) -f Dockerfile.local .

run: build_local
	@docker run -it \
		--rm \
		--env-file ./.env \
		--entrypoint /bin/bash \
		-v `pwd`/test:/test \
		brownjohnf/pisec:$(VERSION)

prep: build_local
	@cp Dockerfile.local Dockerfile && \
		sed -i 's/FROM.*$$/FROM resin\/rpi-raspbian:jessie-20160427/' Dockerfile

