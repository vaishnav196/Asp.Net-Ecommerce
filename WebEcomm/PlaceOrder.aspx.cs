using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text;
using Razorpay.Api;
using Razorpay;
using System.Drawing;

namespace WebEcomm
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string conf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(conf);
            conn.Open();
            Button1.Enabled = false;

            if (!IsPostBack)
            {
                FetchDetails();
                //GrandTotal();
            }


        }

        protected void FetchDetails()
        {
            string em = Session["MyUser"].ToString();
            string q = "select * from cart where suser='" + em + "' ";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader r = cmd.ExecuteReader();
            r.Read();
            Label2.Text = em;
            Label4.Text = Session["Address"].ToString();
            Label3.Text = Session["Contact"].ToString();
            Label1.Text = "Inv/" + GenerateOrderId();
            Label5.Text = Session["GrandTotal"].ToString();
            //GridView1.DataSource = r;
            //GridView1.DataBind();
        }


        protected string GenerateOrderId()
        {
            Random rnd = new Random();
            return rnd.Next(100, 999).ToString();
        }

        //protected void GrandTotal()
        //{
        //    //conn.Open();
        //    //string em = Session["MyUser"].ToString();
        //    //string q = "select sum(price) as total from cart where suser='"+em+"'";
        //    //SqlCommand c= new SqlCommand(q, conn);
        //    //SqlDataReader rd = c.ExecuteReader();//session created in Cart.aspx.cs for getting grand total
        //    //rd.Read();
        //    ////Label5.Text = rd["total"].ToString();
        //    //Label5.Text = rd["total"].ToString();
        //    Label5.Text = Session["GrandTotal"].ToString();

        //}
        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(sw);
            Panel1.RenderControl(writer);
            StringReader stringReader = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker worker = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            worker.Parse(stringReader);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();

        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

     

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button1.Enabled = true;
            string keyId = "rzp_test_nVRTaBmmVZ10zu";
            string keySecret = "Lhcs2PqZlbWcVh1YUpLnXACS";
            RazorpayClient razorpayClient = new RazorpayClient(keyId, keySecret);
            double amount = double.Parse(Session["GrandTotal"].ToString());

            // Generate a unique receipt ID
            string receiptId = "order_receipt_" + DateTime.Now.ToString("yyyyMMddHHmmss") + new Random().Next(1000, 9999);

            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", amount * 100); // Amount should be in paisa
            options.Add("currency", "INR");
            options.Add("receipt", receiptId); // Unique receipt ID
            options.Add("payment_capture", 1); // Auto capture payment after order creation

            Razorpay.Api.Order order = razorpayClient.Order.Create(options);

            string orderId = order["id"].ToString();

            string razorpayScript = $@"
        var options = {{
          'key': '{keyId}',
            'amount': {amount * 100},
            'currency': 'INR',
            'name': 'Apna Kart',
            'description': 'Checkout Payment',
            'order_id': '{orderId}',
            'handler': function(response) {{
                alert('Payment successful. Payment ID: ' + response.razorpay_payment_id);
            }},
            'prefill': {{
                'name': 'VAISHNAV PRADEEP GHANGALE',
                'email': 'vaishnavghangale19@gmail.com',
                'contact': '8108136181'
            }},
            'theme': {{
                'color': '#3399cc'
            }}
        }};
    var rzp1 = new Razorpay(options);
    rzp1.open();
";
            ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript, true);
        }


    }
}