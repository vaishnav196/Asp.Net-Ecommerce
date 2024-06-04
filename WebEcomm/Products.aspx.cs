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
    public partial class Products : System.Web.UI.Page
    {

        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();

            if (!IsPostBack)
            {
                //FetchAllProduct();
            }

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //Response.Redirect("Cart.aspx");

        //    FetchAllProduct();
        //}

        //protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        //{



        //}


        //public void FetchAllProduct()
        //{
        //    string q = "select * from Product ";

        //    SqlCommand cmd = new SqlCommand(q, conn);
        //    SqlDataReader r = cmd.ExecuteReader();
        //    DataList1.DataSource = r;
        //    DataList1.DataBind();
        //}

        //public void addTocartLogic()
        //{
        //    string pname, pcat, imgUrl, suser, dt;
        //    double price, totalprice;
        //    int qty;

        //    if (e.CommandName == "AddToCart")
        //    {
        //        string id e.CommandArgument.ToString();
        //        string q = "exec FindProductById '" + id + "' ";

        //        SqlCommand cmd = new SqlCommand(q, conn);
        //        SqlDataReader rd = cmd.ExecuteReader();
        //        if (rd.HasRows)
        //        {
        //            rd.Read();
        //            pname = rd["pname"].ToString();
        //            pcat = rd["pcat"].ToString();
        //            imgUrl = rd["imgUrl"].ToString();
        //            price = double.Parse(rd["price"].ToString());
        //            DropDownList dl = (DropDownList)e.Item.FindControl("DropDownList");
        //            qty = int.Parse(dl.SelectedValue.ToString());
        //            totalprice = price * qty;


        //            dt = DateTime.Now.ToString("d-m-yyyy");
        //            suser = Session("").toString();


        //            string q1 = "exec AddToCart  '" + pname + "','" + pcat + "','" + totalprice + "','" + qty + "','" + imgUrl + "','" + dt + " ','" + suser + "','" + price + "'";
        //            SqlCommand c = new SqlCommand(q1, conn);
        //            c.ExecuteNonQuery();
        //            Response.Redirect("Cart.aspx");


        //        }
        //    }
        //}

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string pname, pcat, pic, suser, dt;
            double price, totalprice;
            int qty;
            if (e.CommandName == "AddToCart")
            {
                string id = e.CommandArgument.ToString();
                Response.Write(id);
                string q = "exec FetchProductById '" + id + "' ";

                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Read();
                    pname = rd["pname"].ToString();
                    pcat = rd["pcat"].ToString();
                    pic = rd["pic"].ToString();
                    price = double.Parse(rd["price"].ToString());
                    DropDownList dl = (DropDownList)e.Item.FindControl("DropDownList1");
                    qty = int.Parse(dl.SelectedValue.ToString());
                    totalprice = price * qty;


                    dt = DateTime.Now.ToString("d-m-yyyy");
                    suser = Session["MyUser"].ToString();
                    conn.Close();
                    conn.Open();

                    string q1 = "exec AddToCart  '" + pname + "','" + pcat + "','" + totalprice + "','" + qty + "','" + pic + "','" + dt + " ','" + suser + "','" + price + "'";
                    SqlCommand c = new SqlCommand(q1, conn);
                    c.ExecuteNonQuery();
                    Response.Redirect("Cart.aspx");

                }
            }
        }
    }
}

        // this is to be place in User master Page 
        //public void countProduct()
        //{
        //    string suser = Session[""].ToString();
        //    string q = "select count(pid) as cnt from Cart where suser='" + suser + "'";

        //    SqlCommand cmd=new SqlCommand(q,conn);
        //    SqlDataReader reader = cmd.ExecuteReader();
        //    reader.Read();
        //    Label2.Text = reader["cnt"].ToString();

        //}
    
