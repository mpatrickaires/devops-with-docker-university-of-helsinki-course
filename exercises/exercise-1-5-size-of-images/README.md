# EXERCISE 1.5: SIZES OF IMAGES
In the Exercise 1.3 we used `devopsdockeruh/simple-web-service:ubuntu`.

Here is the same application but instead of Ubuntu is using Alpine Linux: `devopsdockeruh/simple-web-service:alpine`.

Pull both images and compare the image sizes. Go inside the alpine container and make sure the secret message functionality is the same. Alpine version doesn't have bash but it has sh.

## Solution

### Pull both images and compare the image sizes.

Pull both images:

`docker pull devopsdockeruh/simple-web-service:ubuntu`

`docker pull devopsdockeruh/simple-web-service:alpine`

List the images to check their sizes:

`docker images`

From the output below, it's possible to see that the image based on Alpine is smaller:

```
REPOSITORY                          TAG       IMAGE ID       CREATED       SIZE
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   2 years ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   2 years ago   15.7MB
```

### Go inside the alpine container and make sure the secret message functionality is the same.

Run the container from the image based on Alpine:

`docker container run -d --name alpine devopsdockeruh/simple-web-service:alpine`

Get inside the container:

`docker exec -it alpine sh`

Check the secret message:

`tail -f text.log`

The secret message is **'You can find the source code here: https://github.com/docker-hy'**, thus the functionality is exactly the same as the image based on Ubuntu.