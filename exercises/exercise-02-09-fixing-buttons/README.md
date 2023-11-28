# EXERCISE 2.9

Most of the buttons may have stopped working in the example application. Make sure that every button for exercises works.

Remember to take a peek into the browsers developer consoles again like we did back part 1, remember also [this](https://github.com/docker-hy/material-applications/tree/main/example-frontend#exercise-114---to-connect-to-backend) and [this](https://github.com/docker-hy/material-applications/tree/main/example-backend).

The buttons of Nginx exercise and the first button behave differently but you want them to match.

If you had to do any changes explain what you did and where.

Submit the docker-compose.yml and both Dockerfiles.

## Solution

First of all, we need to change the path to the backend set for the frontend and also the URL to pass through the CORS check in the backend. This is because we'll be using the reverse proxy now, so this communication should go through it. Let's do that in a more configurable way, so instead of setting these values hardcoded in the `ENV` of the Dockerfile, we'll use the `ARG` instruction to allow us to receive the value from a `docker build` command or from the docker-compose.yml.

> It's important to mention here a situation that happened during the development of the solution. The frontend uses the instruction `process.env` to access environment variable values. The value of these environment variables, however, are saved for the frontend during the build phase of the application. Because of that, if we try to set the environment variable value directly through `environment` in the docker-compose.yml, it will not work, because the value for the environment variable will be set at runtime.
>
> With that in mind, it's a must that we set this environment variable value in the Dockerfile.

Change the [frontend Dockerfile](example-frontend/Dockerfile):

```dockerfile
# Since we're now using a Docker Compose file, we'll do that in a more configurable way, using the ARG instruction and then passing its value to the ENV.
ARG REACT_APP_BACKEND_URL
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL
```

And the [backend Dockerfile](example-backend/Dockerfile):

```dockerfile
# Since we're now using a Docker Compose file, we'll do that in a more configurable way, using the ARG instruction and then passing its value to the ENV.
ARG REQUEST_ORIGIN
ENV REQUEST_ORIGIN=$REQUEST_ORIGIN
```

Then, pass the `ARG` value trough the [docker-compose.yml](docker-compose.yml) to the build image instruction of both services:

```yml
services:
  ...
  example-frontend:
    image: example-frontend
    build:
      context: ./example-frontend
      args:
        REACT_APP_BACKEND_URL: http://localhost/api

  ...
  
  example-backend:
    image: example-backend
    build: 
      context: ./example-backend
      args:
        REQUEST_ORIGIN: http://localhost
```
