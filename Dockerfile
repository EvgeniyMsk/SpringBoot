FROM maven:3.8.4-jdk-8
COPY src /springboot/src
COPY pom.xml /springboot
WORKDIR springboot
RUN mvn clean package
EXPOSE 8080