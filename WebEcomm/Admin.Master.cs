﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEcomm
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["MyUser"] != null)
            //{
            //    Label1.Text = Session["MyUser"].ToString();
            //}
            //else
            //{
            //    Response.Write("<script>alert('You need to Login Again!!');window.location.href='LoginPage.aspx'");
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon(); //it will destroy all the session
            Response.Redirect("default.aspx");
        }
    }
}