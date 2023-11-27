# EXERCISE 2.7

Postgres image uses a volume by default. Define manually a volume for the database in a convenient location such as in `./database` so you should use now a bind mount. The image documentation may help you with the task.

After you have configured the bind mount volume:

- Save a few messages through the frontend

- Run docker compose down

- Run docker compose up and see that the messages are available after refreshing browser

- Run docker compose down and delete the volume folder manually

- Run docker compose up and the data should be gone

> TIP: To save you the trouble of testing all of those steps, just look into the folder before trying the steps. If it's empty after docker compose up then something is wrong.

Submit the docker-compose.yml

The benefit of a bind mount is that since you now exactly where the data is in your file system, it is easy to create backups. If Docker managed volumes are used, the location of the data in the file system can not be controlled and that makes backups a bit less trivial...

## Solution

Add the bind mount to the Postgres service in the [docker-compose.yml](docker-compose.yml):

```yml
services:
  ...
  db:
    ...
    volumes:
      # From Postgres' image documentation, the data files are written by default in /var/lib/postgresql/data (https://github.com/docker-library/docs/blob/master/postgres/README.md#where-to-store-data)
      - ./database:/var/lib/postgresql/data
```

