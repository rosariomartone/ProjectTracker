using System.Web.Http;

using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using System.Net;

namespace ProjectTrackerAPI.Controllers
{
    public class ForgottenController : ApiController
    {
        [HttpPost]
        [Route("api/data/forgotten")]
        public IHttpActionResult RetrieveUser([FromBody] ClientUser user)
        {
            long retrieveUser = UserLogic.RetrieveUser(user);

            if (retrieveUser == 0)
                return Content(HttpStatusCode.Ambiguous, "User does not exists in archive.");
            else
                return Ok(user);
        }
    }
}