using System.Web.Http;

using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using System.Net;
using System;
using System.Collections.Generic;

namespace ProjectTrackerAPI.Controllers
{
    public class UsersController : ApiController
    {
        [Authorize(Roles = "Admin")]
        [HttpGet]
        [Route("api/data/users")]
        public IHttpActionResult GetUsers()
        {
            return Ok(UserLogic.GetUsers());
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        [Route("api/data/usersSettings")]
        public IHttpActionResult SaveUserSettings([FromBody] ClientUser user)
        {
            try
            {
                UserLogic.SaveUserSettings(user);

                return Ok(user);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, "Errors during User settings saving: " + ex.Message);
            }
        }
    }
}