# Use the latest OpenJDK base image
FROM openjdk:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the WAR file from your local machine to the container
COPY ./ProCollab-0.0.1-SNAPSHOT.jar  /app/application.war

# Expose the port that your application listens on
EXPOSE 90

# Command to run the application when the container starts
CMD ["java", "-jar", "application.war"]
