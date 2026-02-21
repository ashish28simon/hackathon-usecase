# Use official Maven image to build the app
FROM maven:3.9.2-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Package the app (creates jar in target/)
RUN mvn clean package -DskipTests

# Use a smaller Java runtime image for running the app
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy the jar from the build stage
COPY --from=build /app/target/order-service-0.0.1-SNAPSHOT.jar ./order-service.jar

# Expose the port your app uses
EXPOSE 8080

# Command to run the Spring Boot app
ENTRYPOINT ["java","-jar","order-service.jar"]