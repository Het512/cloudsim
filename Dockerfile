# Base image with Java 23 and Maven
FROM maven:3.9.8-eclipse-temurin-23

# Set the working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Install dependencies and build the project
RUN mvn clean install

# Install dependencies and build the project
RUN mvn clean package

# Command to run the simulation
CMD ["mvn", "exec:java", "-pl", "modules/cloudsim-examples/", "-Dexec.mainClass=org.cloudbus.cloudsim.examples.EnhancedMultiTierCloudSimulation"]