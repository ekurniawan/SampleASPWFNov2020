using SampleDbCSharp.Models;
using SampleDbCSharp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleDbCSharp
{
    public partial class CategoryWithServices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            odsCategory.InsertParameters[0].DefaultValue = txtCategoryName.Text;
            odsCategory.InsertParameters[1].DefaultValue = txtDescription.Text;
            try
            {
                odsCategory.Insert();
                ltKeterangan.Text =
                    $"<span class='text-success'>Data category {txtCategoryName.Text} berhasil ditambah</span>";
            }
            catch (Exception ex)
            {
                ltKeterangan.Text =
                   $"<span class='text-danger'>Error: {ex.Message}</span>";
            }
        }

        protected void odsCategory_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
        {
            if (Session["username"] != null && Session["password"] != null)
            {
                string username = Session["username"].ToString();
                string password = Session["password"].ToString();

                CategoryServices myServices = new CategoryServices(username, password);
                e.ObjectInstance = myServices;
            }

        }

        protected void odsCategory_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                //ltKeterangan.Text = $"<span class='text-danger'>{e.Exception.Message}</span>";
                if (e.Exception.Message == "Exception has been thrown by the target of an invocation.")
                {
                    Response.Redirect("~/LoginForm");
                }

                e.ExceptionHandled = true;
            }
        }
    }
}