# docker-fivem-server

This is *not* an official FiveM docker image.

FiveM Dockerfile with a docker-compose example
https://hub.docker.com/r/altshiftzero/fivem


# Using docker cli
```
docker pull altshiftzero/fivem
```

You still need a mariadb/mysql server for some functionality of this server. When using the docker-compose file in this repository you have a complete working set-up for FiveM. Please make sure you change the ***changeme*** text in the docker-compose file for the root password.

```
version: '3'
volumes:
  database_data:
  fivem_data:
services:
  fivem:
    image: altshiftzero/fivem:latest
    ports:
      - 40120:40120
      - "30120:30120/tcp"
      - "30120:30120/udp"
    volumes:
      - fivem_data:/opt/FiveM/txData
    links:
      - database
  database:
    image: mariadb:latest
    environment:
      MYSQL_ROOT_PASSWORD: ***CHANGEME***
    volumes:
      - database_data:/var/lib/mysql
```

FiveM is a Cfx.re project: https://github.com/citizenfx/fivem/
