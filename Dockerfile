# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install Java and Maven
RUN apt-get update && \
    apt-get install -y openjdk-23-jdk maven && \
    apt-get clean

# Set the working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Install dependencies and build the project
RUN mvn clean install -DskipTests

# Command to run the simulation
CMD ["mvn", "exec:java", "-pl", "modules/cloudsim-examples/", "-Dexec.mainClass=org.cloudbus.cloudsim.examples.EnhancedMultiTierCloudSimulation"]