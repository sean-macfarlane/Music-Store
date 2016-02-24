using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment2
{
    public partial class MasterPageAdminMenu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null || Session["admin"].Equals("False"))
                {
                    Response.Redirect("../Default.aspx");
                }
            }
        }

        protected void Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session["admin"] = "False";
            Response.Redirect("../Default.aspx");
        }
    }
}