using System;
using System.Collections.Generic;
using System.IO;
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
            lblDate1.Text = DateTime.Now.ToString();
            lblDate2.Text = DateTime.Now.ToString();
        }

        protected void btnInsertProduct_Click(object sender, EventArgs e)
        {
            try
            {
                string strFileName = string.Empty;
                if (fpImagePath.HasFile)
                {
                    if (Helpers.Helpers.CekTipeFile(fpImagePath.FileName))
                    {
                        strFileName = $"{Guid.NewGuid().ToString().Substring(0, 5)}-{fpImagePath.FileName}";
                        string strPath = Path.Combine("~/Images/", strFileName);
                        string strUpload = MapPath(strPath);
                        fpImagePath.SaveAs(strUpload);
                    }
                }

                odsProduct.InsertParameters["ProductName"].DefaultValue = txtProductName.Text;
                odsProduct.InsertParameters["Description"].DefaultValue = txtDescription.Text;
                odsProduct.InsertParameters["ImagePath"].DefaultValue = strFileName;
                odsProduct.InsertParameters["UnitPrice"].DefaultValue = txtUnitPrice.Text;
                odsProduct.InsertParameters["CategoryID"].DefaultValue = ddKategori.SelectedValue.ToString();

                odsProduct.Insert();
                ltKeterangan.Text = $"<span class='alert alert-success'>Berhasil menambah data produk</span>";
            }
            catch (Exception ex)
            {
                ltKeterangan.Text = $"<span class='alert alert-danger'>Error: {ex.Message}</span>";
            }
        }
    }
}