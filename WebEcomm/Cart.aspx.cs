using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace WebEcomm
{
   
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection conn;
        string address, contact;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();

            if (!IsPostBack)
            {
                FetchCart();
                GrandTotal();
            }

            address=TextBox1.Text;
            contact=TextBox2.Text;

            Session["Address"]=address;
            Session["Contact"]=contact;

        }

        protected void GrandTotal()
        {
            string total_price;
            if (Session["MyUser"] != null)
            {
                conn.Close();
                conn.Open();
                string suser = Session["MyUser"].ToString();
                string q = "select sum(price) as total from cart where suser='" + suser + "'";
                SqlCommand cmd = new SqlCommand(q, conn);   
                SqlDataReader r = cmd.ExecuteReader();  
                r.Read();
                total_price = r["total"].ToString();
                Session["GrandTotal"] = total_price;
                Label8.Text = total_price;
                

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void FetchCart()
        {
            if (Session["MyUser"] != null)
            {
                string suser = Session["MyUser"].ToString();
                string q = "exec FetchCartBySession '" + suser + "' ";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                //reader.Read();
                GrandTotal();
                //Label8.Text = Session["GrandTotal"].ToString();
                //string total_price = reader["total"].ToString();
                //Label8.Text = total_price;
                //Session["GrandTotal"] = total_price;
            }
            else {
                Response.Redirect("Login.aspx");
            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Session["MyUser"] != null)
            {
                string address, contact;
                address = TextBox1.Text;
                contact = TextBox2.Text;
                string us = Session["MyUser"].ToString();
                string q = "insert into placeorder (pname,pcat,price,qty,dt,suser,perprice,address,contact,pstatus) select pname,pcat,price,qty,dt,suser,perprice,'" + address + "','" + contact + "','Not Delivered' from cart where suser='" + us + "'";
                SqlCommand cmd = new SqlCommand(q, conn);
                int row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    string q1 = "delete from cart where suser='" + us + "'";
                    SqlCommand cmd1 = new SqlCommand(q1, conn);
                    cmd1.ExecuteNonQuery();
                    Response.Redirect("PlaceOrder.aspx");
                }
                else
                {
                    Response.Write("</script>alert('Something went wrong !')</script>");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
            Label l1 = (Label)GridView1.Rows[e.RowIndex].FindControl("Label8");
            int id = int.Parse(l1.Text.ToString());
            

            string q="exec DeleteCartProduct '"+id+"'";
            SqlCommand cmd=new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            FetchCart();

        }

    }
}