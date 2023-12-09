FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /usr/src/app

COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o bin

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine as final

ENV ASPNETCORE_URLS=http://*:5000
EXPOSE 5000

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/bin .

RUN adduser -D appuser
RUN chown appuser .
USER appuser

CMD ["dotnet", "DotnetApiExample.dll"]