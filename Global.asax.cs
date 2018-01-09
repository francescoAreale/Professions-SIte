using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using WebApplication1;
using System.Web.Http;

namespace WebApplication1
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Codice eseguito all'avvio dell'applicazione
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
            RouteTable.Routes.MapHttpRoute(
                 name: "DefaultApi",
                 routeTemplate: "api/{controller}/{action}/{id}",
                 defaults: new { id = System.Web.Http.RouteParameter.Optional });
        

   // defaults: new { action = "get", id = RouteParameter.Optional }


        }

        void Application_End(object sender, EventArgs e)
        {
            //  Codice eseguito all'arresto dell'applicazione

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Codice eseguito in caso di errore non gestito

        }
    }
}
