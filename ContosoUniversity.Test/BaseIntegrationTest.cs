using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;

namespace ContosoUniversity.Tests
{
    public abstract class BaseIntegrationTest<TStartup> where TStartup : class
    {
        protected TestServer InitTestServer()
        {
            var builder = new WebHostBuilder()
                .UseStartup<TStartup>()
                .ConfigureAppConfiguration((context, config) =>
                {
                    config.SetBasePath(Directory.GetCurrentDirectory())
                        .AddJsonFile("appsettings.json", optional: true)
                        .AddJsonFile("appsettings.Testing.json", optional: true)
                        .AddEnvironmentVariables();
                });

            return new TestServer(builder);
        }
    }
}
