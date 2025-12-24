FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["ContosoUniversity.Web/ContosoUniversity.Web.csproj", "ContosoUniversity.Web/"]
COPY ["ContosoUniversity.Common/ContosoUniversity.Common.csproj", "ContosoUniversity.Common/"]
COPY ["ContosoUniversity.Data/ContosoUniversity.Data.csproj", "ContosoUniversity.Data/"]
RUN dotnet restore "ContosoUniversity.Web/ContosoUniversity.Web.csproj"
COPY . .
WORKDIR "/src/ContosoUniversity.Web"
RUN dotnet build "ContosoUniversity.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ContosoUniversity.Web.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ContosoUniversity.Web.dll"]