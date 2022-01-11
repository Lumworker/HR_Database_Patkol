using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace HR_Portal
{
    /// <summary>
    /// Summary description for UploadFile
    /// </summary>
    public class UploadFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                //string floderName = context.Request.Form["floderName"];
                string filePath = "\\\\PORTALAPP01\\HRPoralFiles\\" + context.Request.Form["floderName"] + "\\" + context.Request.Form["Emp_Num"];
                //string filePath = "\\\\PORTALAPP01\\HRPoralFiles\\" + context.Request.Form["Emp_Num"];
                //string filePath = "D:\\" + context.Request.Form["NameFolder"];
                if (!Directory.Exists(filePath)) { Directory.CreateDirectory(filePath); }

                string str_image = "";
                HttpPostedFile file = context.Request.Files["file"];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);
                    str_image = context.Request.Form["name"] + fileExtension;
                    string pathToSave_100 = filePath + "\\" + str_image;
                    file.SaveAs(pathToSave_100);
                }
                context.Response.Write(str_image);
            }
            catch (Exception ex)
            {

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