# .NET 8.0 Upgrade Report

## Project target framework modifications

| Project name                                   | Old Target Framework | New Target Framework | Commits                                           |
|:-----------------------------------------------|:--------------------:|:--------------------:|---------------------------------------------------|
| ContosoUniversity.Data.csproj                  | netcoreapp2.1        | net8.0               | 248430e8, 7def32cd                                |
| ContosoUniversity.Common.csproj                | netcoreapp2.1        | net8.0               | d2f09a42, 1be7acc4, 29d3f4d0                      |
| ContosoUniversity.Spa.React.csproj             | netcoreapp2.1        | net8.0               | ee4138db, dd7b205e                                |
| ContosoUniversity.Data.Tests.csproj            | netcoreapp2.1        | net8.0               | 42748eaa                                          |
| ContosoUniversity.Api.csproj                   | netcoreapp2.1        | net8.0               | 7190bc6f, 6fada7a3, e758494f                      |
| ContosoUniversity.Web.csproj                   | netcoreapp2.1        | net8.0               | 83a88eb8, 6982694e, 635925c9                      |

## NuGet Packages

| Package Name                                            | Old Version | New Version | Commit Id                                         |
|:--------------------------------------------------------|:-----------:|:-----------:|---------------------------------------------------|
| Microsoft.AspNetCore.App                                | 2.1.1       | Removed     | dd7b205e, 6982694e                                |
| Microsoft.AspNetCore.Authentication.Facebook            | 2.1.0       | 8.0.22      | 1be7acc4                                          |
| Microsoft.AspNetCore.Authentication.Google              | 2.1.0       | 8.0.22      | 1be7acc4                                          |
| Microsoft.AspNetCore.Authentication.JwtBearer           | 2.1.0, 2.1  | 8.0.22      | 1be7acc4, 6fada7a3                                |
| Microsoft.AspNetCore.Identity.EntityFrameworkCore       | 2.1.0       | 8.0.22      | 7def32cd                                          |
| Microsoft.AspNetCore.Mvc                                | 2.1         | Removed     | 1be7acc4, 6fada7a3                                |
| Microsoft.AspNetCore.Rewrite                            | 2.1         | Removed     | 6fada7a3                                          |
| Microsoft.AspNetCore.SpaServices.Extensions             | 2.1.1       | 8.0.22      | dd7b205e                                          |
| Microsoft.AspNetCore.StaticFiles                        | 2.1         | Removed     | 6fada7a3                                          |
| Microsoft.AspNetCore                                    | 2.1         | Removed     | 1be7acc4, 6fada7a3                                |
| Microsoft.EntityFrameworkCore                           | 2.1         | 8.0.22      | 7def32cd                                          |
| Microsoft.EntityFrameworkCore.Design                    | 2.1.0       | 8.0.22      | 7def32cd                                          |
| Microsoft.EntityFrameworkCore.InMemory                  | 2.1         | 8.0.22      | 7def32cd                                          |
| Microsoft.EntityFrameworkCore.Sqlite                    | 2.1         | 8.0.22      | 7def32cd                                          |
| Microsoft.EntityFrameworkCore.SqlServer                 | 2.1         | 8.0.22      | 7def32cd                                          |
| Microsoft.Extensions.Configuration                      | 2.1.0       | 8.0.0       | 7def32cd                                          |
| Microsoft.Extensions.Configuration.EnvironmentVariables | 2.1.0       | 8.0.0       | 7def32cd                                          |
| Microsoft.Extensions.Configuration.FileExtensions       | 2.1.0       | 8.0.1       | 7def32cd                                          |
| Microsoft.Extensions.Configuration.Json                 | 2.1.0       | 8.0.1       | 7def32cd                                          |
| Microsoft.Extensions.Options                            | 2.1.0       | 8.0.2       | 1be7acc4                                          |
| Newtonsoft.Json                                         | 11.0.2      | 13.0.4      | 7def32cd                                          |
| System.Collections.Immutable                            | 1.5.0       | 8.0.0       | 7def32cd                                          |
| System.Diagnostics.DiagnosticSource                     | 4.5.0       | 8.0.1       | 7def32cd                                          |

## All commits

