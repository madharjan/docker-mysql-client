# docker-mysql-client

[![Build Status](https://travis-ci.com/madharjan/docker-mysql-client.svg?branch=master)](https://travis-ci.com/madharjan/docker-mysql-client)
[![Layers](https://images.microbadger.com/badges/image/madharjan/docker-mysql-client.svg)](http://microbadger.com/images/madharjan/docker-mysql-client)

Docker container with PostgreSQL Client based on [gliderlabs/alpine](https://github.com/gliderlabs/docker-alpine/)

## Features

* Bats [bats-core/bats-core](https://github.com/bats-core/bats-core) based test cases

## PostgreSQL Client 10.1 (docker-mysql-client)

### Environment

| Variable             | Default      | Example        |
|----------------------|--------------|----------------|
| MYSQL_HOST      |              | 192.168.1.1    |
| MYSQL_PORT      | 5432         | 1235           |
| MYSQL_DATABASE  | postgres     | mydb           |
| MYSQL_USERNAME  | postgres     | myuser         |
| MYSQL_PASSWORD  |              | mypass         |

## Build

```bash
# clone project
git clone https://github.com/madharjan/docker-mysql-client
cd docker-mysql-client


# build
make

# tests
make run
make test

# clean
make clean
```

## Run

### Postgres Server (docker-mysql)

```bash
# stop & remove previous instances
docker stop mysql
docker rm mysql
# run container
docker run -d \
  -e MYSQL_PASSWORD=mypass \
  --name mysql \
  madharjan/docker-mysql:5.7
```

### Postgres Client (docker-mysql-client)

```bash
# psql console
docker run --rm -it \
  --link mysql:db \
  -e MYSQL_HOST=db \
  -e MYSQL_PASSWORD=mypass \
  madharjan/docker-mysql-client:10.1

# psql script
docker run --rm -it \
  --link mysql:db \
  -e MYSQL_HOST=db \
  -e MYSQL_PASSWORD=mypass \
  madharjan/docker-mysql-client:10.1 \
  -c 'select user from user'
```

### Cleanup

```bash
docker stop mysql
docker rm mysql

``
