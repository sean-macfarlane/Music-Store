using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

         protected void BindData()
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {

                    products.DataSource = db.Products.Where(p => p.IsOnSale == true).ToList();
                    products.DataBind();
                }
                catch { }
            }
        }

        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            products.PageIndex = e.NewPageIndex;
            BindData();
        }
    }
}