using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace WebApplication1
{
    public class CustomerId : IUserIdProvider
    {
        public string GetUserId(IRequest request)
        {
            // your logic to fetch a user identifier goes here.

            // for example:
            if (request.User.Identity.IsAuthenticated)
            {
                var userId = Membership.GetUser(HttpContext.Current.User.Identity.Name).ProviderUserKey.ToString();
                return userId.ToString();
            }
            else return null;
        }


    }
}