include .env
export

deploy: ## Deploy
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'mkdir -p registry'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'rm -rf registry/docker-compose.yml registry/.env'
	scp -o StrictHostKeyChecking=no docker-compose.yml ${SSH_HOST}:registry/docker-compose.yml
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'docker run --rm httpd sh -c "htpasswd -Bbn ${AUTH_USER} ${AUTH_PASSWORD}" > registry/htpasswd'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'echo "DOMAIN_NAME=${DOMAIN_NAME}" >> registry/.env'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'echo "EMAIL=${EMAIL}" >> registry/.env'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'echo "CACHE_DOMAIN_NAME=${CACHE_DOMAIN_NAME}" >> registry/.env'
	ssh -o StrictHostKeyChecking=no ${SSH_HOST} 'cd registry && docker-compose up --build --remove-orphans -d'
