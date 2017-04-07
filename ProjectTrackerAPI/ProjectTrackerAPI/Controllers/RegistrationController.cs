using System.Web.Http;

using ProjectTrackerBusinessLogic;

namespace ProjectTrackerAPI.Controllers
{
    public class RegistrationController : ApiController
    {
        [HttpPut]
        [Route("api/data/registration")]
        public IHttpActionResult GetOpportunities()
        {
            return Ok(OpportunityLogic.GetOpportunities());
        }
    }
}
