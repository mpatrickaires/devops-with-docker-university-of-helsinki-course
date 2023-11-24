# MANDATORY EXERCISE 1.12: HELLO, FRONTEND!

A good developer creates well-written READMEs. Such that they can be used to create Dockerfiles with ease.

Clone, fork or download the project from https://github.com/docker-hy/material-applications/tree/main/example-frontend.

Create a Dockerfile for the project (example-frontend) and give a command so that the project runs in a Docker container with port 5000 exposed and published so when you start the container and navigate to http://localhost:5000 you will see message if you're successful.

note that the port 5000 is reserved in the more recent OSX versions (Monterey, Big Sur), so you have to use some other host port
Submit the Dockerfile.

As in other exercises, do not alter the code of the project

TIP: The project has install instructions in README.

TIP: Note that the app starts to accept connections when "Accepting connections at http://localhost:5000" has been printed to the screen, this takes a few seconds

TIP: You do not have to install anything new outside containers.

## Solution

Check the created [Dockerfile](example-frontend/Dockerfile).

Build the image from it

`docker build -t example-frontend .`

And run the container mapping a port from the host to the port 5000 of the container:

`docker run --name example-frontend -p 5000:5000 example-frontend`
