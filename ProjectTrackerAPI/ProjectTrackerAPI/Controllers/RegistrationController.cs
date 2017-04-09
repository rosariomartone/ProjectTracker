using System.Web.Http;

using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using System.Net;

namespace ProjectTrackerAPI.Controllers
{
    public class RegistrationController : ApiController
    {
        [HttpPost]
        [Route("api/data/registration")]
        public IHttpActionResult RegisterNewUser([FromBody] ClientUser user)
        {
            user.Password = ProjectTrackerUtilities.MD5Utility.GetMD5Password(user.Password);

            long checkUser = UserLogic.RegisterNewUser(user);

            if (checkUser == -1)
                return Ok(user);
            else
                return Content(HttpStatusCode.Ambiguous, "User is already in archive.");
        }
    }
}
