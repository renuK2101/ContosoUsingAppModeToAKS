# .NET 8.0 Upgrade Plan

## Execution Steps

Execute steps below sequentially one by one in the order they are listed.

1. Validate that a .NET 8.0 SDK required for this upgrade is installed on the machine and if not, help to get it installed.
2. Ensure that the SDK version specified in global.json files is compatible with the .NET 8.0 upgrade.
3. Upgrade ContosoUniversity.Data\ContosoUniversity.Data.csproj
4. Upgrade ContosoUniversity.Common\ContosoUniversity.Common.csproj
5. Upgrade ContosoUniversity.Spa.React\ContosoUniversity.Spa.React.csproj
6. Upgrade ContosoUniversity.Data.Tests\ContosoUniversity.Data.Tests.csproj
7. Upgrade ContosoUniversity.Api\ContosoUniversity.Api.csproj
8. Upgrade ContosoUniversity.Web\ContosoUniversity.Web.csproj

## Settings

This section contains settings and data used by execution steps.

### Aggregate NuGet packages modifications across all projects

NuGet packages used across all selected projects or their dependencies that need version update in projects that reference them.

| Package Name                                            | Current Version | New Version | Description                                                                    |
|:--------------------------------------------------------|:---------------:|:-----------:|:-------------------------------------------------------------------------------|
| Microsoft.AspNetCore.App                                | 2.1.1           |             | Package functionality included with framework reference                        |
| Microsoft.AspNetCore.Authentication.Facebook            | 2.1.0           | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.AspNetCore.Authentication.Google              | 2.1.0           | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.AspNetCore.Authentication.JwtBearer           | 2.1.0;2.1       | 8.0.22      | Security vulnerability and recommended for .NET 8.0                            |
| Microsoft.AspNetCore.Identity.EntityFrameworkCore       | 2.1.0           | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.AspNetCore.Mvc                                | 2.1             |             | Package functionality included with framework reference                        |
| Microsoft.AspNetCore.Rewrite                            | 2.1             |             | Package functionality included with framework reference                        |
| Microsoft.AspNetCore.SpaServices.Extensions             | 2.1.1           | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.AspNetCore.StaticFiles                        | 2.1             |             | Package functionality included with framework reference                        |
| Microsoft.AspNetCore                                    | 2.1             |             | Package functionality included with framework reference                        |
| Microsoft.EntityFrameworkCore                           | 2.1             | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.EntityFrameworkCore.Design                    | 2.1.0           | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.EntityFrameworkCore.InMemory                  | 2.1             | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.EntityFrameworkCore.Sqlite                    | 2.1             | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.EntityFrameworkCore.SqlServer                 | 2.1             | 8.0.22      | Recommended for .NET 8.0                                                       |
| Microsoft.Extensions.Configuration                      | 2.1.0           | 8.0.0       | Recommended for .NET 8.0                                                       |
| Microsoft.Extensions.Configuration.EnvironmentVariables | 2.1.0           | 8.0.0       | Recommended for .NET 8.0                                                       |
| Microsoft.Extensions.Configuration.FileExtensions       | 2.1.0           | 8.0.1       | Recommended for .NET 8.0                                                       |
| Microsoft.Extensions.Configuration.Json                 | 2.1.0           | 8.0.1       | Recommended for .NET 8.0                                                       |
| Microsoft.Extensions.Options                            | 2.1.0           | 8.0.2       | Recommended for .NET 8.0                                                       |
| Newtonsoft.Json                                         | 11.0.2          | 13.0.4      | Security vulnerability and recommended for .NET 8.0                            |
| System.Collections.Immutable                            | 1.5.0           | 8.0.0       | Recommended for .NET 8.0                                                       |
| System.Diagnostics.DiagnosticSource                     | 4.5.0           | 8.0.1       | Recommended for .NET 8.0                                                       |

### Project upgrade details

This section contains details about each project upgrade and modifications that need to be done in the project.

#### ContosoUniversity.Data\ContosoUniversity.Data.csproj modifications

Project properties changes:
  - Target framework should be changed from `netcoreapp2.1` to `net8.0`

