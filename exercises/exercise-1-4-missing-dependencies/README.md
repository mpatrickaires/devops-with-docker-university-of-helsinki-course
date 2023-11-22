# EXERCISE 1.4: MISSING DEPENDENCIES

Start a Ubuntu image with the process sh -c 'while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'

If you're on Windows, you'll want to switch the ' and " around: sh -c "while true; do echo 'Input website:'; read website; echo 'Searching..'; sleep 1; curl http://$website; done".

You will notice that a few things required for proper execution are missing. Be sure to remind yourself which flags to use so that the container actually waits for input.

Note also that curl is NOT installed in the container yet. You will have to install it from inside of the container.

Test inputting helsinki.fi into the application. It should respond with something like

```
<html>
  <head>
    <title>301 Moved Permanently</title>
  </head>

  <body>
    <h1>Moved Permanently</h1>
    <p>The document has moved <a href="http://www.helsinki.fi/">here</a>.</p>
  </body>
</html>
```

This time return the command you used to start process and the command(s) you used to fix the ensuing problems.

Hint for installing the missing dependencies you could start a new process with docker exec.

- This exercise has multiple solutions, if the curl for helsinki.fi works then it's done. Can you figure out other (smart) solutions?

## Solution

First, run the container with the specified command in interactive mode (`-it`), which attaches the STDIN and the tty:

`docker container run -it --name missing-dependencies ubuntu sh -c 'while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'`

The `curl` dependency will be missing. To add it, open another terminal and get inside the container in a `bash` process:

`docker exec -it missing-dependencies bash`

Then add the `curl` dependency using `apt-get`:

`apt-get update && apt-get install -y curl`

With the `curl` dependency installed, go back to the first terminal which is waiting for the website input and then type **helsinki.fi**. The response will be a HTML as specified before.
