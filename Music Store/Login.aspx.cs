using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ValidateUser(object sender, EventArgs e)
        {
            try
            {
                AuthenticateService.AuthenticateServiceSoapClient client = new AuthenticateService.AuthenticateServiceSoapClient();
                AuthenticateService.AlgonquinCollegeUser user = client.AuthenticateUser(txtUsername.Text, txtPassword.Text);
                Session["User"] = user;
                FormsAuthentication.SetAuthCookie(user.UserName, false);

                Session["admin"] = isAdmin.Checked.ToString();

                if (Session["admin"].Equals("True"))
                {
                    Response.Redirect("Admin/Default.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }            
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error: Wrong Email and Password.\\nOr Account does not exist.');", true);
            }
        }
    }
}