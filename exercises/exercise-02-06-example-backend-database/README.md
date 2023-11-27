# EXERCISE 2.6

Let us continue with the example app that we worked with in [Exercise 2.4](../exercise-02-04-docker-compose-redis/).

Now you should add database to example backend.

Use a Postgres database to save messages. For now there is no need to configure a volume since the official postgres image sets a default volume for us. Use the Postgres image documentation to your advantage when configuring: https://hub.docker.com/_/postgres/. Especially part *Environment Variables* is a valuable one.

The backend [README](example-backend/README.md) should have all the information needed to connect.

There is again a button (and a form!) in the frontend that you can use to ensure your configuration is done right.

Submit the docker-compose.yml

- TIP: When configuring the database, you might need to destroy the automatically created volumes. Use command `docker volume prune`, `docker volume ls` and `docker volume rm` to remove unused volumes when testing. Make sure to remove containers that depend on them beforehand.

- `restart: unless-stopped` can help if the Postgres takes a while to get ready

![Backend, frontend, redis and a database](images/image.png)

## Solution

Add a service for the Postgres database in the [docker-compose.yml](docker-compose.yml), specifying a password in the POSTGRES_PASSWORD environment variable:

```yml
services:
  ...
  db:
      image: postgres:16.1-alpine
      restart: unless-stopped
      environment:
        # The backend service assumes by default that the password is "postgres", so we'll use it here.
        # Regarding the other environment variables, from the Postgres image documentation (https://hub.docker.com/_/postgres/) it is mentioned that the POSTGRES_USER (user) defaults to "postgres", and that the POSTGRES_DB (default database name), if not specified, uses the value of POSTGRES_USER.
        - POSTGRES_PASSWORD=postgres
      container_name: db
```

Add the necessary environment variables for the backend service for it to be able to connect to the database:

```yml
...
services:
  ...
  example-backend:
    ...
    # From the README: "Server accepts the following environment variables:
    # - `POSTGRES_HOST` The hostname for postgres database. (port will default to 5432 the default for Postgres)
    # - `POSTGRES_USER` database user. Default: postgres
    # - `POSTGRES_PASSWORD` database password. Default: postgres
    # - `POSTGRES_DATABASE` database name. Default: postgres"
    # We'll take advantage of the default values, so only POSTGRES_HOST needs to be set.
    environment:
      - POSTGRES_HOST=db

```
