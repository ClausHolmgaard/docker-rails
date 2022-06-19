#! /bin/bash

DEV_SERVICE := dev

export USERID=$(shell id -u)
export GROUPID=$(shell id -g)

CMD_ARGUMENTS ?= $(cmd)
args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`


shell:
	docker compose run --rm $(DEV_SERVICE) /bin/bash

build:
	docker-compose build

rebuild:
	docker-compose build --no-cache

new:
	@echo "Creating new project $(call args)"
	docker compose run --rm $(DEV_SERVICE) rails new $(call args)

%:
	@: