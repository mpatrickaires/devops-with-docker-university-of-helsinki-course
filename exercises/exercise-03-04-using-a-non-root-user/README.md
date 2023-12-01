# MANDATORY EXERCISE 3.5

In exercises [1.12](https://devopswithdocker.com/part-1/section-6#exercises-111-114) and [1.13](https://devopswithdocker.com/part-1/section-6#exercises-111-114) we created Dockerfiles for both example [frontend](https://github.com/docker-hy/material-applications/tree/main/example-frontend) and [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend).

Security issues with the user being a root are serious for the example frontend and backend as the containers for web services are supposed to be accessible through the Internet.

Make sure the containers start their processes as a non-root user.

Backend image is based on [Alpine Linux](https://www.alpinelinux.org/), that does not support the command `useradd`. Google will surely help you a way to create user in an `alpine` based image.

Submit the Dockerfiles.

## Solution

Add the following instruction to the Dockerfiles of both [frontend](example-frontend/Dockerfile) and [backend](example-backend/Dockerfile):

> Note: I didn't have a problem with the command `useradd` in the backend image that is based on Alpine Linux, so I used it normally.

```docker
# Creating a user so that we start the process as a non-root user.
RUN useradd -m appuser
```
