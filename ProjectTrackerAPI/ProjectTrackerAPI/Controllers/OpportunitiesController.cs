using System.Web.Http;

using ProjectTrackerBusinessLogic;

namespace ProjectTrackerAPI.Controllers
{
    public class OpportunitiesController : ApiController
    {
        [Authorize]
        [HttpGet]
        [Route("api/data/opportunities")]
        public IHttpActionResult GetOpportunities()
        {
            return Ok(OpportunityLogic.GetOpportunities());
        }
    }
}
