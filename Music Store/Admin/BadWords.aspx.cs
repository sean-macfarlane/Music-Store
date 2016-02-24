using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2.Admin
{
    public partial class BadWords : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (Assignment2Entities db = new Assignment2Entities())
                {
                    try
                    {
                        badwords.DataSource = db.BadWords.ToList();
                        badwords.DataBind();
                    }
                    catch { }
                }
            }
        }

        protected void AddBadWord(object sender, EventArgs e)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {
                    BadWord word = new BadWord();
                    word.Word = txtBad.Text;

                    db.BadWords.Add(word);
                    db.SaveChanges();
                    Response.Redirect("BadWords.aspx");
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
                }
            }
        }

        protected void delete_OnClick(object sender, EventArgs e)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {
                    int id = Int32.Parse(((Button)sender).CommandArgument);
                    db.BadWords.Remove(db.BadWords.Where(b => b.BadWordId == id).First());
                    db.SaveChanges();
                    badwords.DataSource = db.BadWords.ToList();
                    badwords.DataBind();
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
                }
            }
        }
    }
}