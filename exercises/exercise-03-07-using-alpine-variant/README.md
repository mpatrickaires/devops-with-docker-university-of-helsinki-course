# EXERCISE 3.7

As you may have guessed, you shall now return back to the example frontend and backend.

Change the base image in FROM to something more suitable. Both should have at least Alpine variants ready in DockerHub. Make sure the application still works after the changes.

Document the size before and after your changes.

## Solution

### Frontend

Change the base image to an Alpine variant in the [Dockerfile](example-backend/Dockerfile):

```dockerfile
FROM node:16-alpine
```

#### Before

Image size: 1.27GB

#### After

Image size: 477MB

### Backend

Change the base image to an Alpine variant in the [Dockerfile](example-frontend/Dockerfile):

```dockerfile
FROM golang:1.16-alpine
```

#### Before

Image size: 1.07GB

#### After

Image size: 447MB
