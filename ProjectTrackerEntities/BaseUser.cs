using System;

namespace ProjectTrackerEntities
{
    public abstract class BaseUser : IBaseUser
    {
        public Int64 Id { get; set; }

        public string Firstname { get; set; }

        public string Surname { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }

        public string Email { get; set; }

        public Role Role { get; set; }

        public String IsActive { get; set; }
    }
}
