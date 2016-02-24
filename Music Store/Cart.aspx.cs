using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (Assignment2Entities db = new Assignment2Entities())
                {
                    try
                    {
                        List<Product> list = (List<Product>)Session["cart"];

                        if (list != null && list.Count > 0)
                        {
                            itemTotal.Visible = true;
                            numItems.Text = list.Count.ToString();
                            CheckoutBtn.Enabled = true;
                            Total.Visible = true;
                            decimal totalPrice = 0;
                            foreach (Product p in list)
                            {
                                if (p.IsOnSale)
                                {
                                    totalPrice += p.SalePrice;
                                }
                                else
                                {
                                    totalPrice += p.Price;
                                }
                            }
                            TotalValue.Text = totalPrice.ToString();
                        }

                        products.DataSource = list;
                        products.DataBind();
                    }
                    catch { }
                }
            }
        }
        protected void ContinueShopping(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void CheckOut(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }

        protected void removeItem(object sender, EventArgs e)
        {
            try
            {
                int id = Int32.Parse(((Button)sender).CommandArgument);
                List<Product> list = (List<Product>)Session["cart"];

                foreach (Product product in list)
                {
                    if (product.ProductId == id)
                    {
                        decimal totalPrice = Convert.ToDecimal(TotalValue.Text);
                        if (product.IsOnSale)
                        {
                            totalPrice -= product.SalePrice;
                        }
                        else
                        {
                            totalPrice -= product.Price;
                        }
                        
                        TotalValue.Text = totalPrice.ToString();
                        list.Remove(product);

                        if (list.Count == 0)
                        {
                            itemTotal.Visible = false;                        
                            CheckoutBtn.Enabled = false;
                            Total.Visible = false;
                        }
                        else
                        {
                            numItems.Text = list.Count.ToString();
                        }
                        break;
                    }
                }

               Session["cart"] = list;
                products.DataSource = list;
                products.DataBind();
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error: Please try again');", true);
            }
        }

    }
}