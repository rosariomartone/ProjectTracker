using System.Web.Http;

using ProjectTrackerBusinessLogic;
using ProjectTrackerEntities;
using System.Net;
using System;
using System.Security.Claims;

using System.Linq;
using ProjectTrackerUtilities;

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

        [HttpPost]
        [Route("api/data/userCheck")]
        public IHttpActionResult GetUser([FromBody] ClientUser user)
        {
            BaseUser userCheck = UserLogic.CheckUser(user.Username, MD5Utility.GetMD5Password(user.Password));

            if(userCheck == null)
                return BadRequest("Username or password invalid.");
            else if(userCheck.IsPasswordRecovered)
                return BadRequest("This user is locked.");
            else
                return Ok(userCheck);
        }

        [HttpPost]
        [Route("api/data/changePassword")]
        public IHttpActionResult ChangePassword([FromBody] ClientUser user)
        {
            Int64 userChanged = 0;
            BaseUser userCheck = UserLogic.GetUserIdByToken(user.Token);

            if(userCheck.Id > 0)
                userChanged = UserLogic.ChangeUser(userCheck.Id, MD5Utility.GetMD5Password(user.Password));

            if (userChanged == 0)
                return BadRequest("Invalid data.");
            else
                return Ok("Passord changed.");
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

        [Authorize(Roles = "Admin")]
        [HttpPost]
        [Route("api/data/usersSettings_Delete")]
        public IHttpActionResult SaveUserSettings_Delete([FromBody] ClientUser user)
        {
            try
            {
                UserLogic.SaveUserSettings_Delete(user);

                return Ok(user);
            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, "Errors during User settings deleting: " + ex.Message);
            }
        }

        [Authorize]
        [HttpGet]
        [Route("api/data/authenticate")]
        public IHttpActionResult GetForAuthenticate()
        {
            var identity = (ClaimsIdentity)User.Identity;
            var roles = identity.Claims.Where(c => c.Type == ClaimTypes.Role)
                .Select(c => c.Value);

            return Ok(RoleLogic.GetRoleByName(string.Join(",", roles.ToList())));
        }
    }
}