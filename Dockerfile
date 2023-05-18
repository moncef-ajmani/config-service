FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

# Copy the Maven project file(s) to the container
COPY pom.xml .

# Download the project dependencies
RUN mvn dependency:go-offline -B

# Copy the source code to the container
COPY src ./src

# Build the application
RUN mvn install

FROM openjdk:19

WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/target/config-service.jar config-service.jar

EXPOSE 8888

ENTRYPOINT ["java", "-jar", "/app/config-service.jar"]
