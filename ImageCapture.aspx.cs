using Microsoft.AspNet.SignalR;
/* Questo script gestisce una POST (che per ora innesco con una form) da cui ricevo una foto.
 * La foto viene salvata sul file system.
 * */
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public delegate void MyEventHandler(string foo);

    public partial class ImageCapture : System.Web.UI.Page
    {
        /*
        public event MyEventHandler SomethingHappened;

        public ImageCapture()
        {
            this.SomethingHappened += new MyEventHandler(HandleSomethingHappened);
        }
        */
        public bool ByteArrayToFile(string _FileName, byte[] _ByteArray)
{
   try
   {
      // Open file for reading
      System.IO.FileStream _FileStream = 
         new System.IO.FileStream(_FileName, System.IO.FileMode.Create,
                                  System.IO.FileAccess.Write);
      // Writes a block of bytes to this stream using data from
      // a byte array.
      _FileStream.Write(_ByteArray, 0, _ByteArray.Length);

      // close file stream
      _FileStream.Close();

      return true;
   }
   catch (Exception _Exception)
   {
      // Error
      Console.WriteLine("Exception caught in process: {0}",
                        _Exception.ToString());
   }

   // error occured, return false
   return false;
}
        protected void Page_Load(object sender, EventArgs e)
        {
           /* HttpPostedFile file = Request.Files["photo"];
            

            if (file != null && file.ContentLength > 0 )
            {
                string fname = Path.GetFileName(file.FileName);
                file.SaveAs(Server.MapPath(Path.Combine("~/Images/", fname)));

                Response.Write("+OK");
            }
            else
                Response.Write("-ERR");*/
           /* System.IO.Stream str; 
            Int32  strLen, strRead;
            str = Request.InputStream;
            // Find number of bytes in stream.
            strLen = Convert.ToInt32(str.Length);
            // Create a byte array.
            byte[] strArr = new byte[strLen];
            // Read stream into byte array.
            if ((strRead = str.Read(strArr, 0, strLen)) > 0)
            {

                ByteArrayToFile(Path.Combine("C:/Users/Francesco/Desktop/SIto", "ciao.bmp"), strArr);

                Response.Write("+OK");
            }
            else {

                Response.Write("-ERR");
            
            }

            */
            var hubContext = GlobalHost.ConnectionManager.GetHubContext<MyHub1>();
            //hubContext.Clients.Group("3EAFF6F0-9EEC-4DE8-883E-378D2AAF19E6").addChatMessage("3EAFF6F0-9EEC-4DE8-883E-378D2AAF19E6", "ciao");
            hubContext.Clients.Group("423e0").addChatMessage("elena baralis", "ciao elenuzza");
          
        
        }

        protected void btnUploadClick(object sender, EventArgs e)
        {
            Label1.Text = "Mi hai cliccato";

            HttpPostedFile file = Request.Files["photo"];

            if (file != null && file.ContentLength > 0)
            {
                string fname = Path.GetFileName(file.FileName);
                file.SaveAs(Server.MapPath(Path.Combine("~/Images/", fname)));
                /*
                MyEventHandler ev = SomethingHappened;
                if (ev != null)
                    ev("foo");*/
            }
        }
        /*
        void HandleSomethingHappened(string foo)
        {
            this.ShowSuccessfulNotification("sucone");
        }*/
    }
}