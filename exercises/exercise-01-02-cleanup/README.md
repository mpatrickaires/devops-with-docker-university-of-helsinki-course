# EXERCISE 1.2: CLEANUP

We have containers and an image that are no longer in use and are taking up space. Running and will confirm this.docker ps -asdocker images

Clean the Docker daemon by removing all images and containers.

Submit the output for and docker ps -adocker images

## Solution

### Clean the Docker daemon by removing all images and containers.

First, stop the remaining running containers:

`docker container stop <container>`

Then, remove all the stopped containers:

`docker container prune`

Finally, remove all the unused images:

`docker image prune -a`

> `docker image prune` only deletes **dangling** images (an image that has not been tagged). To also delete **unused** images, the `-a` argument in necessary. Reference: [Stack Overflow](https://stackoverflow.com/a/72965911/19109739)

We can also use the bash command substitution alongside `rm`:

`docker image rm $(docker image ls -q)`
