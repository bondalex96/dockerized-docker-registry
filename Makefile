.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-17s\033[0m %s\n", $$1, $$2}'
.PHONY: help

include .env
export

change-password: ## Change password
	docker-compose run --rm registry /scripts/change-password.sh

connect-registry: ## Connect registry container
	docker-compose exec registry sh

generate-htpasswd: ## Generate httpasswd
	docker run --rm httpd sh -c "htpasswd -Bbn ${AUTH_USER} ${AUTH_PASSWORD}" > htpasswd

deploy: ## Deploy
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'mkdir -p registry'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'rm -rf registry/docker-compose.yml registry/.env'
	scp -o StrictHostKeyChecking=no docker-compose.yml ${SSH_HOST}:registry/docker-compose.yml
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'docker run --rm httpd sh -c "htpasswd -Bbn ${AUTH_USER} ${AUTH_PASSWORD}" > registry/htpasswd'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'echo "DOMAIN_NAME=${DOMAIN_NAME}" >> registry/.env'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'echo "EMAIL=${EMAIL}" >> registry/.env'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'cd registry && docker-compose up --build --remove-orphans -d'
