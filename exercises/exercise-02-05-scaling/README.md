# EXERCISE 2.5
The project https://github.com/docker-hy/material-applications/tree/main/scaling-exercise is a barely working application. Go ahead and clone it for yourself. The project already includes docker-compose.yml so you can start it by running `docker compose up`.

Application should be accessible through http://localhost:3000. However it doesn't work well enough and I've added a load balancer for scaling. Your task is to scale the `compute` containers so that the button in the application turns green.

This exercise was created with [Sasu Mäkinen](https://github.com/sasumaki)

Please return the used commands for this exercise.

## Solution

We have to scale the `compute` containers with the `--scale` option. From my tests, scaling 3 containers was good enough:

`docker compose up -d --scale compute=3`
