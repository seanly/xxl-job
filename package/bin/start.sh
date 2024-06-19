#!/bin/bash


## 设置默认环境变量
export JAVA_HOME=${JAVA_HOME:-/opt/java/openjdk}
export PATH=$JAVA_HOME/bin:$PATH
BIN_PATH=`dirname $0`
APP_DIR=${BIN_PATH}/..

if [ -z "${PARAMS}" ]; then

  export DB_USR=${DB_USR:-root}
  export DB_HOST=${DB_HOST:-mysql}
  export DB_PORT=${DB_PORT:-3306}
  export DB_NAME=${DB_NAME:-xxl_job}
  export DB_PARAMS=${DB_PARAMS:-''}

  if [ -z "$DB_PSW" ]; then
    echo "--//ERR: please set \$DB_PSW"
    exit 403
  fi

  export PARAMS="--spring.datasource.url=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}?Unicode=true&characterEncoding=UTF-8${DB_PARAMS} --spring.datasource.username=${DB_USR} --spring.datasource.password=${DB_PSW}"
fi


APP_JAR=$(ls -d ${APP_DIR}/lib/*.jar)

exec java -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/data/log \
    -Djava.security.egd=file:/dev/./urandom -Dserver.port=8080 ${JAVA_OPTS} \
    -jar ${APP_JAR} ${PARAMS} ${APP_OPTS}
