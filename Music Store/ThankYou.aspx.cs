using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                Name.Text = ((AuthenticateService.AlgonquinCollegeUser)Session["User"]).FirstName + " " + ((AuthenticateService.AlgonquinCollegeUser)Session["User"]).LastName;
                products.DataSource = (List<Product>)Session["cart"];
                products.DataBind();
                Session["cart"] = null;
            }
        }
        protected void Continue(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}