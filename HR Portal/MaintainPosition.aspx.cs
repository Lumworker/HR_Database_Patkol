using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MobileTask.AppCode;
using Newtonsoft.Json;
using System.Data;
using System.IO;
using System.Web.Services;
using RestSharp;
using System.Collections;

namespace HR_Portal
{
    public partial class MaintainPosition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<ArrayList> LoadDataPosition()
        {
            return new ClassBrowseNew().LoadDataPosition();
        }

        [WebMethod]
        public static string SavePosition(string Position, string JobTitle, string JobTitleEN, string Status,string Action)
        {
            return new ClassBrowseNew().SavePosition(Position, JobTitle, JobTitleEN, Status , Action);
        }
    }
}