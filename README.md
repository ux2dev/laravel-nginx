## Overview
This is a Dockerfile/image to build a container for Laravel apps using NGINX as a server
## How to run it?
```bash
docker run -v "<your-project-folder>:/var/www/html" -p 80:80 443:443 ux2dev/laravel-nginx
```
## How to use it with sail?
### Before (docker-compose.yml)
```yml
services:
    laravel.test:
        build:
            context: ./docker/8.0
            dockerfile: Dockerfile
            args:
                WWWGROUP: '${WWWGROUP}'
        image: sail-8.0/app
        extra_hosts:
            - 'host.docker.internal:host-gateway'
        ports:
            - '${APP_PORT:-80}:80'
        environment:
            WWWUSER: '${WWWUSER}'
            LARAVEL_SAIL: 1
            XDEBUG_MODE: '${SAIL_XDEBUG_MODE:-off}'
            XDEBUG_CONFIG: '${SAIL_XDEBUG_CONFIG:-client_host=host.docker.internal}'
        volumes:
            - '.:/var/www/html'
        networks:
            - sail
        depends_on:
            - mysql
            - redis
            - meilisearch
            - selenium
...
```
### After (docker-compose.yml)
```yml
services:
    laravel.test:
        image: ux2dev/laravel-nginx
        extra_hosts:
            - 'host.docker.internal:host-gateway'
        ports:
            - '<whichever-port-is-convenient>:80'
            - '<whichever-port-is-convenient>:443'
        volumes:
            - '.:/var/www/html'
        networks:
            - sail
        depends_on:
            - mysql
            - redis
            - meilisearch
            - selenium
...
```
