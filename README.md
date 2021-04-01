1. Скопировать provisioning/env.json.dist в provisioning/env.json и прописать свои значения
2. Скопировать provisioning/hosts.yml.dist в provisioning/hosts.yml и прописать адрес хоста
3. Запустить `cd provisioning && make install-dependencies && cd -` для установки зависимостей
4. Запустить `cd provisioning && make deploy && cd -` для конфигурирования хоста
5. Скопировать .env.dist в .env и прописать свои значения
6. Запустить make deploy
7. Проверить, что Docker Registry работает: переходим в браузере на https://{DOMAIN_NAME}/v2. 
8. Проверить, что зеркало публичного Docker Registry работает: переходим в браузере на а https://${CACHE_DOMAIN_NAME}/v2
