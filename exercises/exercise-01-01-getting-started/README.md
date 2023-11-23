# EXERCISE 1.1: GETTING STARTED

Since we already did "Hello, World!" in the material let's do something else.

Start 3 containers from an image that does not automatically exit (such as nginx) in detached mode.

Stop two of the containers and leave one container running.

Submit the output for `docker ps -a` which shows 2 stopped containers and one running.

## Solution

### Start 3 containers from an image that does not automatically exit (such as nginx) in detached mode.

Execute the following command 3 times:

`docker container run -d nginx`

Or simply run it within a `for` statement:

`for ($i=0; $i -lt 3; $i++) { docker container run -d nginx }`

### Stop two of the containers and leave one container running.

First, check the containers in execution:

`docker container ls`

Then, stop two of the containers:

`docker container stop <container>`

### Submit the output for `docker ps -a` which shows 2 stopped containers and one running.

The output is:

```
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                     PORTS     NAMES
e53ecae11b34   nginx     "/docker-entrypoint.…"   14 minutes ago   Exited (0) 8 minutes ago             upbeat_thompson
c714dac44271   nginx     "/docker-entrypoint.…"   14 minutes ago   Exited (0) 8 minutes ago             zealous_hellman
81c3f81c91d7   nginx     "/docker-entrypoint.…"   14 minutes ago   Up 14 minutes              80/tcp    gracious_diffie
```
