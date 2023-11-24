# EXERCISE 1.11: SPRING

Create a Dockerfile for an old Java Spring project that can be found from the [course repository](https://github.com/docker-hy/material-applications/tree/main/spring-example-project).

The setup should be straightforward with the [README][1] instructions. Tips to get you started:

Use openjdk image `FROM openjdk:_tag_` to get Java instead of installing it manually. Pick the tag by using the [README][1] and Docker Hub page.

You've completed the exercise when you see a 'Success' message in your browser.

Submit the Dockerfile you used to run the container.

[1]: spring-example-project/README.md

## Solution

Check the created [Dockerfile](spring-example-project/Dockerfile).

Build the image from it:

`docker build -t spring-example .`

And run the container mapping a port from the host to the port 8080 of the container:

`docker run --name spring-example -p 8080:8080 spring-example`
