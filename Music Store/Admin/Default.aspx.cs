using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   
                using  (Assignment2Entities db = new Assignment2Entities()) {
                    try
                    {
                        categories.DataSource = db.Categories.ToList();
                        categories.DataBind();
                        products.DataSource = db.Products.ToList();
                        products.DataBind();
                    }
                    catch { }
                }
            }
        }
        protected void delete_Category_OnClick(object sender, EventArgs e)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {
                    int id = Int32.Parse(((Button)sender).CommandArgument);

                    foreach (Product product in (db.Products.Where(p => p.CategoryId == id).ToList()))
                    {
                        db.Comments.RemoveRange(db.Comments.Where(c => c.Products_ProductId == product.ProductId).ToList());
                        db.Products.Remove(product);
                    }
                    db.SaveChanges();

                    db.Categories.Remove(db.Categories.Where(c => c.CategoryId == id).First());
                    db.SaveChanges();
                    products.DataSource = db.Products.ToList();
                    products.DataBind();
                    categories.DataSource = db.Categories.ToList();
                    categories.DataBind();
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error: Please try again');", true);
                }
            }
        }
        protected void edit_Category_OnClick(object sender, EventArgs e)
        {          
            int id = Int32.Parse(((Button)sender).CommandArgument);
            Response.Redirect("EditCategory.aspx?id="+id);
        }
        protected void clickAddCategory(object sender, EventArgs e)
        {      
            Response.Redirect("AddCategory.aspx");
        }

        protected void delete_Product_OnClick(object sender, EventArgs e)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {
                    int id = Int32.Parse(((Button)sender).CommandArgument);
                    db.Comments.RemoveRange(db.Comments.Where(c => c.Products_ProductId == id).ToList());
                    db.SaveChanges();

                    db.Products.Remove(db.Products.Where(p => p.ProductId == id).First());
                    db.SaveChanges();
                    products.DataSource = db.Products.ToList();
                    products.DataBind();
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error: Please try again');", true);
                }
            }
        }
        protected void edit_Product_OnClick(object sender, EventArgs e)
        {          
            int id = Int32.Parse(((Button)sender).CommandArgument);
            Response.Redirect("EditProduct.aspx?id="+id);
        }
        protected void clickAddProduct(object sender, EventArgs e)
        {      
            Response.Redirect("AddProduct.aspx");
        }
    }
}