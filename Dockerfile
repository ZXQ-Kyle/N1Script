#FROM amd64/openjdk:11.0.5-jre-slim-buster
FROM arm64v8/openjdk:11.0.4-jre-stretch

MAINTAINER ponyopapa "674079013@qq.com"

EXPOSE 8000 8800 8880

WORKDIR /java/

VOLUME /opt/

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone

ARG REFRESHED_DATA=2019-12-17

COPY dc1server.jar ./

ENTRYPOINT exec java -jar /java/dc1server.jar


