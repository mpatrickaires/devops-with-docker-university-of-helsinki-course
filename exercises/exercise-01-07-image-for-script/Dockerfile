# Set the base image
FROM ubuntu:20.04

# Install curl as a dependency
RUN apt-get update && apt-get install -y curl

# Set the working directory
WORKDIR /usr/src/app

# Copy the script to inside the container
COPY curler.sh .

# Run the script by default when the container is executed
CMD ./curler.sh