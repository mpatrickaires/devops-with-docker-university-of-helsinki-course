# We'll use the openjdk image, as suggested by the README of the exercise.
# The README of the project states that Java 8 is necessary. Looking up in the internet, I found out that OpenJDK 8 has this Java version, so that's the version I've used for the tag
FROM openjdk:8

# From the project's README: "The project should open in `8080`". So, we'll expose the port 8080
EXPOSE 8080

# That location is just a convention
WORKDIR /usr/src/app

# Copy all of the project's files.
# Since nowhere in the project's README was stated a step of building/downloading dependencies (like we do in node with "npm i" in the "package*" files), we don't have a layer just for that to take advantage of Docker caching
COPY . .

# From the project's README: "Build the project with `./mvnw package`"
RUN ./mvnw package

# From the project's README: "Run with `java -jar ./target/docker-example-1.1.3.jar`"
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]