using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System.Configuration;

namespace Assignment2
{
    /// <summary>
    /// Summary description for DownloadHandler
    /// </summary>
    public class DownloadHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int id = Convert.ToInt32(context.Request["fileid"]);

            var db = new Assignment2Entities();
            var product = db.Products.Where(f => f.ProductId == id).FirstOrDefault();

            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(ConfigurationManager.AppSettings["StorageConnectionString"]);

            // Create the blob client.
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

            // Retrieve a reference to a container. 
            CloudBlobContainer container = blobClient.GetContainerReference("filestorage");

            // Create the container if it doesn't already exist.
            container.CreateIfNotExists();

            // Retrieve reference to a blob named from the given file
            CloudBlockBlob blockBlob = container.GetBlockBlobReference(product.AudioName);

            try
            {       

                //IE needs URL encoded filename. Important when there are spaces and other non-ansi chars in filename.
                if (HttpContext.Current.Request.UserAgent != null && HttpContext.Current.Request.UserAgent.ToUpper().Contains("MSIE"))
                    product.AudioName = HttpUtility.UrlEncode(product.AudioName, System.Text.Encoding.UTF8).Replace("+", " ");

                context.Response.Charset = "UTF-8";
                //Important to set buffer to false. IIS will download entire blob before passing it on to user if this is not set to false
                context.Response.Buffer = false;
                context.Response.AddHeader("Content-Disposition", "attachment; filename=" + product.AudioName + "");
                context.Response.ContentType = "application/octet-stream";
                context.Response.Flush();

                //Use the Azure API to stream the blob to the user instantly.
                // *SNIP*
                blockBlob.DownloadToStream(context.Response.OutputStream);
            }
            catch
            {
                context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                context.Response.Cache.SetNoStore();
                context.Response.Cache.SetExpires(DateTime.MinValue);
                context.Response.StatusCode = 404;
                context.Response.End();
                return;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}