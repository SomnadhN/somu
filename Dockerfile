# Use a base image with Ubuntu 20.04
FROM ubuntu:20.04

# Install timezone data and set the timezone
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Set the working directory inside the container
WORKDIR /app

# Install Java, Git, and other dependencies
RUN apt-get install -y openjdk-17-jdk git



# Copy the JAR file from the cloned repository to the container
WORKDIR /app/Pro-Collab-Application-latest
COPY target/ProCollab-0.0.1-SNAPSHOT.jar  /app/ProCollab.jar

# Expose the port that your Spring Boot application listens on
EXPOSE 1111

# Command to run the application when the container starts
CMD ["java", "-jar", "ProCollab.jar"]
