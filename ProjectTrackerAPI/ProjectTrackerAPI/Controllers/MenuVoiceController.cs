using System.Web.Http;

using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using System.Net;

namespace ProjectTrackerAPI.Controllers
{
    public class MenuVoiceController : ApiController
    {
        [Authorize]
        [HttpGet]
        [Route("api/data/menuvoices/{id}")]
        public IHttpActionResult GetMenuVoices(int id)
        {
            return Ok(MenuVoicesLogic.GetMenuVoicesByMenuId(id));
        }
    }
}