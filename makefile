.PHONY: default
default:
	@# Do nothing

.PHONY: build
build:
	@docker build -t veupathdb/alpine-dev-base:jdk-22-gradle-8.7 .