| Commit ID | Description                                                                                                     |
|:----------|:----------------------------------------------------------------------------------------------------------------|
| 1749c1c8  | Commit upgrade plan                                                                                             |
| 177e295d  | Store final changes for step 'Ensure that the SDK version specified in global.json files is compatible...'     |
| 248430e8  | Update ContosoUniversity.Data.csproj to target .NET 8.0                                                         |
| 7def32cd  | Update package versions in ContosoUniversity.Data.csproj                                                        |
| 29d3f4d0  | Replaced 'ExecuteSqlCommandAsync' with 'ExecuteSqlRawAsync' in Repository.cs                                    |
| d2f09a42  | Update ContosoUniversity.Common.csproj to target .NET 8.0                                                       |
| 1be7acc4  | Update package versions in ContosoUniversity.Common.csproj                                                      |
| ee4138db  | Update target framework to net8.0 in ContosoUniversity.Spa.React.csproj                                         |
| dd7b205e  | Update SpaServices.Extensions version in .csproj file                                                           |
| 42748eaa  | Update target framework in ContosoUniversity.Data.Tests.csproj                                                  |
| 7190bc6f  | Update ContosoUniversity.Api.csproj to target .NET 8.0                                                          |
| 6fada7a3  | Update ContosoUniversity.Api.csproj package references                                                          |
| e758494f  | Fixed IsDevelopment() call in ContosoUniversity.Api\Program.cs                                                  |
| 83a88eb8  | Update ContosoUniversity.Web.csproj to target .NET 8                                                            |
| 6982694e  | Remove Microsoft.AspNetCore.App from ContosoUniversity.Web.csproj                                               |
| 635925c9  | Fixed IsDevelopment() call in ContosoUniversity.Web\Program.cs                                                  |

## Project feature upgrades

Contains summary of modifications made to the project assets during different upgrade stages.

### ContosoUniversity.Data

- Target framework upgraded from netcoreapp2.1 to net8.0
- Updated 13 NuGet packages to .NET 8.0 compatible versions including Entity Framework Core packages
- Addressed security vulnerability in Newtonsoft.Json (upgraded from 11.0.2 to 13.0.4)

### ContosoUniversity.Common

- Target framework upgraded from netcoreapp2.1 to net8.0
- Replaced obsolete `ExecuteSqlCommandAsync` with `ExecuteSqlRawAsync` in Repository.cs (EF Core 8.0 breaking change)
- Updated authentication packages (Facebook, Google, JwtBearer) to version 8.0.22
- Removed obsolete Microsoft.AspNetCore and Microsoft.AspNetCore.Mvc package references
- Resolved package downgrade warning by updating Microsoft.Extensions.Options to 8.0.2

### ContosoUniversity.Spa.React

- Target framework upgraded from netcoreapp2.1 to net8.0
- Updated Microsoft.AspNetCore.SpaServices.Extensions to 8.0.22
- Removed Microsoft.AspNetCore.App package (functionality now included with framework reference)

### ContosoUniversity.Data.Tests

- Target framework upgraded from netcoreapp2.1 to net8.0

### ContosoUniversity.Api

- Target framework upgraded from netcoreapp2.1 to net8.0
- Updated Microsoft.AspNetCore.Authentication.JwtBearer to 8.0.22 (security vulnerability fixed)
- Removed obsolete package references (Microsoft.AspNetCore, Microsoft.AspNetCore.Mvc, Microsoft.AspNetCore.Rewrite, Microsoft.AspNetCore.StaticFiles)
- Fixed IsDevelopment() method call in Program.cs to use correct IWebHostEnvironment API

### ContosoUniversity.Web

- Target framework upgraded from netcoreapp2.1 to net8.0
- Removed Microsoft.AspNetCore.App package reference
- Fixed IsDevelopment() method call in Program.cs to use .NET 8 extension method pattern

## Summary

Successfully upgraded the entire ContosoUniversity solution from .NET Core 2.1 to .NET 8.0. All 6 projects were upgraded with their target frameworks updated, 23 NuGet packages updated or removed, and breaking changes addressed. Security vulnerabilities in Newtonsoft.Json and Microsoft.AspNetCore.Authentication.JwtBearer were resolved. The upgrade included handling Entity Framework Core API changes and ASP.NET Core hosting environment API updates.
