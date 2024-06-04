using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebEcomm
{
    public partial class UserList : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Other page load logic here
            string conf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();

            if (!IsPostBack)
            {
                FetchUser();
                //GrandTotal();
            }
        }

        protected void FetchUser()
        {

            // string suser = Session["MyUser"].ToString();
            string q = "select * from user_account where acc_role='User' ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            //reader.Read();
            //GrandTotal();
            //Label8.Text = Session["GrandTotal"].ToString();
            //string total_price = reader["total"].ToString();
            //Label8.Text = total_price;
            //Session["GrandTotal"] = total_price;

        }
            protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the ID of the row being deleted
            //int id = Convert.ToInt32(GridView1.DataKeys[e.['"++"'].Value);

            // Delete the row from the database
            // You need to implement your own logic to delete from the database
            // For example, you might call a stored procedure or execute a SQL query

            // After deleting the row, you might want to rebind the GridView to reflect the changes
            //GridView1.DataBind();
            Label l1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label8");
            int id = int.Parse(l1.Text.ToString());


            string q = "exec DeleteUser '" + id + "'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            FetchUser();
        }
    }
}
