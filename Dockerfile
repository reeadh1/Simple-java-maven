FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY . .
RUN mvn clean install
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
