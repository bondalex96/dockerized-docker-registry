
Сейчас не работает, как нужно. Похоже, что в Dockerfile не пробрасываются переменные среды.
Временная инструкция:
1. Скопировать provisioning/env.json.dist в provisioning/env.json и прописать свои значения
2. Скопировать provisioning/hosts.yml.dist в provisioning/hosts.yml и прописать адрес хоста
3. Запустить `cd provisioning && make install-dependencies && cd -` для установки зависимостей
4. Запустить `cd provisioning && make deploy && cd -` для конфигурирования хоста
5. Скопировать .env.dist в .env и прописать свои значения
6. Запустить make deploy
7. Перейти на {domain_name}/v2/_catalog

При обновлении следует удалить папку letsencrypt и проделать все действия по новой.
