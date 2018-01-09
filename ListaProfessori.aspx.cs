using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ListaProfessori : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             List<string> lst = new List<string>();
            String resp=null;
            String strConnString = System.Configuration.ConfigurationManager.
                ConnectionStrings["DatabaseProject"].ConnectionString;


            //The SQL you want to execute
            string strQuery = "SELECT U.[UserId], [UserName] FROM Users As U ,Memberships As M,UsersInRoles As UR, Roles As R WHERE U.UserId  = M.UserId AND U.UserId  = UR.UserId AND UR.RoleId = R.RoleId AND R.RoleName <> 'SimpleUser'";
            SqlCommand cmd = new SqlCommand(strQuery);
            SqlConnection cnx = new SqlConnection(strConnString);
            //Open the connection to the database
            cnx.Open();
            SqlCommand command = new SqlCommand(strQuery, cnx);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                resp += reader[0].ToString() + " , " + reader[1].ToString() + " ; ";
            }

            Response.Write(resp);
        }

       


        }
    }
