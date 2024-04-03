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

# Clone the Git repository containing the JAR file
# Clone the Git repository containing the JAR file (master branch)
RUN git clone -b master https://github.com/subhisuresh17/Pro-Collab-Application-latest.git

# Switch to the master branch (optional, only if the JAR file is in a specific branch)
WORKDIR /app/Pro-Collab-Application-latest
RUN git checkout master

# Copy the JAR file from the cloned repository to the container
WORKDIR /app
COPY Pro-Collab-Application-latest/ProCollab-0.0.1-SNAPSHOT.jar /app/ProCollab.jar

# Expose the port that your Spring Boot application listens on
EXPOSE 1111

# Command to run the application when the container starts
CMD ["java", "-jar", "ProCollab.jar"]
