using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleDbCSharp
{
    public partial class SetupProductDapper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsertProduct_Click(object sender, EventArgs e)
        {
            try
            {
                if (fpImagePath.HasFile)
                {

                }

                odsProduct.InsertParameters["ProductName"].DefaultValue = txtProductName.Text;
                odsProduct.InsertParameters["Description"].DefaultValue = txtDescription.Text;
                odsProduct.InsertParameters["ImagePath"].DefaultValue = 
                    $"{Guid.NewGuid().ToString().Substring(0,5)}-{fpImagePath.FileName}";
                odsProduct.InsertParameters["UnitPrice"].DefaultValue = txtUnitPrice.Text;
                odsProduct.InsertParameters["CategoryID"].DefaultValue = ddKategori.SelectedValue.ToString();


            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}