# EXERCISE 2.11

Select some of your own development projects and start utilizing containers in the development environment.

Explain what you have done. It can be anything, e.g., a support for docker-compose.yml to have services (such as databases) containerized or even a fully blown containerized development environment.

## Solution

I've used the same .NET application created for the [Exercise 1.15](../exercise-01-15-homework/).

First, the [Dockerfile](DotnetApiExample/Dockerfile) was changed to build de image for a development environment:

```Dockerfile
FROM mcr.microsoft.com/dotnet/sdk:6.0

# The port which the development profile runs.
EXPOSE 5077

WORKDIR /usr/src/app

# Copy the dependencies specification file and download these dependencies, this way they stay in the layer cache, making the process of building the image again faster.
COPY *.csproj .
RUN dotnet restore

# "dotnet run" build the application and run it in development mode.
CMD ["dotnet", "run"]
```

Then, a [docker-compose.yml](DotnetApiExample/docker-compose.yml) was created to build the container for a development environment:

```yml
version: '3.8'

services:
  dotnet-api-example:
    image: dotnet-api-example
    build: .
    # In development, the exposed port is 5077.
    ports:
      - 5077:5077
    # Bind mount the source files to inside the container.
    volumes:
      - ./:/usr/src/app
    container_name: dotnet-api-example
```

However, for .NET, we'll have to run `docker compose up --build` every time we change code and want to see the changes in the running application.
