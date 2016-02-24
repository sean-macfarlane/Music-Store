using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2.Admin
{
    public partial class EditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (Assignment2Entities db = new Assignment2Entities())
                {
                    try
                    {
                        int id;
                        Int32.TryParse(Request.QueryString["id"], out id);

                        Category cat = db.Categories.FirstOrDefault(c => c.CategoryId == id);
                        txtName.Text = cat.Name;
                    }
                    catch { }
                }
            }
        }
        protected void Edit_Category(object sender, EventArgs e)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {
                    int id;
                    Int32.TryParse(Request.QueryString["id"], out id);

                    Category cat = db.Categories.FirstOrDefault(c => c.CategoryId == id);
                    cat.Name = txtName.Text;
                    db.SaveChanges();

                    Response.Redirect("Default.aspx");
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
                }
            }
        }
    }
}