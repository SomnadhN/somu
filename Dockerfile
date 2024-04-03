# Use a base image with OpenJDK 17 installed
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /app

# Install Git to fetch the JAR file
RUN apt-get update && apt-get install -y git

# Clone the Git repository containing the JAR file (replace URL with your repository's URL)
RUN git clone https://github.com/ShravanJanwade/Pro-Collab-Application.git /app

# Switch to the master branch (optional, only if the JAR file is in a specific branch)
RUN git checkout master

# Copy the JAR file from the cloned repository to the container
COPY ProCollab-0.0.1-SNAPSHOT.jar /app/ProCollab.jar

# Expose the port that your Spring Boot application listens on
EXPOSE 1111

# Command to run the application when the container starts
CMD ["java", "-jar", "ProCollab.jar"]
