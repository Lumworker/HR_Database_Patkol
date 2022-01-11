using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace HR_Portal
{
    /// <summary>
    /// Summary description for LoadExcel
    /// </summary>
    public class LoadExcel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            try
            {
                //DirectoryInfo DirInfo = new DirectoryInfo(PathUpload + EmpNum + "-" + lblRunning.Text);
                string filePath = "\\\\PORTALAPP01\\HRPoralFiles\\" + context.Request.Form["floderName"];
                //string filePath = "http://portalapp01/PathDownload/" + context.Request.Form["floderName"];
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }

                HttpPostedFile file = context.Request.Files["file"];
                string fileName = file.FileName;
                string str_excel = filePath + "\\" + fileName;
                string pathconnect = context.Request.Form["name"];

                file.SaveAs(str_excel);
                //                //string excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:/Users/Zach/Documents/test1.xls;Extended Properties=Excel 12.0,HDR=Yes;IMEX=1";
                string excelConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + str_excel + ";Extended Properties='Excel 8.0;HDR={1}'";

                // Create Connection to Excel Workbook
                using (OleDbConnection connection = new OleDbConnection(excelConnectionString))
                {
                    OleDbCommand command = new OleDbCommand
                              //("Select [Visit Date],[Start Time],[End Time],[Opportunity Name],[Sales Report],[Customer Name],[Visit Place],[Province],[Country],[Allowance],[Expense],[Accomodation Expense],[Traveling Expense],[Entertain Expense],[Call Plan No] FROM [Benefit$]", connection);
                              ("Select * FROM [Sheet1$]", connection);
                    connection.Open(); //HERE IS WHERE THE ERROR IS

                    // Create DbDataReader to Data Worksheet
                    using (DbDataReader dr = command.ExecuteReader())
                    {
                        // SQL Server Connection String
                        //string sqlConnectionString = "Data Source= K2db5;Initial Catalog=K2;Persist Security Info=True;User ID=sa;Password=@Patkol.com@123; Connect Timeout=0; pooling=true; Max Pool Size=5000";
                        string sqlConnectionString = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_PKS_App;Persist Security Info=True;User ID=dv;Password=@Wanlapa; Connect Timeout=0; pooling=true; Max Pool Size=50000";
                        // Bulk Copy to SQL Server
                        using (SqlBulkCopy bulkCopy =
                                   new SqlBulkCopy(sqlConnectionString))
                        {
                            bulkCopy.DestinationTableName = "TB_OTMobile_Temp_RawData";

                            // Set up the column mappings by name.
                            //Visit_Date, Start_Time, End_Time, Opportunity, Sales_Report, Customer, 
                            //Visit_Place, Province, Country, Adv_Allowance, Adv_Accommodation, 
                            //Adv_Travelling, Plan_Entertain, Call_Plan_No
                            SqlBulkCopyColumnMapping visitdate =
                            new SqlBulkCopyColumnMapping("ID", "[emp_num]");
                            bulkCopy.ColumnMappings.Add(visitdate);

                            SqlBulkCopyColumnMapping startTime =
                                new SqlBulkCopyColumnMapping("[Working Date]", "[workingdate]");
                            bulkCopy.ColumnMappings.Add(startTime);

                            SqlBulkCopyColumnMapping EndTime =
                                new SqlBulkCopyColumnMapping("Normal", "[time_normal]");
                            bulkCopy.ColumnMappings.Add(EndTime);

                            SqlBulkCopyColumnMapping OppName =
                            new SqlBulkCopyColumnMapping("OT1", "[time_OT01]");
                            bulkCopy.ColumnMappings.Add(OppName);

                            SqlBulkCopyColumnMapping SalesReport =
                                new SqlBulkCopyColumnMapping("OT1_5", "[time_OT15]");
                            bulkCopy.ColumnMappings.Add(SalesReport);

                            SqlBulkCopyColumnMapping CustomerName =
                                new SqlBulkCopyColumnMapping("OT2_0", "[time_OT20]");
                            bulkCopy.ColumnMappings.Add(CustomerName);

                            SqlBulkCopyColumnMapping VisitPlace =
                            new SqlBulkCopyColumnMapping("OT3_0", "[time_OT30]");
                            bulkCopy.ColumnMappings.Add(VisitPlace);

                            SqlBulkCopyColumnMapping Downloader =
                            new SqlBulkCopyColumnMapping("Downloader", "[CreateBy]");
                            bulkCopy.ColumnMappings.Add(Downloader);

                            //SqlBulkCopyColumnMapping Call_xxx =
                            //    new SqlBulkCopyColumnMapping("[food]", "food");
                            //bulkCopy.ColumnMappings.Add(Call_xxx);

                            bulkCopy.WriteToServer(dr);
                        }
                    }
                    //                }
                    //                fn_.DeleteFile(PathUpload + EmpNum + "-" + lblRunning.Text + @"\" + Name);
                    //                fn_.DeleteFolder(DirInfo);
                    //            }
                    //        }
                    //    }
                }
                //UpdateRefID();
                if (System.IO.File.Exists(str_excel))
                {
                    try
                    {
                        System.IO.File.Delete(str_excel);
                    }
                    catch (IOException ex)
                    {
                        context.Response.Write(ex);
                    }
                }
                
                context.Response.Write(str_excel);
            }
            catch (Exception ex)
            {
                context.Response.Write(ex.ToString());
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        protected void btnImportExcel_Click(object sender, EventArgs e)
        {


        }
    }
}