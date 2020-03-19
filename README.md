Делал, взяв за основу инструкцию https://rtfm.co.ua/docker-zapusk-registry-server/

Сейчас не работает, как нужно. Похоже, что в Dockerfile не пробрасываются переменные среды.
Временная инструкция:
1. Скопировать репозиторий
2. Перейти в корень проекта
3. cp .env .env.dist
4. Поменять содержимое .env на свои значения 
5. Закомментировать в docker-compose.yml letsencrypt сервис
6. sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
7. . .env 
8. /opt/letsencrypt/letsencrypt-auto certonly -d ${DOMAIN_NAME} --non-interactive --agree-tos -m ${EMAIL} --standalone
9. sudo cp -r /etc/letsencrypt/* letsencrypt/
10. sudo chown -R ${USER} letsencrypt/
11. sudo chgrp -R ${USER} letsencrypt/
12. docker-compose up -d

При обновлении следует удалить папку letsencrypt и проделать все действия по новой.
