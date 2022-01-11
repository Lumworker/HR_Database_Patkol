using MobileTask.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HR_Portal
{
    public partial class LeaveReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void exportTableC_Click(object sender, EventArgs e)
        {

            String EmpNum = snsEmpNum.Text;
            String department = snsdepartment.Text;
            String departmentTo = snsdepartmentTo.Text;
            //String group = snsgroup.Text;
            String mainComp = snsmainComp.Text;
            String startDate = snsstartDate.Text;
            String endDate = snsendDate.Text;
            if (EmpNum != "" || (department != "" && departmentTo != "") || mainComp != "" || (startDate != "" && endDate != ""))
            {
                String Paramiter = "";
                String Condition = "";
                DataTable dt = new DataTable();
                if (EmpNum != "")
                {
                    Paramiter += " [Emp_Num] = '" + EmpNum + "'";
                    Condition = " AND ";
                }
                if (department != "")
                {
                    Paramiter += Condition + " [Department] BETWEEN '" + department + "' AND '" + departmentTo + "'";
                    Condition = " AND ";
                }

                if (mainComp != "")
                {
                    Paramiter += Condition + " [Main_Company] = '" + mainComp + "'";
                    Condition = " AND ";
                }
                if (startDate != "")
                {
                    Paramiter += Condition + "( (CONVERT (DATE,[StartDate],103)) BETWEEN  CONVERT (DATE,'" + startDate + "',103) AND   CONVERT(DATE,'" + endDate + "',103) " ;
                    Paramiter += " OR (CONVERT (DATE,[endDate],103))  BETWEEN  CONVERT (DATE,'" + startDate + "',103) AND   CONVERT(DATE,'" + endDate + "',103 ) )";
                    //Condition = " AND ";
                }

                dt = new ClassBrowseNew().GetExportCustomerReportv2(Paramiter);
                //string customerJSON = Request.Form["CustomerJSON"];
                //DataTable dt = JsonConvert.DeserializeObject<DataTable>(customerJSON);
                GridView GV = new GridView();
                GV.AllowPaging = false;
                GV.DataSource = dt;
                GV.DataBind();
                if (GV.Rows.Count > 0)
                {
                    Response.Clear();
                    Response.Buffer = true;
                    Response.AddHeader("content-disposition", "attachment;filename=LeaveTransection"+ DateTime.Now + ".xls");
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.ms-excel";
                    StringWriter sw = new StringWriter();
                    HtmlTextWriter hw = new HtmlTextWriter(sw);

                    for (int i = 0; i > GV.Rows.Count; i++)
                    {
                        GV.Rows[i].Attributes.Add("class", "textmode");
                    }
                    GV.RenderControl(hw);
                    String style = @"<style> .textmode{mso-number-format:\@;}</style>";
                    Response.Write(style);
                    Response.Output.Write("<html><head><META http-equiv=Content-Type content=text/html; charset=utf-8></head><body><FONT face=Tahoma>" + sw.ToString() + "</FONT></Body></Html>");
                    Response.Flush();
                    Response.End();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Data')", true);
                }
            }
        }
    }
}