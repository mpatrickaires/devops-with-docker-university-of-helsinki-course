# .NET API Example

A simple API created with .NET.

# Prerequisites for development

Install [.NET 6 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/6.0).

# Download dependencies

Before the project is published for execution, the dependencies specified at the `.csproj` file need to be downloaded with `dotnet restore`

# Specify a port and accept external connections 

By default, the application runs in the port `5000`, however restricted to only accept connections incoming from localhost.
The environment variable `ASPNETCORE_URLS` can be set in the format `{scheme}://{ipAddress}:{port}`, where `ipAddress` can be set with the wildcard `*` to accept any IP address.

# Publish project

Publishing a .NET project means generating an output that is ready for deployment.
This can be done with `dotnet publish -c Release -o <path>`, where `-o` receives the path for the output.

# Execute project

Execute the project with `dotnet DotnetApiExample.dll`

> `DotnetApiExample.dll` is located in the path specified earlier for the `dotnet publish` command.

Invoke the endpoint `GET api/hello`, which should return "Hello, World!".
