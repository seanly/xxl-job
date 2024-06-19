FROM seanly/toolset:openjdk-8u372-b07-1 as build

WORKDIR /code
COPY ./ /code

RUN ./mvnw -B -e -U clean package -DskipTests=true

FROM seanly/toolset:openjdk-8u372-b07-1 

WORKDIR /data/app/

COPY --from=build /code/xxl-job-admin/target/*.jar /data/app/lib/
COPY ./package/bin /data/app/bin

ENTRYPOINT ["bash", "bin/start.sh"]