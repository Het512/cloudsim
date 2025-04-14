# Base image with Java 23 and Maven
FROM openjdk:23

# Set the working directory inside the container
WORKDIR /app

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

# Copy the project files into the container
COPY . .

# Install dependencies and build the project
RUN mvn clean install -DskipTests

# Install dependencies and build the project
RUN mvn clean package -DskipTests

# Command to run the simulation
CMD ["mvn", "exec:java", "-pl", "modules/cloudsim-examples/", "-Dexec.mainClass=org.cloudbus.cloudsim.examples.EnhancedMultiTierCloudSimulation"]