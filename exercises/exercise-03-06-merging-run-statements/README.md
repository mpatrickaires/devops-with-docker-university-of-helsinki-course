# EXERCISE 3.6

Return now back to our [frontend](https://github.com/docker-hy/material-applications/tree/main/example-frontend) and [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend) Dockerfile.

Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both app, frontend and backend, by joining the RUN commands and removing useless parts.

After your improvements document the image sizes again. The size difference may not be very much yet.

## Solution

### Frontend

Merge the `RUN` statements and remove the the apt source lists:

```dockerfile
RUN npm install && \
  npm run build && \
  npm install -g serve && \
  useradd -m appuser && \
  rm -rf /var/lib/apt/lists/*
```

#### Before

Image size: 1.27GB

`RUN` statements size through `docker history`:

```bash
RUN /bin/sh -c useradd -m appuser   334kB    
RUN /bin/sh -c npm run build        8.68MB   
RUN /bin/sh -c npm install          339MB    
RUN /bin/sh -c npm install -g serve 10.7MB   
```

#### After

Image size: 1.27GB

`RUN` statement size through `docker history`:

```bash
RUN /bin/sh -c npm install &&   npm run buil…   359MB
```

### Backend

Merge the `RUN` statements and remove the the apt source lists:

```dockerfile
RUN go build && \ 
  useradd -m appuser && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /usr/local/go/bin/go && \
  rm -rf /etc/paths.d/go
```

#### Before

Image size: 1.07GB

`RUN` statements size through `docker history`:

```bash
RUN /bin/sh -c useradd -m appuser 334kB
RUN /bin/sh -c go build           146MB
```

#### After

Image size: 1.07GB

`RUN` statement size through `docker history`:

```bash
RUN /bin/sh -c go build &&   useradd -m appu…   146MB
```
