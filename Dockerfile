FROM  openjdk:17-jdk-alpine as build

WORKDIR  /app

COPY . /app

COPY ${JAR_FILE} /app/lib/wordsmith.jar

EXPOSE 8080

CMD ["java, "-jar", "wordsmith.jar]
