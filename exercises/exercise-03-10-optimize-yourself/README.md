# EXERCISE 3.10

Do all or most of the optimizations from security to size for one other Dockerfile you have access to, in your own project or for example the ones used in previous "standalone" exercises.

Please document Dockerfiles both before and after.

## Solution

Check the Dockerfile [before](DotnetApiExample/Dockerfile.before) and [after](DotnetApiExample/Dockerfile) the optimizations.

Let's document the changes.

To understand it better, it's important to know that there are two image variations for the .NET: the SDK and the runtime. As you can imagine, the SDK variation is proper for building the .NET application and is also capable of running it, while the runtime variation can only run the generated application, but cant build it.

So, we'll keep the first stage of the Dockerfile using the SDK image, let's just change it to the alpine variation and add a name to the stage:

```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
```

After that, we remove the existing `ENV`, `EXPOSE` and `CMD` statements from this stage, as they'll be set in the final stage:

```dockerfile
# ENV ASPNETCORE_URLS=http://*:5000
# EXPOSE 5000
...
# CMD ["dotnet", "bin/DotnetApiExample.dll"]
```

With all that done, we can start to create the final stage, using the runtime variation of the .NET image:

```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine as final
```

Let's set the port and expose it:

```dockerfile
ENV ASPNETCORE_URLS=http://*:5000
EXPOSE 5000
```

And copy from the build stage the generated binaries to run the application:

```dockerfile
WORKDIR /usr/src/app

COPY --from=build /usr/src/app/bin .
```

For the security concern, let's set a new user so that the container doesn't run with root:

```dockerfile
RUN adduser -D appuser
RUN chown appuser .
USER appuser
```

Finally, we can set it to run the application:

```dockerfile
CMD ["dotnet", "DotnetApiExample.dll"]
```

### Image sizes

Before these optimizations, the image size was **785MB**.

With the optimizations, the image size is **111MB**.

You can see that from the output below:

```
> docker images

REPOSITORY                  TAG       IMAGE ID       CREATED          SIZE 
dotnet-api-example-before   latest    67ef2e14478b   5 seconds ago    785MB
dotnet-api-example          latest    5a0ee637a7da   11 minutes ago   111MB
```
