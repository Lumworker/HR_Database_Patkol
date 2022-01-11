using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace HR_Portal
{
    /// <summary>
    /// Summary description for UploadfileDelete
    /// </summary>
    public class UploadfileDelete : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string webRootPath = context.Server.MapPath("~");
            string filePath = Path.GetFullPath(Path.Combine(webRootPath,  context.Request.Form["folderName"]));

            System.IO.FileInfo fi = new System.IO.FileInfo(filePath);
            try { fi.Delete(); }
            catch (System.IO.IOException e) { Console.WriteLine(e.Message); }
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