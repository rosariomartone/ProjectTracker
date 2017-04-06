using System.Threading.Tasks;

using Microsoft.Owin.Security.OAuth;
using System.Security.Claims;
using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using ProjectTrackerUtilities;

namespace ProjectTrackerAPI
{
    public class ProjectTrackerAuthorizationProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);

            //Use the Factory repository in order to get the right type of user
            BaseUser user = UserLogic.GetUser(context.UserName, MD5Utility.GetMD5Password(context.Password));

            if(user != null)
            {
                identity.AddClaim(new Claim(ClaimTypes.Role, user.Role.Name));
                identity.AddClaim(new Claim("username", user.Username));
                identity.AddClaim(new Claim(ClaimTypes.Name, user.Firstname + " " + user.Surname));
                context.Validated(identity);
            }
            else
            {
                context.SetError("invalid_grant", "Provided username and password are incorrect.");

                return;
            }
        }
    }
}