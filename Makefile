
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
.DEFAULT_GOAL := help

update:  ## update project dependencies locally (run after git update)
	poetry update
.PHONY: update

install:  ## install poetry dependencies locally (run after git install)
	poetry install
.PHONY: install

build:  ## build documentation
	poetry run mkdocs build
.PHONY: build

serve: build  ## build and serve documentation locally
	poetry run mkdocs serve
.PHONY: serve

clean:  ## remove generated documents
	rm -rf site/
.PHONY: clean

help: Makefile  ## print help
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
