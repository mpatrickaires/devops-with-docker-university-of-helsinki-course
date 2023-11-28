FROM mcr.microsoft.com/dotnet/sdk:6.0

# The port which the development profile runs.
EXPOSE 5077

WORKDIR /usr/src/app

# Copy the dependencies specification file and download these dependencies, this way the stay in the layer cache, making the process of building the image again faster.
COPY *.csproj .
RUN dotnet restore

# "dotnet run" build the application and run it in development mode.
CMD ["dotnet", "run"]