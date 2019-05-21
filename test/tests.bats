
@test "checking connect & execute sql: mysql-server" {
  run docker run --rm -it \
    --link mysql_client:db \
    -e MYSQL_HOST=db \
    -e MYSQL_DATABASE=mydb \
    -e MYSQL_USERNAME=myuser \
    -e MYSQL_PASSWORD=mypass \
    madharjan/docker-mysql-client:10.1 \
    -e 'select now() from dual;'
  [ "$status" -eq 0 ]
}
