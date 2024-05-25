FROM adoptopenjdk/openjdk11:alpine-jre
WORKDIR /app
COPY . .
RUN mvn clean install
ARG artifact=target/*.jar
COPY ${artifact} app.jar
ENTRYPOINT ["java","-jar","app.jar"]
