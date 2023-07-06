# Use a base image with Java installed
FROM maven:3.2.2-jdk-8



# Set the working directory inside the container
WORKDIR /ipl

RUN mvn clean install

# Copy the application JAR file into the container
COPY target/ipl.jar .

# Expose the port on which your application listens
EXPOSE 8080

# Set the command to run your application
CMD ["java", "-jar", "ipl.jar"]
