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
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (Assignment2Entities db = new Assignment2Entities())
                {
                    try
                    {
                        categoryDropDown.DataSource = db.Categories.ToList();
                        categoryDropDown.DataTextField = "Name";
                        categoryDropDown.DataValueField = "CategoryId";
                        categoryDropDown.DataBind();
                    }
                    catch { }
                }
            }
        }

        protected void CreateProduct(object sender, EventArgs e)
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


                    

                    Product product = new Product
                    {
                        Name = txtName.Text,
                        CategoryId = Convert.ToInt32(categoryDropDown.SelectedValue),
                        ShortDescription = txtDescription.Text,
                        Price = Convert.ToDecimal(txtPrice.Text),
                        SalePrice = Convert.ToDecimal(txtSale.Text),
                        IsOnSale = checkBox.Checked,
                        ImageName = Path.GetFileName(fileUpload.PostedFile.FileName),                     
                        LongDescription = txtLong.Text
                    };

                    if (!audioUpload.FileName.Equals(""))
                    {
                        container = blobClient.GetContainerReference("filestorage");
                        container.CreateIfNotExists();
                        blockBlob = container.GetBlockBlobReference(Path.GetFileName(audioUpload.PostedFile.FileName));

                        if (blockBlob.Exists())
                            blockBlob.Delete();
                        using (MemoryStream memoryStream2 = new MemoryStream(audioUpload.FileBytes))
                        {
                            blockBlob.UploadFromStream(memoryStream2);
                        }

                        product.AudioName = Path.GetFileName(audioUpload.PostedFile.FileName);
                    }



                    db.Products.Add(product);
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