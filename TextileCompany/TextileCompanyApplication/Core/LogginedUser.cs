using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TextileCompanyApplication.Model.Entities;

namespace TextileCompanyApplication.Core
{
    public static class LogginedUser
    {
        private static User _logginedUser;

        static LogginedUser() => _logginedUser = new User();

        public static void SetUser(User user) => _logginedUser = user;

        public static User GetUser() => _logginedUser;

        public static void ResetUser() => _logginedUser = new User();
    }
}