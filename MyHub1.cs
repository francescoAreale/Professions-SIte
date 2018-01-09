using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;
using System.Web.Security;

namespace WebApplication1
{
 
    public class MyHub1 : Hub
    {
      
            //Clients.All.broadcastMessage(message);
        public void SendChatMessage(string who, string message)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
              /*  string name = Membership.GetUser(HttpContext.Current.User.Identity.Name)
                Clients.Group(name).addChatMessage(name, message);
                Clients.Group("2@2.com").addChatMessage(name, message);*/
            }
        }

        public override Task OnConnected()
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                string name = Membership.GetUser(HttpContext.Current.User.Identity.Name).ProviderUserKey.ToString().Substring(0,5);
                Groups.Add(Context.ConnectionId, name);
                
            }
            return base.OnConnected();
        }
        
       
    }
}