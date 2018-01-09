using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {

      
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();

            String strConnString = System.Configuration.ConfigurationManager.
                ConnectionStrings["DatabaseProject"].ConnectionString;
            string strQuery = "SELECT  U.[UserId],[UserName],[Email],[Foto] FROM Users U ,Memberships M,UsersInRoles UR, Roles R WHERE U.UserId  = M.UserId AND U.UserId  = UR.UserId AND UR.RoleId = R.RoleId AND R.RoleName <> 'SimpleUser'";
            SqlCommand cmd = new SqlCommand(strQuery);
            SqlConnection con = new SqlConnection(strConnString); 
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();



            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
                dt.Dispose();
            }

        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //Accessing BoundField Column
            string strValue = ((HiddenField)GridView1.SelectedRow.Cells[0].FindControl("UserId")).Value;

 
            string name = GridView1.SelectedRow.Cells[1].Text;
           
            //Accessing TemplateField Column controls
            string country = (GridView1.SelectedRow.FindControl("Email") as System.Web.UI.WebControls.Label).Text;

            Label1.Text = "<b>Name:</b> " + name + " <b>Email:</b> " + country;

            Response.Redirect("~/CreaAppuntamento.aspx?field1=" + strValue + "&field2=" + name);

        }



    }
}