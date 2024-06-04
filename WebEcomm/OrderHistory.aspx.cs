using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEcomm
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn= new SqlConnection(cnf);
            conn.Open();
            //string d = DateTime.Now.ToString("MM/dd/yyyy");
            //Response.Write(d);
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //string from, to;
        //    //from=TextBox1.Text;
        //    //to=TextBox2.Text;

        //    //string q = "select * from placeorder where dt between '" + from + "' AND '" + to + "'";
        //    //SqlCommand cmd=new SqlCommand(q,conn);
        //    //SqlDataReader rdr = cmd.ExecuteReader();
        //    //GridView1.DataSource = rdr;
        //    //GridView1.DataBind();   
        //}

        
    }
}