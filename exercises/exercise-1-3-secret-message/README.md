# EXERCISE 1.3: SECRET MESSAGE

Now that we've warmed up it's time to get inside a container while it's running!

Image `devopsdockeruh/simple-web-service:ubuntu` will start a container that outputs logs into a file. Go inside the container and use `tail -f ./text.log` to follow the logs. Every 10 seconds the clock will send you a "secret message".

Submit the secret message and command(s) given as your answer.

## Solution

First, run the container in background with `-d`:

`docker container run -d --name secret-message devopsdockeruh/simple-web-service:ubuntu`

Then, enter the container by executing a `bash` process:

`docker exec -it secret-message bash`

Finally, follow the logs:

`tail -f ./text.log`

The secret message is **'You can find the source code here: https://github.com/docker-hy'**
