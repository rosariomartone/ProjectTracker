ProjectTracker
This solution contains the follwoing projects:
- ProjectTrackerAPI
- ProjectTrackerBusinessLogic
- ProjectTrackerDataAccess
- ProjectTrackerEntities
- ProjectTrackerEnum
- ProjectTrackerExtreme
- ProjectTrackerFactory
- ProjectTrackerUtilities

Database is SQL Server, you can find a bak in the main folder after download the zip.

Requirements

.Net Framework 4.5 and later

Source compiling erros:
You could receive errors once downloaded the solution on your machine. The error for me was due to dlls not found.
I have managed this issue unistalling (Nuget Manager) them in the following order and then reinstalling in the opposite:

- Microsoft.AspNet.Mvc
- Microsoft.AspNet.WebPages
- Microsoft.AspNet.Razor
- Microsoft.Owin.Cors
- Microsoft.Owin.Security.OAuth
- Microsoft.Owin.Security
- Microsoft.Owin.Host.SystemWeb
- Microsoft.Owin
- Owin
- Microsoft.Web.Infrastructure
- Microsoft.AspNet.WebApi
- Microsoft.AspNet.Cors
- Microsoft.AspNet.WebApi.Core
- Microsoft.AspNet.WebApi.WebHost
- Microsoft.AspNet.WebApi.Client

Any suggestion or help is appreciated.

Thanks!
