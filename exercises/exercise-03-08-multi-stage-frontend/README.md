# EXERCISE 3.8: MULTI-STAGE FRONTEND

Do now a multi-stage build for the example frontend.

Even though multi-stage builds are designed mostly for binaries in mind, we can leverage the benefits with our frontend project as having original source code with the final assets makes little sense. Build it with the instructions in README and the built assets should be in build folder.

You can still use the serve to serve the static files or try out something else.

## Solution

Check the [Dockerfile](example-frontend/Dockerfile).

First, we'll name the build step, where we use the Node image:

```docker
FROM node:16-alpine AS build-stage
```

Then, we can remove the `CMD` step, as we will not run it in this image anymore:

```docker
# CMD ["serve", "-s", "-l", "5000", "build"]
```

Finally, we have to create a new stage which copies the resulting build from the previous stage. I've used nginx in this solution to serve the static files:

```docker
FROM nginx:1.25.3-alpine

COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html
```

#### Before

Image size: 449MB

#### After

Image size: 43.8MB
