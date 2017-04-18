using System.Web.Http;

using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using System.Net;

namespace ProjectTrackerAPI.Controllers
{
    public class RoleController : ApiController
    {
        [Authorize]
        [HttpGet]
        [Route("api/data/roles")]
        public IHttpActionResult GetRoles()
        {
            return Ok(RoleLogic.GetRoles());
        }
    }
}