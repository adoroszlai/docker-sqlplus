TRAVIS_BRANCH ?= master
TAG ?= $(subst master,latest,$(TRAVIS_BRANCH))

build:
	docker build --no-cache -t $(DOCKER_USERNAME)/sqlplus:build .

deploy:
	docker tag $(DOCKER_USERNAME)/sqlplus:build $(DOCKER_USERNAME)/sqlplus:$(TAG)
	docker push $(DOCKER_USERNAME)/sqlplus:$(TAG)
