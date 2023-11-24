# EXERCISE 1.16: CLOUD DEPLOYMENT

It is time to wrap up this part and run a containerized app in the cloud.

You can take any web-app, eg. an example or exercise from this part, your own app, or even the course material (see [devopsdockeruh/coursepage](https://hub.docker.com/r/devopsdockeruh/coursepage)) and deploy it to some cloud provider.

There are plenty of alternatives, and most provide a free tier. Here are some alternatives that are quite simple to use:

- [fly.io](https://fly.io/) (easy to use but needs a credit card even in the free tier)
- [render.com](https://render.com/) (bad documentation, you most likely need google)
- [heroku.com](https://heroku.com/) (has a free student plan through GitHub Student Developer Pack)

If you know a good cloud service for the purposes of this exercise, please tell us (yes, we know about Amazon AWS, Google Cloud and Azure already... ).

Submit the Dockerfile, a brief description of what you did, and a link to the running app.

## Solution

Used the image from [Docker Hub](https://hub.docker.com/repository/docker/matheuspatrick/dotnet-api-example/general) created from the example and Dockerfile of the project created in the [Exercise 1.15](../exercise-01-15-homework).

Used the [render.com](https://render.com/) platform as the alternative for deploy, following their [documentation on how to deploy from a registry](https://render.com/docs/deploy-an-image) (in this case, Docker Hub).

I will not leave the deployed application running, so there's no point in leaving the link here.
