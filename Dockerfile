FROM openjdk-17-jre

WORKDIR  /app

COPY . /app

COPY ${JAR_FILE} /app/lib/wordsmith.jar

EXPOSE 8080

CMD ["java, "-jar", "wordsmith.jar]
