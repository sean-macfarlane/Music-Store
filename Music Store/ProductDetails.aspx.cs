using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class ProductDetails : System.Web.UI.Page
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

                        Product product = db.Products.FirstOrDefault(p => p.ProductId == id);
                        Page.Title = product.Name;
                        Name.Text = product.Name;
                        Price.Text = product.Price.ToString();
                        if (product.IsOnSale)
                        {
                            SalePrice.Text = product.SalePrice.ToString();
                        }   
                        ShortDesc.Text = product.ShortDescription;
                        LongDesc.Text = product.LongDescription;

                        image.ImageUrl += product.ProductId;

                        if (product.AudioName != null)
                        {
                            audioURL.Text = "<audio controls><source src='GetAudioHandler.ashx?fileid=" + product.ProductId + "'></audio>";
                        }

                        comments.DataSource = db.Comments.Where(c => c.Products_ProductId == id).ToList();
                        comments.DataBind();

                        if (this.Page.User.Identity.IsAuthenticated)
                        {
                            AddCommentPanel.Visible = true;

                            List<Product> list = (List<Product>)Session["cart"];
                            AddCartButton.Enabled = true;
                            if (list != null && list.Count > 0)
                            {                              
                                foreach (Product p in list)
                                {
                                    if (p.ProductId == id)
                                    {
                                        AddCartButton.Enabled = false;
                                    }
                                }
                            }
                        }
                    }
                    catch { }
                }
            }
        }

        protected void AddComment(object sender, EventArgs e)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {

                    int id;
                    Int32.TryParse(Request.QueryString["id"], out id);

                    Comment comment = new Comment();

                    comment.Products_ProductId = id;
                    comment.Username = ((AuthenticateService.AlgonquinCollegeUser)Session["User"]).FirstName + " " + ((AuthenticateService.AlgonquinCollegeUser)Session["User"]).LastName;
                    comment.Text = txtComment.Text;
                    comment.CreatedDate = DateTime.Now;


                    db.Comments.Add(comment);
                    db.SaveChanges();
                    Response.Redirect("ProductDetails.aspx?id=" + id);
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
                }
            }
        }

        protected String BadWords(object sender)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                String parsed = (String)sender;

                foreach (var b in db.BadWords.ToList())
                {
                    parsed = parsed.Replace(b.Word, "*****");
                }

                return parsed;
            }
        }

        protected void AddToCart(object sender, EventArgs e)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {
                    int id;
                    Int32.TryParse(Request.QueryString["id"], out id);

                    List<Product> list = (List<Product>)(Session["cart"]);

                    if (list == null)
                    {
                        list = new List<Product>();
                    }

                    list.Add(db.Products.FirstOrDefault(p => p.ProductId == id));

                    Session["cart"] = list;

                    AddCartButton.Enabled = false;
                    AddCartButton.Text = "Added to Cart";

                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
                }
            }
        }
    }
}