FROM maven:3.6.3-openjdk-8

WORKDIR /bem

copy . .

RUN mvn install

RUN mvn run build

FROM tomcat


EXPOSE 8080

COPY --FROM=builderstage /bem/target/sample-1.0.3.jar /bem.jar

ENTRYPOINT ["java" , "jar", "/bem.jar" ]

