using Itenso.TimePeriod;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class CreaAppuntaento : System.Web.UI.Page
    {
        
      
        private List<String> idList = new List<String>();
        private String nameFromTable;
        private String nameProf;
        private String IdProf;
        private String fotoUrl;
        public string IdProfs { get { return IdProf; } }
        public string nameProfs { get { return nameProf; } }
        public string FotoUrl { get { return fotoUrl; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            nameProf = Request.QueryString["field2"];
            IdProf = Request.QueryString["field1"];

            Label4.Text = nameProf;
        /*    GoogleCalendar calendar = new GoogleCalendar
	("Francesco Reale", "frangsjoe@gmail.com", "qgKonD33");
            CalendarEventObject[] events = calendar.GetEvents();
         * 
         * 
            */
            String strConnString = System.Configuration.ConfigurationManager.
                 ConnectionStrings["DatabaseProject"].ConnectionString;
            string strQuery = "SELECT  [Foto] FROM Users WHERE UserId ='" + IdProf + "'";
            SqlCommand cmd = new SqlCommand(strQuery);
            SqlConnection con = new SqlConnection(strConnString);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {

                    fotoUrl = dr.GetString(0);
                    Image1.ImageUrl = fotoUrl;
                    
                }
            }
            con.Close();
            
        }

        
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

           // Label3.Text = Calendar1.SelectedDate.ToShortDateString(); ;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

       


    }
}