using System.Web.Http;

using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using System.Net;

namespace ProjectTrackerAPI.Controllers
{
    public class StoreController : ApiController
    {
        [Authorize]
        [HttpGet]
        [Route("api/data/stores")]
        public IHttpActionResult GetStores()
        {
            return Ok(StoreLogic.GetStores());
        }
    }
}