using MobileTask.AppCode;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
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
    public partial class ExportBCP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Export_ListBCP(object sender, EventArgs e)
        {
            IWorkbook workbook;
            DataTable dt = new DataTable();

            String BUGroup = snstextExport_BUGroup.Text;
            String Status = snstextExport_Status.Text;
            String BCP = snstextExport_BCP.Text;
            String Type = snstextExport_Type.Text;

            dt = new ClassBrowseNew().Export_ListEmp(BUGroup, Status, BCP, Type);
            //SQL

            workbook = new XSSFWorkbook();//for xslx
            //workbook = new HSSFWorkbook();//for xls
            //Set File Type

            ISheet sheet1 = workbook.CreateSheet("Sheet 1");
            //Set Sheet
            IRow row1 = sheet1.CreateRow(0);
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                ICell cell = row1.CreateCell(j);
                String columnName = dt.Columns[j].ToString();
                cell.SetCellValue(columnName);
            }
            //make a header row
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                IRow row = sheet1.CreateRow(i + 1);
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    ICell cell = row.CreateCell(j);
                    String columnName = dt.Columns[j].ToString();
                    cell.SetCellValue(dt.Rows[i][columnName].ToString());
                }
            }
            //loops through data

            using (var exportData = new MemoryStream())
            {
                Response.Clear();
                workbook.Write(exportData);
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "BCP_List_Employee.xlsx"));
                Response.BinaryWrite(exportData.ToArray());
                //xlsx file format
                //Response.ContentType = "application/vnd.ms-excel";
                //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "export_excel.xls"));
                //Response.BinaryWrite(exportData.GetBuffer());
                ////xls file format
                Response.End();
            }
        }
    }
}