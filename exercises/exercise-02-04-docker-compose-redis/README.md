# EXERCISE 2.4

> SECURITY REMINDER: PLAN YOUR INFRASTRUCTURE AND KEEP TO YOUR PLAN  
> In the next exercise, and in some later exercises, I will supply you with an illustration of the infrastructure. Do look at it and use it to write the configuration.  
> For example, in Exercise 2.4 we don't want to open ports to Redis to the outside world. Do not add a ports configuration under Redis! The backend will be able to access the application within the Docker network.

In this exercise you should expand the configuration done in Exercise 2.3 and set up the example backend to use the key-value database Redis.

Redis is quite often used as a cache to store data so that future requests for data can be served faster.

The backend uses a slow API to fetch some information. You can test the slow API by requesting `/ping?redis=true` with curl. The frontend app has a button to test this.

So you should improve the performance of the app and configure a Redis container to cache information for the backend. The [documentation](https://hub.docker.com/_/redis/) of the Redis image might contain some useful info.

The backend [README](example-backend/README.md) should have all the information that is needed for configuring the backend.

When you've correctly configured the button will turn green.

Submit the docker-compose.yml

![Backend, frontend and redis](images/image.png)

The [restart: unless-stopped](https://docs.docker.com/compose/compose-file/compose-file-v3/#restart) configuration can help if the Redis takes a while to get ready.

## Solution

Add Redis as a service in the [docker-compose.yml](docker-compose.yml) file:
```yml
services:
  ...
  redis-cache:
      image: redis:7.2.3
      container_name: redis-cache
```

Change the [Dockerfile](example-backend/Dockerfile) for the backend to include the host to connect to Redis in the appropriate environment variable. Remember that, since we're creating this via Docker Compose, the host can be the Redis' service name:

```Dockerfile
ENV REDIS_HOST=redis-cache
```
