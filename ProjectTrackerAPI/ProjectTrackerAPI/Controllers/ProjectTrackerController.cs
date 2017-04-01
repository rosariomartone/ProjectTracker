﻿using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace ProjectTrackerAPI.Controllers
{
    public class ProjectTrackerController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        [Route("api/data/forall")]
        public IHttpActionResult Get()
        {
            return Ok("Now server time is: " + DateTime.Now.ToString());
        }

        [Authorize]
        [HttpGet]
        [Route("api/data/authenticate")]
        public IHttpActionResult GetForAuthenticate()
        {
            var identity = (ClaimsIdentity)User.Identity;

            return Ok("Hello " + identity.Name);
        }

        [Authorize(Roles = "Admin")]
        [HttpGet]
        [Route("api/data/authorize")]
        public IHttpActionResult GetForAdmin()
        {
            var identity = (ClaimsIdentity)User.Identity;
            var roles = identity.Claims
                .Where(c => c.Type == ClaimTypes.Role)
                .Select(c => c.Value);

            return Ok("Hello " + identity.Name + " Role: " + string.Join(",", roles.ToList()));
        }
    }
}
