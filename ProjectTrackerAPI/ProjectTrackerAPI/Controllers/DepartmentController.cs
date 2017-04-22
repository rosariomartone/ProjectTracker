using System.Web.Http;

using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using System.Net;

namespace ProjectTrackerAPI.Controllers
{
    public class DepartmentController : ApiController
    {
        [Authorize]
        [HttpGet]
        [Route("api/data/departments")]
        public IHttpActionResult GetDepartments()
        {
            return Ok(DepartmentLogic.GetDepartments());
        }
    }
}