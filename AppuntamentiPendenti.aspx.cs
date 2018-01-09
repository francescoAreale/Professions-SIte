using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AppuntamentiPendenti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            String strConnString = System.Configuration.ConfigurationManager.
                ConnectionStrings["DatabaseProject"].ConnectionString;
            string strQuery = "SELECT * FROM Users U ,AppointmentDiary Ap WHERE U.UserId  = Ap.idUtente AND Ap.nomeProfessore = '" +User.Identity.Name+ "'" +" AND StatusENUM=1";
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
        protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string IDString="";
            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            if (GridView1.Rows[index] != null)
            {
                GridViewRow selectedRow = GridView1.Rows[index];
                TableCell id = selectedRow.Cells[0];
                 IDString = id.Text;
            }

            // Display the selected author.



            if (IDString != null)
            {
                string strValue = ((HiddenField)GridView1.Rows[0].Cells[0].FindControl("ID")).Value;




                if (e.CommandName == "Accept")
                {

                    //Add Entry to DataBase
                    String strConnString = System.Configuration.ConfigurationManager
                        .ConnectionStrings["DatabaseProject"].ConnectionString;
                    SqlConnection con = new SqlConnection(strConnString);
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("Update AppointmentDiary SET StatusENUM='" + 0 + " ' WHERE ID='" + strValue + "'", con);
                    cmd1.ExecuteNonQuery();
                    con.Close();
                }
                else
                    Label1.Text = "ERR1";


                if (e.CommandName == "Reject")
                {
                    //Add Entry to DataBase
                    String strConnString = System.Configuration.ConfigurationManager
                        .ConnectionStrings["DatabaseProject"].ConnectionString;
                    SqlConnection con = new SqlConnection(strConnString);
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("Update AppointmentDiary SET StatusENUM='" + 2 + " ' WHERE ID='" + strValue + "'", con);
                    cmd1.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
                Label1.Text = "ERR2";

          //  }
            //else
              //  Label1.Text = "ERR";
            

           // if(GridView1.SelectedRow.Cells[5].Text=="Reject")
            Response.Redirect("./AppuntamentiPendenti.aspx");
        }
    }
}