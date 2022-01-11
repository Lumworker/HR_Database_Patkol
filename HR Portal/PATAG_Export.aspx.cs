using MobileTask.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;


namespace HR_Portal
{
    public partial class PATAG_Export : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void exportTableCharge_onClick(object sender, EventArgs e)
        {
            IWorkbook workbook;
            DataTable dt = new  DataTable();

            String Status = snsStatus.Text;
            //String StartDate = snsStartDate.Text;
            //String EndDate = snsEndDate.Text;
            //Get Query

            dt = new ClassBrowseNew().GetExportExcel_Charge(Status);
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
                    Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Report Charge " + Status + ".xls"));
                    Response.BinaryWrite(exportData.ToArray());
                    //xlsx file format
                    //Response.ContentType = "application/vnd.ms-excel";
                    //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "export_excel.xls"));
                    //Response.BinaryWrite(exportData.GetBuffer());
                    ////xls file format
                    Response.End();
                }
            

        }
        protected void exportTableTax_onClick(object sender, EventArgs e)
        {
            IWorkbook workbook;
            DataTable dt = new DataTable();

            String Status = snsStatus.Text;
            //String StartDate = snsStartDate.Text;
            //String EndDate = snsEndDate.Text;
            //Get Query

            dt = new ClassBrowseNew().GetExportExcel_Tax(Status);
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
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Report Tax " + Status + ".xls"));
                Response.BinaryWrite(exportData.ToArray());
                //xlsx file format
                //Response.ContentType = "application/vnd.ms-excel";
                //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "export_excel.xls"));
                //Response.BinaryWrite(exportData.GetBuffer());
                ////xls file format
                Response.End();
            }

            
        }
        protected void exportTableInsurance_onClick(object sender, EventArgs e)
        {
            IWorkbook workbook;
            DataTable dt = new DataTable();

            String Status = snsStatus.Text;
            //String StartDate = snsStartDate.Text;
            //String EndDate = snsEndDate.Text;
            //Get Query

            dt = new ClassBrowseNew().GetExportExcel_Insurance(Status);
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
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Report Insurance " + Status + ".xls"));
                Response.BinaryWrite(exportData.ToArray());
                //xlsx file format
                //Response.ContentType = "application/vnd.ms-excel";
                //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "export_excel.xls"));
                //Response.BinaryWrite(exportData.GetBuffer());
                ////xls file format
                Response.End();
            }
            
        }
        protected void exportTableMA_onClick(object sender, EventArgs e)
        {
            IWorkbook workbook;
            String Status = snsStatus.Text;
            //String StartDate = snsStartDate.Text;
            //String EndDate = snsEndDate.Text;
            DataTable dt = new  DataTable();

            //Get Query
            dt = new ClassBrowseNew().GetExportExcel_MA(Status);
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
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Report MA " + Status + ".xls"));
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