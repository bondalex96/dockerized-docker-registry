.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "[32m%-17s[0m %s\n", $$1, $$2}'
.PHONY: help

change-password: ## Change password
	docker-compose run --rm registry /scripts/change-password.sh

connect-registry: ## Connect registry container
	docker-compose exec registry sh