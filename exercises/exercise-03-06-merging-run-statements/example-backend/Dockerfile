# From the README: "Install golang 1.16".
FROM golang:1.16

# From the README: "Server accepts the following environment variables:
# - PORT to choose which port for the application. Default: 8080"
# We'll leave the default 8080 port
EXPOSE 8080

# That location is just a convention
WORKDIR /usr/src/app

# From the README: "Run go build. It will generate a binary named "server"".
# Creating a user so that we start the process as a non-root user.
COPY . .
RUN go build && \ 
  useradd -m appuser && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /usr/local/go/bin/go && \
  rm -rf /etc/paths.d/go

# From the README: "Execute the file e.g. ./server.".
CMD ["./server"]