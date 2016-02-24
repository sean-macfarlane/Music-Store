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
    /// Summary description for GetFileHandler
    /// </summary>
    public class GetAudioHandler : IHttpHandler
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
                // save the blob data into a readable stream
                System.IO.Stream fileStream = new MemoryStream();
                blockBlob.DownloadToStream(fileStream);

                // return to the beginning of the stream
                fileStream.Seek(0, SeekOrigin.Begin);

                // move the data into a byte array
                byte[] buffer = new byte[fileStream.Length];
                fileStream.Read(buffer, 0, (int)fileStream.Length);

                // close the stream
                if (fileStream != null)
                    fileStream.Close();

                context.Response.Clear();
                context.Response.BinaryWrite(buffer);
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