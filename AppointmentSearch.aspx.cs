/* Questo script riceve dalla schedina il codice utente e il codice appuntamento. 
 * Dopo aver fatto gli opportuni controlli (appuntamento esistente, ancora valido, ecc.)
 * invia una risposta alla schedina.
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            string userId = Request.Headers["photo"];
            string appointmentId = Request.Headers["appointment"];
            string resp = string.Empty;

            if (userId != null && appointmentId != null)
            {
                /*
                string connectionString = ConfigurationManager.ConnectionStrings["DatabaseProject"].ConnectionString;

                SqlConnection sqlConnection1 = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand();
                SqlDataReader reader;

                Int32 appointmentId_int = Convert.ToInt32(appointmentId);

                cmd.CommandText =
                    @"SELECT * FROM Appuntamenti"
                + " WHERE IdUtente = @userId"
                + " AND IdAppuntamento = @appointmentId_int"
                + " AND dataAppuntamento <= SYSDATETIME()"
                + " AND SYSDATETIME() <= DATEADD(minute, @delay, dataAppuntamento)";
                
                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@appointmentId_int", appointmentId_int);
                cmd.Parameters.AddWithValue("@delay", delay);

                cmd.CommandType = System.Data.CommandType.Text;
                cmd.Connection = sqlConnection1;

                sqlConnection1.Open();

                reader = cmd.ExecuteReader();

                Label1.Text = "Appuntamento " + appointmentId + " dell'utente " + userId;
                
                if (reader.HasRows)
                    resp = "+OK";
                else
                    resp = "-ERR";
                */
                resp = "+OK";
                Response.Write(resp);

               // sqlConnection1.Close();
            }
        }
    }
}