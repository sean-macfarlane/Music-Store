using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 1; i <= 12; i++)
                {
                    month.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }


                for (int i = 2015; i <= 2050; i++)
                {
                    year.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }

        protected void Complete(object sender, EventArgs e)
        {
            if (Convert.ToInt32(year.SelectedValue) == DateTime.Now.Year)
            {
                if (Convert.ToInt32(month.SelectedValue) < DateTime.Now.Month)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error: Invalid Credit Card Information');", true);
                    return;
                }
            }

            Response.Redirect("ThankYou.aspx");
        }

        protected void Cancel(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}