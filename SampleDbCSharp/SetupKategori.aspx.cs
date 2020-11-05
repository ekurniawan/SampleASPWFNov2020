using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleDbCSharp
{
    public partial class SetupKategori : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                sdsKategori.InsertParameters["nama_kat"].DefaultValue = txtNamaKategori.Text;
                sdsKategori.Insert();
                gvKategori.DataBind();

                ltKeterangan.Text =
                    $"<span class='alert alert-success'>Data berhasil kategori {txtNamaKategori.Text} ditambahkan</span>";
            }
            catch (Exception ex)
            {
                ltKeterangan.Text = $"<span class='alert alert-danger'>{ex.Message}</span>";
            }
        }
    }
}