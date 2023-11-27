# EXERCISE 2.8

Add Nginx to example to work as a reverse proxy in front of the example app frontend and backend. According to Wikipedia:

*A reverse proxy is a type of proxy server that retrieves resources on behalf of a client from one or more servers. These resources are then returned to the client, appearing as if they originated from the reverse proxy server itself.*

![Backend, frontend, redis, a database and nginx](images/image.png)

So in our case, the reverse proxy will be the single point of entry to our application, and the final goal will be to set both the React frontend and the Express backend behind the reverse proxy.

The idea is that browser makes all requests to http://localhost. If the request has a url prefix http://localhost/api, Nginx should forward the request to the backend container. All the other requests are directed the frontend container.

So, at the end you should see that the frontend is accessible simply by going to http://localhost. All buttons, except the one labelled Exercise 2.8 may have stopped working, do not worry about them, we shall fix that later.

The following file should be set to /etc/nginx/nginx.conf inside the nginx container. You can use a file bind mount where the contents of the file is the following:

```bash
events { worker_connections 1024; }

http {
  server {
    listen 80;

    location / {
      proxy_pass _frontend-connection-url_;
    }

    # configure here where requests to http://localhost/api/...
    # are forwarded
    location /api/ {
      proxy_set_header Host $host;
      proxy_pass _backend-connection-url_;
    }
  }
}
```

Nginx, backend and frontend should be connected in the same network. See the image above for how the services are connected. You find Nginx-documentation helpful, but remember, the configuration you need is pretty straight forward, if you end up doing complex things, you are most likely doing something wrong.

If and when your app "does not work", remember to have a look in log, it can be pretty helpful in pinpointing errors:

```bash
2_7-proxy-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
2_7-proxy-1  | /docker-entrypoint.sh: Configuration complete; ready for start up
2_7-proxy-1  | 2023/03/05 09:24:51 [emerg] 1#1: invalid URL prefix in /etc/nginx/nginx.conf:8
2_7-proxy-1 exited with code 1
```

Submit the docker-compose.yml

## Solution

We have to create `nginx.conf` file in our machine:

`touch nginx.conf`

Copy the `nginx.conf` content specified in the exercise's README and paste into the created file. 

We need to set a value for the placeholders `_frontend-connection-url_` and `_backend-connection-url_` in the `nginx.conf`. These values are the URL to connect into the frontend and backend services, respectively. Since the services and the reverse proxy are in the same network, we can use the service's name that we specified in the [docker-compose.yml](docker-compose.yml):

```bash
...
    location / {
      # Since we are in the same network as the service, we can use its name directly and specify the port.
      proxy_pass http://example-frontend:5000;
    }

    # configure here where requests to http://localhost/api/...
    # are forwarded
    location /api/ {
      proxy_set_header Host $host;
      # Since we are in the same network as the service, we can use its name directly and specify the port.
      proxy_pass http://example-backend:8080;
    }
```

Finally, we can add the reverse proxy service into the [docker-compose.yml](docker-compose.yml):

```yml
services:
  ...
  reverse-proxy:
    image: nginx:1.25.3-alpine
    ports:
      - 80:80
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    container_name: reverse-proxy
```
