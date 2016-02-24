using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Auth;
using Microsoft.WindowsAzure.Storage.Blob;
using System.Configuration;
using System.IO;

namespace Assignment2.Admin
{
    public partial class EditProduct : System.Web.UI.Page
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
                        txtName.Text = product.Name;
                        categoryDropDown.DataSource = db.Categories.ToList();
                        categoryDropDown.DataTextField = "Name";
                        categoryDropDown.DataValueField = "CategoryId";
                        categoryDropDown.DataBind();
                        categoryDropDown.SelectedValue = product.CategoryId.ToString();

                        txtDescription.Text = product.ShortDescription;
                        txtPrice.Text = product.Price.ToString();
                        txtSale.Text = product.SalePrice.ToString();
                        checkBox.Checked = product.IsOnSale;

                        fileUpload.DataBind();

                        txtLong.Text = product.LongDescription;
                    }
                    catch { }
                }
            }
        }

        protected void Edit_Product(object sender, EventArgs e)
        {
            using (Assignment2Entities db = new Assignment2Entities())
            {
                try
                {

                    // Retrieve storage account from connection string.
                    CloudStorageAccount storageAccount = CloudStorageAccount.Parse(ConfigurationManager.AppSettings["StorageConnectionString"]);
                    // Create the blob client.
                    CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

                    // Retrieve a reference to a container. 
                    CloudBlobContainer container = blobClient.GetContainerReference("filestorage");

                    // Create the container if it doesn't already exist.
                    container.CreateIfNotExists();

                    // Retrieve reference to a blob named from the given file
                    CloudBlockBlob blockBlob = container.GetBlockBlobReference(Path.GetFileName(fileUpload.PostedFile.FileName));

                    if (blockBlob.Exists())
                        blockBlob.Delete();

                    // Create the blob
                    using (MemoryStream memoryStream = new MemoryStream(fileUpload.FileBytes))
                    {
                        blockBlob.UploadFromStream(memoryStream);
                    }

                    int id;
                    Int32.TryParse(Request.QueryString["id"], out id);

                    Product product = db.Products.FirstOrDefault(p => p.ProductId == id);
                    product.Name = txtName.Text;
                    product.CategoryId = Convert.ToInt32(categoryDropDown.SelectedValue);
                    product.ShortDescription = txtDescription.Text;
                    product.Price = Convert.ToDecimal(txtPrice.Text);
                    product.SalePrice = Convert.ToDecimal(txtSale.Text);
                    product.IsOnSale = checkBox.Checked;
                    product.ImageName = Path.GetFileName(fileUpload.PostedFile.FileName);
                    product.LongDescription = txtLong.Text;

                    db.SaveChanges();
                    Response.Redirect("Default.aspx");
                }
                catch
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('An Error as occurred, please try again later.');", true);
                }
            }
        }
    }
}