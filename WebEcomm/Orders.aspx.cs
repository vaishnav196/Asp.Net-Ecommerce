using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEcomm
{
    public partial class Orders : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();

            //if (!IsPostBack)
            //{
            //    FetchUsers();
            //}

        }

        //public void FetchUsers()
        //{
        //    string q = "exec UserListProc";
        //    SqlDataAdapter adapter = new SqlDataAdapter(q, conn);
        //    DataTable dt = new DataTable();
        //    adapter.Fill(dt);
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();

        //}

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{

        //    if (e.CommandName == "Status")
        //    {
        //        string q1;
        //        string id=e.CommandArgument.ToString();
        //        string q = "select * from placeorder where pid='"+id+"'";
        //        //string q="exec UserFindById '"+id+"' ";
        //        SqlCommand c=new SqlCommand(q,conn);
        //        SqlDataReader r = c.ExecuteReader();
        //        r.Read();
        //        string status=r["pstatus"].ToString();

        //        if (status.Equals("Not Delivered"))
        //        {
        //            q1 = "update placeorder set pstatus='Delivered' where pid='"+id+"'";
        //            SqlCommand cmd = new SqlCommand(q1, conn);
        //            cmd.ExecuteNonQuery();
        //            Response.Redirect("Orders.aspx");
        //        }

        //    }
        //}

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Status")
            {
                string q1;
                string id = e.CommandArgument.ToString();
                string q = "select * from placeorder where pid='" + id + "'";
                
                SqlCommand c = new SqlCommand(q, conn);
                SqlDataReader r = c.ExecuteReader();
                r.Read();
                string pstatus = r["pstatus"].ToString();
                conn.Close();
                conn.Open();
                if (pstatus.Equals("Not Delivered"))
                {
                    q1 = "update placeorder set pstatus='Delivered' where pid='" + id + "'";
                    SqlCommand cmd = new SqlCommand(q1, conn);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Orders.aspx");
                }
            }
        }
    }
}