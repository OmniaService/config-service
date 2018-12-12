FROM openjdk:8-jdk-alpine
MAINTAINER slazhy

RUN apk add --no-cache bash
ADD ./target/*.jar app.jar
RUN sh -c 'touch /app.jar'
RUN sh -c 'mkdir -p /configs/'
ADD ./src/main/configs/*.yml /configs/
ENTRYPOINT ["/usr/bin/java"]
CMD ["-Dspring.profiles.active=docker", "-jar", "/app.jar"]
EXPOSE 15000