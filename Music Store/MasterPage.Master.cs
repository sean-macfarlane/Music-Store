using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment2
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (Assignment2Entities db = new Assignment2Entities())
                {
                    try
                    {                    
                        if (this.Page.User.Identity.IsAuthenticated)
                        {
                            sessionFullNameLabel.Text = ((AuthenticateService.AlgonquinCollegeUser)Session["User"]).FirstName + " " + ((AuthenticateService.AlgonquinCollegeUser)Session["User"]).LastName;
                            LoginMenu.Visible = false;
                            UserMenu.Visible = true;
                        }
                    }
                    catch { }
                }
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Default.aspx");
        }
    }
}