NuGet packages changes:
  - Microsoft.AspNetCore.Identity.EntityFrameworkCore should be updated from `2.1.0` to `8.0.22` (*recommended for .NET 8.0*)
  - Microsoft.EntityFrameworkCore should be updated from `2.1` to `8.0.22` (*recommended for .NET 8.0*)
  - Microsoft.EntityFrameworkCore.Design should be updated from `2.1.0` to `8.0.22` (*recommended for .NET 8.0*)
  - Microsoft.EntityFrameworkCore.InMemory should be updated from `2.1` to `8.0.22` (*recommended for .NET 8.0*)
  - Microsoft.EntityFrameworkCore.SqlServer should be updated from `2.1` to `8.0.22` (*recommended for .NET 8.0*)
  - Microsoft.EntityFrameworkCore.Sqlite should be updated from `2.1` to `8.0.22` (*recommended for .NET 8.0*)
  - Microsoft.Extensions.Configuration should be updated from `2.1.0` to `8.0.0` (*recommended for .NET 8.0*)
  - Microsoft.Extensions.Configuration.EnvironmentVariables should be updated from `2.1.0` to `8.0.0` (*recommended for .NET 8.0*)
  - Microsoft.Extensions.Configuration.FileExtensions should be updated from `2.1.0` to `8.0.1` (*recommended for .NET 8.0*)
  - Microsoft.Extensions.Configuration.Json should be updated from `2.1.0` to `8.0.1` (*recommended for .NET 8.0*)
  - Newtonsoft.Json should be updated from `11.0.2` to `13.0.4` (*security vulnerability*)
  - System.Collections.Immutable should be updated from `1.5.0` to `8.0.0` (*recommended for .NET 8.0*)
  - System.Diagnostics.DiagnosticSource should be updated from `4.5.0` to `8.0.1` (*recommended for .NET 8.0*)

#### ContosoUniversity.Common\ContosoUniversity.Common.csproj modifications

Project properties changes:
  - Target framework should be changed from `netcoreapp2.1` to `net8.0`

NuGet packages changes:
  - Microsoft.AspNetCore.Authentication.Facebook should be updated from `2.1.0` to `8.0.22` (*recommended for .NET 8.0*)
  - Microsoft.AspNetCore.Authentication.Google should be updated from `2.1.0` to `8.0.22` (*recommended for .NET 8.0*)
  - Microsoft.AspNetCore.Authentication.JwtBearer should be updated from `2.1.0` to `8.0.22` (*security vulnerability*)
  - Microsoft.Extensions.Options should be updated from `2.1.0` to `8.0.2` (*recommended for .NET 8.0*)

#### ContosoUniversity.Spa.React\ContosoUniversity.Spa.React.csproj modifications

Project properties changes:
  - Target framework should be changed from `netcoreapp2.1` to `net8.0`

NuGet packages changes:
  - Microsoft.AspNetCore.App should be removed (*package functionality included with framework reference*)
  - Microsoft.AspNetCore.SpaServices.Extensions should be updated from `2.1.1` to `8.0.22` (*recommended for .NET 8.0*)

#### ContosoUniversity.Data.Tests\ContosoUniversity.Data.Tests.csproj modifications

Project properties changes:
  - Target framework should be changed from `netcoreapp2.1` to `net8.0`

#### ContosoUniversity.Api\ContosoUniversity.Api.csproj modifications

Project properties changes:
  - Target framework should be changed from `netcoreapp2.1` to `net8.0`

NuGet packages changes:
  - Microsoft.AspNetCore should be removed (*package functionality included with framework reference*)
  - Microsoft.AspNetCore.Authentication.JwtBearer should be updated from `2.1` to `8.0.22` (*security vulnerability*)
  - Microsoft.AspNetCore.Mvc should be removed (*package functionality included with framework reference*)
  - Microsoft.AspNetCore.Rewrite should be removed (*package functionality included with framework reference*)
  - Microsoft.AspNetCore.StaticFiles should be removed (*package functionality included with framework reference*)

#### ContosoUniversity.Web\ContosoUniversity.Web.csproj modifications

Project properties changes:
  - Target framework should be changed from `netcoreapp2.1` to `net8.0`

NuGet packages changes:
  - Microsoft.AspNetCore.App should be removed (*package functionality included with framework reference*)
