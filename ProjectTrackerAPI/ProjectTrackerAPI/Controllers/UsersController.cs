using System.Web.Http;

using ProjectTrackerBusinessLogic;

namespace ProjectTrackerAPI.Controllers
{
    public class UsersController : ApiController
    {
        [Authorize]
        [HttpGet]
        [Route("api/data/users")]
        public IHttpActionResult GetUsers()
        {
            return Ok(UserLogic.GetUsers());
        }
    }
}