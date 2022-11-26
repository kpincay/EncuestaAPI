#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["src/WebEncuestaApi/WebEncuestaApi.csproj", "src/WebEncuestaApi/"]
COPY ["src/Application/Application.csproj", "src/Application/"]
COPY ["src/Domain/Domain.csproj", "src/Domain/"]
COPY ["src/Persistence/Persistence.csproj", "src/Persistence/"]
RUN dotnet restore "src/WebEncuestaApi/WebEncuestaApi.csproj"
COPY . .
WORKDIR "/src/src/WebEncuestaApi"
RUN dotnet build "WebEncuestaApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebEncuestaApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebEncuestaApi.dll"]