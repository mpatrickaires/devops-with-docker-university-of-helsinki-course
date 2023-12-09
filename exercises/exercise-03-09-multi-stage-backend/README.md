# EXERCISE 3.9: MULTI-STAGE BACKEND

Lets do a multi-stage build for the [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend) project since we've come so far with the application.

The project is in golang and building a binary that runs in a container, while straightforward, isn't exactly trivial. Use resources that you have available (Google, example projects) to build the binary and run it inside a container that uses FROM scratch.

To successfully complete the exercise the image must be smaller than **25MB**.

## Solution

Check the [Dockerfile](example-backend/Dockerfile).

First, lest give a name to the initial build step:

```dockerfile
FROM golang:1.16-alpine as build
```

we have to [turn off CGO during the build phase](https://stackoverflow.com/a/55106860/19109739), so we have to change the `RUN` statement:

```dockerfile
RUN CGO_ENABLED=0 go build
```

Then, we can remove the `CMD` we had before:

```dockerfile
# CMD ["./server"]
```

Finally, we set a new stage with scratch as the base image and copy the binary generated in the build stage:

```dockerfile
FROM scratch
COPY --from=build /usr/src/app/server .
CMD ["/server"]
```

When we build the image, we can check with `docker images` that the size is only 18MB:

```
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
example-backend   latest    218d0ba4b805   57 seconds ago   18MB
```
