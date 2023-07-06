FROM maven:3.6.3-openjdk-8

COPY pom.xml /tmp/

COPY src /tmp/src/

RUN mvn package

#pull base image

FROM openjdk

EXPOSE 8080
WORKDIR /tmp/

#copy hello world to docker image from builder image
COPY --from=maven_build /tmp/target/sample-1.0.3.jar .

#default command
CMD ["java", "-jar", "/data/sample-1.0.3.jar"]
