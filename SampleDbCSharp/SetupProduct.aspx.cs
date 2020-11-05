using SampleDbCSharp.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleDbCSharp
{
    public partial class SetupProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetData_Click(object sender, EventArgs e)
        {
            CategoryDAL categoryDAL = new CategoryDAL();
            gvProduct.DataSource = categoryDAL.GetAll();
            gvProduct.DataBind();
        }
    }
}