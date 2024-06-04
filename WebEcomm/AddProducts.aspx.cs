using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace WebEcomm
{
    
    public partial class AddProducts : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            String cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pname, pcat, pic, dt;
            int price;

            pname = TextBox1.Text;
            pcat = DropDownList1.SelectedValue;

            FileUpload1.SaveAs(Server.MapPath("Products/") + Path.GetFileName(FileUpload1.FileName));
            pic = "Products/" + Path.GetFileName(FileUpload1.FileName);

            dt = DateTime.Now.ToString("dd/MM/yyyy");
            price = Convert.ToInt32(TextBox3.Text);

            string q = "exec AddProduct '" + pname + "','" + pcat + "','" + pic + "','" + dt + "','" + price + "'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Product added succesfully!!')</script>");
        }
    }
}