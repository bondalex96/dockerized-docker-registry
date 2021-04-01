deploy:
	ansible-playbook --extra-vars "@env.json" -i hosts.yml setup.yml

install-dependencies:
	ansible-galaxy install -r requirements.yml
