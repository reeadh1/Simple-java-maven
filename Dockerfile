FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml /app

COPY src /app/src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
EXPOSE 8080
VOLUME /tmp
COPY --from=builder /app/target/*.jar myapp.jar
ENTRYPOINT ["java","-jar","myapp.jar"]
