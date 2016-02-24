using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class CategoryDetails : System.Web.UI.Page
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

                        Page.Title = db.Categories.FirstOrDefault(p => p.CategoryId == id).Name;

                        products.DataSource = db.Products.Where(p => p.CategoryId == id).ToList();
                        products.DataBind();
                    }
                    catch { }
                }
            }
        }
    }
}