# From the README: "Install golang 1.16".
FROM golang:1.16

# From the README: "Server accepts the following environment variables:
# - PORT to choose which port for the application. Default: 8080"
# We'll leave the default 8080 port
EXPOSE 8080

# From the README: "Server accepts the following environment variables:
# - `REDIS_HOST` The hostname for redis. (port will default to 6379, the default for Redis)"
# Since we're creating this via Docker Compose, let's use the name of the service we've set for Redis.
ENV REDIS_HOST=redis-cache

# That location is just a convention
WORKDIR /usr/src/app

# From the README: "Server accepts the following environment variables:
# - REQUEST_ORIGIN to pass an url through the cors check. Default: https://example.com".
# So, we'll set this environment variable value.
ENV REQUEST_ORIGIN=http://localhost:5000

# From the README: "Run go build. It will generate a binary named "server"".
COPY . .
RUN go build

# From the README: "Execute the file e.g. ./server.".
CMD ["./server"]
