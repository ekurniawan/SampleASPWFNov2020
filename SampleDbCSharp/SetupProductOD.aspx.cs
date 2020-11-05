using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleDbCSharp
{
    public partial class SetupProductOD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            odProduct.InsertParameters[0].DefaultValue = txtCategoryName.Text;
            odProduct.InsertParameters[1].DefaultValue = txtDescription.Text;
            try
            {
                odProduct.Insert();
                lblKet.Text = "Data berhasil ditambah";
            }
            catch (Exception ex)
            {
                lblKet.Text = $"Error: {ex.Message}";
            }
        }
    }
}