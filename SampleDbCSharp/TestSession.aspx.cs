using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleDbCSharp
{
    public partial class TestSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSession_Click(object sender, EventArgs e)
        {
            Session["ProductID"] = 1;
        }

        protected void btnCekSession_Click(object sender, EventArgs e)
        {
            if (Session["ProductID"] != null)
            {
                lblKeterangan.Text = "Nilai Session: "+Session["ProductID"];
            }
            else
            {
                lblKeterangan.Text = "Nilai Session Belum Ada";
            }
        }
    }
}