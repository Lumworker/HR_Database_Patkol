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
    public partial class MaintainE_Regular : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void exportTableC_onClick(object sender, EventArgs e)
        {
            String check = snsCheck.Text;
            String site_ref = snssite_ref.Text;
            DataTable dt = new DataTable();
            String sql = "";
            String condition = "";
            if (check == "payment")
            {
                String payment = snspayment.Text;
                String cost = snscost.Text;
                String costTo = snscostTo.Text;
                String level = snslevel.Text;
                String emp = snsemp.Text;
                String effDateExport = snseffDate.Text;
                String effEnd = snsteffEnd.Text;
                //String test3 = snstest3.Text;
                
                sql += " WHERE ";
                if (payment != "")
                {
                    sql += "[Code] = '" + payment + "'";
                    condition = " and ";
                }
                if (cost != "")
                {
                    sql += condition + "([CostCenter] between '" + cost + "' and '" + costTo + "')";
                    condition = " and ";
                }
                if (level != "" || emp != "")
                {
                    sql += condition + "([EmpNum/Level] = '" + level + "' or [EmpNum/Level] = '" + emp + "')";
                    condition = " and ";
                }
                if (effDateExport != "")
                {
                    //sql += condition + "([Start_Date] between '" + DateTime.Parse(effDateExport) + "' and '" + DateTime.Parse(effEnd) + "')";
                    sql += condition + "([Start_Date] between CONVERT(datetime,'" + DateTime.Parse(effDateExport) + "',103) and CONVERT(datetime,'" + DateTime.Parse(effEnd) + "',103))";
                    condition = " and ";
                }
                sql += condition + "[site_ref] ='" + site_ref + "'";
                dt = new ClassBrowseNew().GetExportPayment(sql);
            }
           else if (check == "benefit")
            {
                String emp = snsempBenefits.Text;
                String cost = snscostBenefit.Text;
                String costTo = snscostToBenefit.Text;
                sql += " WHERE ";
                if (emp != "")
                {
                    sql += "[Emp_Num] = '" + emp + "'";
                    condition = " and ";
                }
                if (cost != "")
                {
                    sql += condition + "([CostCenter] between '" + cost + "' and '" + costTo + "')";
                    condition = " and ";
                }
                sql += condition + "[site_ref] ='" + site_ref + "'";
                dt = new ClassBrowseNew().GetExportBenefit(sql);
            }
            
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
                Response.AddHeader("content-disposition", "attachment;filename=Payment" + DateTime.Now + ".xls");
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