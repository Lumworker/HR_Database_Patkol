using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace HR_Portal
{
    /// <summary>
    /// Summary description for UpLoadFilePATAG
    /// </summary>
    public class UpLoadFilePATAG : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                //string floderName = context.Request.Form["floderName"];
                //string filePath = "\\\\patkoldevelop.patkol.com\\LeaveOnline_Attach\\" + context.Request.Form["folderName"] + "\\" + context.Request.Form["Emp_Num"];
                string webRootPath = context.Server.MapPath("~");
                string filePath = Path.GetFullPath(Path.Combine(webRootPath, "../PATAG_Attach/" + context.Request.Form["folderName"]));
                if (!Directory.Exists(filePath)) { Directory.CreateDirectory(filePath); }

                string str_image = "";
                HttpPostedFile file = context.Request.Files["file"];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);
                    if(context.Request.Form["type"] == "PNG")
                    {
                        str_image = context.Request.Form["name"] + ".PNG";
                    }
                    else
                    {
                        //str_image = context.Request.Form["name"] + fileExtension;
                        str_image = context.Request.Form["name"];
                    }
                    string pathToSave_100 = filePath + "\\" + str_image;
                    file.SaveAs(pathToSave_100);
                }
                context.Response.Write(str_image);
            }
            catch (Exception ex)
            {
                ex.ToString();
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