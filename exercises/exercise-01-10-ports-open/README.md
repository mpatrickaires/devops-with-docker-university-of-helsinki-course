# EXERCISE 1.10: PORTS OPEN

In this exercise, we won't create a new Dockerfile.

The image `devopsdockeruh/simple-web-service` will start a web service in port `8080` when given the argument "server". In Exercise 1.8 you already did a image that can be used to run the web service without any argument.

Use now the -p flag to access the contents with your browser. The output to your browser should be something like: `{ message: "You connected to the following path: ...`

Submit your used commands for this exercise.

## Solution

Run the container from the image in background with the `-d` argument and also map a port from the host machine to the port `8080` of the container with the `-p` argument:

`docker run -d -p 8080:8080 devopsdockeruh/simple-web-service server`
