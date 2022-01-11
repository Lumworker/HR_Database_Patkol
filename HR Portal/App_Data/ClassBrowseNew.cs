using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;
using System.Globalization;
using System.Text;
using System.Collections.Generic;
using System.Collections;
using System.Web.UI;
using System.Configuration;
using System.IO;

namespace MobileTask.AppCode
{
    public class ClassBrowseNew
    {
        public static String Proj_Num, Customer, prLine, startLine;
        public static String StatusLine = "";

        string PK = System.Configuration.ConfigurationManager.AppSettings["PK"];
        string Site = System.Configuration.ConfigurationManager.AppSettings["Site"];
        string PKM = System.Configuration.ConfigurationManager.AppSettings["PKM"];
        string PKT = System.Configuration.ConfigurationManager.AppSettings["PKT"];
        string SPN = System.Configuration.ConfigurationManager.AppSettings["SPN"];
        string PH = System.Configuration.ConfigurationManager.AppSettings["PH"];
        string IND = System.Configuration.ConfigurationManager.AppSettings["IND"];
        string MY = System.Configuration.ConfigurationManager.AppSettings["MY"];
        string TG = System.Configuration.ConfigurationManager.AppSettings["TG"];
        string CTG = System.Configuration.ConfigurationManager.AppSettings["CTG"];
        string HA = System.Configuration.ConfigurationManager.AppSettings["HA"];
        string CHA = System.Configuration.ConfigurationManager.AppSettings["CHA"];

        public static String con = "Data Source=K2DB1\\K2DBC1;Initial Catalog=K2;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conHRPortal = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=HRPortal;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conPKS = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=ERP_PKS_App;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conPatkol = "Data Source=SLDB1\\SYTELINEDBC1;Initial Catalog=PATKOL_K2APP_DATA;Persist Security Info=True;User ID=sa;Password=P@ssw0rd; Connect Timeout=0; pooling=true; Max Pool Size=50000";
        public static String conK2db5 = "Data Source=K2db5;Initial Catalog=K2;Persist Security Info=True;User ID=sa;Password=@Patkol.com@123;Connect Timeout=0; pooling=true; Max Pool Size=5000";

        public string SeletSite_ref(string site_ref)
        {
            string connn = "";
            if (site_ref == PK)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_PK"].ConnectionString;
            }
            else if (site_ref == PKM)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_PKM"].ConnectionString;
            }
            else if (site_ref == PKT)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_PKT"].ConnectionString;
            }
            else if (site_ref == SPN)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_SPN"].ConnectionString;
            }
            else if (site_ref == PH)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLOverseaPH"].ConnectionString;
            }
            else if (site_ref == IND)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLOverseaID"].ConnectionString;
            }
            else if (site_ref == MY)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLOverseaMY"].ConnectionString;
            }
            else if (site_ref == TG)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_TG"].ConnectionString;
            }
            else if (site_ref == HA)
            {
                connn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringSLERP_HA"].ConnectionString;
            }

            return connn;
        }
        public String GetUser()
        {
            var UserDomain = HttpContext.Current.Request.LogonUserIdentity.Name;
            UserDomain = UserDomain.Replace("PATKOL\\", "");
            return UserDomain;
        }

        public List<String[]> GetNameEmployee(string search, string site_ref)
        {
            List<String[]> getNameEmployee = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT [emp_num],[name],[Uf_UserLogin] FROM [dbo].[employee_mst] WHERE ISNULL([Uf_EmpStatus],1) = 1 AND [emp_num] LIKE '%" + search + "%'";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getData = new String[3];
                            getData[0] = reader[0].ToString().Trim();
                            getData[1] = reader[1].ToString().Trim();
                            getData[2] = reader[2].ToString().Trim();
                            getNameEmployee.Add(getData);
                        }
                    }
                    connection.Close();
                }
            }
            return getNameEmployee;
        }

        public List<ArrayList> GetSite_ref()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conPatkol))
            {
                string sql = "SELECT [SiteRef],Corp_NameEN FROM [dbo].[SiteDatabase] sb LEFT JOIN TB_company cp ON sb.SiteRef = cp.Corp_Name WHERE [ShowEntries] = 1";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    conn.Close();
                }
            }
            return GetData;
        }

        public List<ArrayList> GetListEmployee(string Emp_Num, string search, string type, string fillter)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {

                string sql = "SELECT [Emp_Num],[Language],[Emp_Prefix],[Emp_Profile],[Emp_FirstName],[Emp_LastName],[Emp_MidderName] ,[Emp_Level],[Emp_JobTitle],[Emp_Location],[Emp_Email],[Emp_Extension],[Emp_Comp_Phone]" +
                    ",[Emp_StartDate],[Emp_HireDate],[Emp_HR_Shift_ID],[Emp_Type],[Emp_ID_Card],[Emp_ID_Card_Expired_Date],[Emp_Birth_Date]" +
                    ",[Emp_Gender],[Emp_Nationality],[Emp_Religion],[Emp_Marital_Status],[Emp_Children],[Emp_Address1],[Emp_Address2],[Emp_Address3],[Emp_Address4],[Emp_District],[Emp_Country],[Emp_City],[Emp_County],[Emp_ZipCode],[Emp_Phone],[Emp_Bank],[Emp_BankBranch],[Emp_BankAccount],[Emp_Emergency_Contact],[Emp_Emergency_Phone],[Emp_Status]" +
                    ",[EndDate],[Emp_Position],[Emp_NickName],[Emp_ManagerID],[Emp_ManagerName],[PayFreq],[FirstTripAbroad],[Department],[Main_Company],[Bef_Shift],[Bef_HRProvince],[Bef_HRCountry],[Bef_ZoneID],[Bef_OTLocation],[Bef_EmpGroup],[Bef_EmpScrub]" +
                    ",[Bef_EmpSpray],[Bef_EmpCarrate],[Wedding_Benefit],[StartLongevity] FROM [dbo].[TB_HR_Employee] ";

                //sql += " WHERE [Language] = '" + type + "' ";

                if (Emp_Num != "") { sql += "WHERE  [Emp_Num] = '" + Emp_Num + "'  "; }
                if (search != "")
                {
                    search = '%' + search + '%';
                    if (fillter != "")
                    {
                        sql += "WHERE ( " + fillter + " LIKE '" + search + "' ";
                        if (fillter == "[Emp_FirstName]")
                        {
                            sql += "OR [Emp_LastName] LIKE '" + search + "' ";
                        }
                        else if (fillter == "[Emp_ManagerName]")
                        {
                            sql += "OR [Emp_ManagerID] LIKE '" + search + "' ";
                        }
                        sql += ")";
                    }
                    else
                    {
                        sql += "WHERE ([Emp_FirstName] LIKE '" + search + "' OR [Emp_Num] LIKE '" + search + "' OR [Emp_MidderName] LIKE'" + search + "' OR [Emp_LastName] LIKE '" + search + "' OR [Emp_Email] LIKE '" + search + "' OR [Emp_Extension] LIKE '" + search + "') ";
                    }
                }

                if (type == "EN") { sql += " ORDER BY Language ASC, Emp_FirstName DESC "; } else { sql += " ORDER BY Language DESC, Emp_FirstName DESC "; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }
        public List<ArrayList> GetListUserRedirect(string search, string type)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {

                string sql = "SELECT [Username],ISNULL([Emp_FirstName],'') + ' ' + ISNULL([Emp_MidderName],'') + ' ' + ISNULL([Emp_LastName],'') as 'EmpName' ,au.[Emp_Num]" +
                    "FROM [dbo].[TB_HR_Employee_Authen] au " +
                    "LEFT JOIN [dbo].[TB_HR_Employee] emp ON au.Emp_Num = emp.Emp_Num " +
                    "WHERE [Permission_Type] = 'K2' AND emp.Emp_Status = 'Active' " +
                    "AND [Language] = '" + type + "'";
                if (search != "")
                {
                    sql += "AND ( [Username] LIKE '%" + search + "%' OR au.[Emp_Num] LIKE '%" + search + "%' OR [Emp_FirstName] LIKE '%" + search + "%' " +
                        "OR [Emp_LastName] LIKE '%" + search + "%' OR [Emp_MidderName] LIKE '%" + search + "% ')";
                }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }

        public List<ArrayList> GetListBenefit(string Emp_Num, string type)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {

                string sql = "SELECT [Bef_id],[Emp_Num],[Bef_Shift],[Bef_HRProvince],[Bef_HRCountry],[Bef_ZoneID],[Bef_OTLocation],[Bef_EmpGroup]" +
                ",[Bef_EmpScrub],[Bef_EmpSpray],[Bef_EmpCarrate],[Language]FROM[HRPortal].[dbo].[TB_Benefit]";

                if (Emp_Num != "") { sql += "WHERE  [Emp_Num] = '" + Emp_Num + "'  "; }
                if (type == "EN") { sql += " AND [Language] = 'EN' "; } else { sql += " AND [Language] = 'TH' "; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }

        //public List<ArrayList> GetListsComp(int ID, string checkempcomp)
        //{
        //    List<ArrayList> GetEmpComp = new List<ArrayList>();
        //    using (SqlConnection connection = new SqlConnection(conHRPortal))
        //    {

        //        string sql = "SELECT * FROM [dbo].[VW_HR_List_Employee]";

        //        if (checkempcomp == "callempcomp")
        //        {
        //            sql += "WHERE [ID] = '" + ID + "'";
        //        }
        //        using (SqlCommand cmd = new SqlCommand(sql, connection))
        //        {
        //            connection.Open();
        //            using (var reader = cmd.ExecuteReader())
        //            {
        //                while (reader.Read())
        //                {
        //                    ArrayList detail = new ArrayList();
        //                    for (int i = 0; i < reader.FieldCount; i++)
        //                    {
        //                        detail.Add(reader[i].ToString());
        //                    }
        //                    GetEmpComp.Add(detail);
        //                }
        //            }
        //        }
        //    }
        //    return GetEmpComp;
        //}

        public List<ArrayList> GetListCompany(string Empcomp, string Main)
        {
            List<ArrayList> GetComp = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [EmpNum],[Position],[Dept],[GroupName],[Company],[MainCompany] FROM [dbo].[VW_EmployeePyramid] ";

                sql += "WHERE [EmpNum] ='" + Empcomp + "' and [MainCompany]='" + Main + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetComp.Add(detail);
                        }
                    }
                }
            }
            return GetComp;
        }

        public List<ArrayList> GetListCompanyMain(string EmpcompMain, string Main)
        {
            List<ArrayList> GetCompMain = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [EmpNum],[Position],[Dept],[GroupName],[Company],[MainCompany],[site_ref] FROM [dbo].[VW_EmployeePyramid] ";

                sql += "WHERE [EmpNum] ='" + EmpcompMain + "' and [MainCompany]='" + Main + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetCompMain.Add(detail);
                        }
                    }
                }
            }
            return GetCompMain;
        }

        //public List<ArrayList> GetListJobExp(int ID, string checkjob)
        //{
        //    List<ArrayList> GetJob = new List<ArrayList>();
        //    using (SqlConnection connection = new SqlConnection(conHRPortal))
        //    {
        //        string sql = " SELECT * FROM [dbo].[TB_HR_Employee_JobExp] ";


        //        if (checkjob == "callJobExp")

        //        {
        //            sql += "WHERE [RefId] ='" + ID + "'";
        //        }

        //        using (SqlCommand cmd = new SqlCommand(sql, connection))
        //        {
        //            connection.Open();
        //            using (var reader = cmd.ExecuteReader())
        //            {
        //                while (reader.Read())
        //                {
        //                    ArrayList detail = new ArrayList();
        //                    for (int i = 0; i < reader.FieldCount; i++)
        //                    {
        //                        detail.Add(reader[i].ToString());
        //                    }
        //                    GetJob.Add(detail);
        //                }
        //            }
        //        }
        //    }
        //    return GetJob;
        //}

        public List<ArrayList> GetListEducation(string search)
        {
            List<ArrayList> GetEdu = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[Emp_Level],[Institution],[Faculty],[Major],[Graduate],[Image_Edu] FROM [dbo].[TB_HR_Employee_Education] Where [Emp_Num] ='" + search + "' ";
                //if (checktype == "callEdu")

                //{
                //    sql += "WHERE [RefId] ='" + ID + "'";
                //}

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetEdu.Add(detail);
                        }
                    }
                }
            }
            return GetEdu;
        }

        public List<ArrayList> GetListAttachment(string ref_id, string type)
        {
            List<ArrayList> GetEdu = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[part],[name] FROM[HRPortal].[dbo].[TB_HR_Employee_Attachment] where [ref_ID] = '" + ref_id + "'and [File_type] = '" + type + "'";
                //if (checktype == "callEdu")

                //{
                //    sql += "WHERE [RefId] ='" + ID + "'";
                //}

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetEdu.Add(detail);
                        }
                    }
                }
            }
            return GetEdu;
        }

        public List<ArrayList> GetCertificate(string search)
        {
            List<ArrayList> Company = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[Emp_Num],[Emp_Certificate],[Description],[Create_by],[Update_by],[Create_Date],[Update_Date] FROM [TB_HR_Employee_Certificate] where ";

                if (search != "") { sql += "( [Emp_Num] = '" + search + "' )"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Company.Add(detail);
                        }
                    }
                }
            }
            return Company;
        }

        public List<ArrayList> GetListPermission(int ID)
        {
            List<ArrayList> GetPer = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT * FROM [dbo].[TB_HR_Employee_Authen]";

                sql += "WHERE [Emp_Num] ='" + ID + "'";


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPer.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPer;
        }

        public List<ArrayList> GetUserAD(string user, string search)
        {
            List<ArrayList> GetUserAD = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT DISTINCT [UserAD], [res_id] FROM [dbo].[VW_EmployeesSerch]";

                if (user != "") { sql += "WHERE LTRIM(RTRIM(res_id))='" + user + "'"; }
                if (search != "") { search = search + '%'; sql += "WHERE LTRIM(RTRIM(res_id))LIKE'" + search + "'OR [UserAD]LIKE'" + search + "'OR [NameEN]LIKE'" + search + "'OR [fname]LIKE'" + search + "'OR [costcenter]LIKE'" + search + "'OR [eMail]LIKE'" + search + "' "; }
                sql += "ORDER BY[UserAD] DESC ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetUserAD.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetUserAD;
        }

        public List<ArrayList> GetPosition(string search)
        {
            List<ArrayList> GetPosition = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT Position as job_id,JobTitle as Uf_JobTitle,JobTitleEN as Uf_JobTitleEN FROM [dbo].[TB_HR_Employee_Position] WHERE";

                if (search != "") { search = '%' + search + '%'; sql += " [JobTitle] LIKE '" + search + "' or [Position] LIKE '" + search + "' or [JobTitleEN] LIKE '" + search + "' AND"; }
                sql += " [JobTitle] IS NOT NULL ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPosition.Add(detail);
                        }
                    }
                }
            }
            return GetPosition;
        }

        public List<ArrayList> GetProvince(string search)
        {
            List<ArrayList> GetProvince = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " SELECT province_id, province_name, Cty_ID FROM PPCC_HR_Province";

                if (search != "") { search = '%' + search + '%'; sql += " WHERE [province_name] LIKE '" + search + "'or [province_id] LIKE '" + search + "'"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetProvince.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetProvince;
        }

        public List<ArrayList> GetCountries(string search)
        {
            List<ArrayList> GetCountries = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " SELECT cty_id, cty_description FROM PPCC_HR_Country";

                if (search != "") { search = search + '%'; sql += " WHERE [cty_description] LIKE '" + search + "' or [cty_id] LIKE '" + search + "'"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetCountries.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetCountries;
        }

        public List<ArrayList> GetZoneID(string search)
        {
            List<ArrayList> GetZoneID = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " SELECT zone_id, zone_description FROM PPCC_HR_Zone";

                if (search != "") { search = search + '%'; sql += " WHERE [zone_description] LIKE '" + search + "'or [zone_id] LIKE '" + search + "'"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetZoneID.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetZoneID;
        }

        public List<ArrayList> GetEmpGroup(string search)
        {
            List<ArrayList> GetEmpGroup = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " SELECT Emp_Group,Description FROM PPCC_EmployeeGroup";

                if (search != "") { search = '%' + search + '%'; sql += " WHERE [Description] LIKE '" + search + "'or [Emp_Group] LIKE '" + search + "'"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetEmpGroup.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetEmpGroup;
        }

        public List<ArrayList> GetMainCompany()
        {
            List<ArrayList> GetMainCompany = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [Site_ID],[Site_Ref],[Site_Name_EN],[Site_Name_TH] FROM [HRPortal].[dbo].[VW_MainCompany]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetMainCompany.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetMainCompany;
        }

        public List<ArrayList> GetSearchMainCompany(string search)
        {
            List<ArrayList> GetMainCompany = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [Site_ID],[Site_Ref],[Site_Name_EN],[Site_Name_TH] FROM [HRPortal].[dbo].[VW_MainCompany]";
                sql += " Where [Site_Name_EN] like '%" + search + "%' OR [Site_Name_TH] like '%" + search + "%'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetMainCompany.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetMainCompany;
        }

        public List<ArrayList> GetSiteRef()
        {
            List<ArrayList> GetSiteRef = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [Site_Ref],[Site_Name_EN],[Site_Name_TH] FROM [HRPortal].[dbo].[VW_Company]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetSiteRef.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetSiteRef;
        }

        public List<ArrayList> GetPA_TAG_Type_Car()
        {
            List<ArrayList> GetAssetType = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [Group_Code],[Group_Detail] FROM [dbo].[VW_PA_TAG_Group] ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetAssetType.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetAssetType;
        }

        public List<ArrayList> VW_PA_TAG_Charge(string search)
        {
            List<ArrayList> PA_TAG_Charge = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [CH_Code],[Detail],[CH_Desc], cast([CH_Value] as numeric(36,2)) as 'CH_Value'  , [EffectDate]  FROM [dbo].[VW_PA_TAG_Charge]";
                if (search != "")
                {
                    sql += "   WHERE [CH_Code] like '%" + search + "%' OR [Detail] like '%" + search + "%' OR [CH_Desc] like '%" + search + "%' OR [CH_Value] like '%" + search + "%'  OR [EffectDate]  like '%" + search + "%' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            PA_TAG_Charge.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return PA_TAG_Charge;
        }

        public List<ArrayList> GetLocation()
        {
            List<ArrayList> GetLocation = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " select [Location], [Description] from VW_Location order by [Description] asc";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetLocation.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetLocation;
        }


        public List<ArrayList> GetCountry(string search)
        {
            List<ArrayList> GetCountry = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = "SELECT [iso_country_code],[country],[Uf_CountryTH] FROM [dbo].[country_mst] ";
                if (search != "") { sql += " WHERE [Uf_CountryTH] LIKE '%" + search + "%' or [country] LIKE '%" + search + "%'  or [iso_country_code] LIKE '%" + search + "%'"; }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetCountry.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }

            return GetCountry;
        }

        public List<ArrayList> ShowCountry(string search)
        {
            List<ArrayList> ShowCountry = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = "SELECT [iso_country_code],[country],[Uf_CountryTH] FROM [dbo].[country_mst] ";
                if (search != "") { sql += " WHERE [iso_country_code] = '" + search + "' "; }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            ShowCountry.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }

            return ShowCountry;
        }

        public List<ArrayList> getHrshiftID()
        {
            List<ArrayList> getHrshiftID = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = "SELECT [hrshift_id] , [description] FROM [dbo].[PPCC_HR_Shift]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            getHrshiftID.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return getHrshiftID;
        }

        //Start InterBenefit
        public List<ArrayList> GetInterBenefit()
        {
            List<ArrayList> getHrshiftID = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "Select [ID],MI.[Zone_ID],[Country],[Allowance],[ActualBenefit],[Accomodation],[Currency],[EmpLevel],[EffectiveData],[Actualfood],[food]," +
                    "HRZ.[zone_description] as Zone_ID_desc " +
                    ",HRZC.[zone_description] as Country_desc " +
                    "FROM [TB_Maintain_InterBenefit] MI " +
                    "LEFT JOIN [ERP_PKS_App].[dbo].[PPCC_HR_Zone] HRZ " +
                    "ON  MI.[Zone_ID] = HRZ.[zone_id] " +
                    "LEFT JOIN [ERP_PKS_App].[dbo].[PPCC_HR_Zone] HRZC " +
                    "ON  MI.[Country] = HRZC.[zone_id]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            getHrshiftID.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return getHrshiftID;
        }

        //Benefit Start
        public string SP_Benefits(string Emp_Num, string Bef_Shift, string HRProvince, string HRCountry, string ZoneID, string OTLocation,
            string Emp_group, int Emp_scrub, int Emp_spray, string Emp_carrate, string Language, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_Benefits", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Emp_num", Emp_Num);
            cmd.Parameters.AddWithValue("Bef_Shift", Bef_Shift);
            cmd.Parameters.AddWithValue("Bef_HRProvince", HRProvince);
            cmd.Parameters.AddWithValue("Bef_HRCountry", HRCountry);
            cmd.Parameters.AddWithValue("Bef_ZoneID", ZoneID);
            cmd.Parameters.AddWithValue("Bef_OTLocation", OTLocation);
            cmd.Parameters.AddWithValue("Bef_EmpGroup", Emp_group);
            cmd.Parameters.AddWithValue("Bef_EmpScrub", Emp_scrub);
            cmd.Parameters.AddWithValue("Bef_EmpSpray", Emp_spray);
            cmd.Parameters.AddWithValue("Bef_EmpCarrate", Emp_carrate);
            cmd.Parameters.AddWithValue("Language", Language);
            cmd.Parameters.AddWithValue("Action", Action);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Emp_num"].ToString();
            }

            con.Close();

            return returnData;
        }

        //Benefit End

        public List<ArrayList> Gettypeleave()
        {
            List<ArrayList> Gettypeleave = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [Name],[TH_Name] FROM [dbo].[TB_Leave_MasterData]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                        http://localhost:56996/Connected Services/Syteline/
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Gettypeleave.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return Gettypeleave;
        }

        public List<ArrayList> GetBank(string TypeName, string search)
        {
            List<ArrayList> Getdate = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = "SELECT [Value],[Description] FROM [dbo].[UserDefinedTypeValues]";
                if (TypeName == "Vendor Bank") { sql += "WHERE [TypeName] = '" + TypeName + "'"; }
                if (TypeName == "Vendor Branch") { sql += "WHERE [TypeName] = '" + TypeName + "'"; }
                if (search != "") { sql += " and ([Description] like '%" + search + "%' or [Value] like '%" + search + "%')"; }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Getdate.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return Getdate;
        }

        public List<ArrayList> Getleave(string EmpNum)
        {
            List<ArrayList> Getleave = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[emp_num],[type]" +
                    ",CONVERT(nvarchar(10),CAST([startdate] as DATE),103) as startdate" +
                    ",CONVERT(nvarchar(10),CAST([enddate] as DATE),103)as enddate" +
                    ",[redirect],[UserName] FROM [dbo].[TB_Leave_Maintain] ";

                sql += "WHERE [emp_num] ='" + EmpNum + "'";


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Getleave.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return Getleave;
        }

        public List<ArrayList> GetJobExp(string search)
        {
            List<ArrayList> GetJobExp = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[Emp_Num] ,[JobExperience],[EndDate],[Company] FROM [HRPortal].[dbo].[TB_HR_Employee_JobExp] ";

                sql += "WHERE [Emp_Num] ='" + search + "'";


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetJobExp.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetJobExp;
        }

        public List<ArrayList> GetCurrency(string search)
        {
            List<ArrayList> GetCurrency = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " SELECT [curr_code] ,[description] FROM [dbo].[VW_currency] ";

                if (search != "") { search = '%' + search + '%'; sql += " WHERE [description] LIKE '" + search + "'or [curr_code] LIKE '" + search + "'"; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetCurrency.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetCurrency;
        }

        public List<ArrayList> GetTbListRedirect(string search)
        {
            List<ArrayList> GetTbListRedirect = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(con))
            {
                string sql = "EXEC[SP_Worklist_MyTask_ReVersion] '" + search + "', '','' ,'','','' ,'' ,'' ,'' ,'' ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetTbListRedirect.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetTbListRedirect;
        }

        public List<ArrayList> GetSNvalueRedirect(string TypeName, string search, string version)
        {
            List<ArrayList> GetSnvalue = new List<ArrayList>();
            SqlConnection connection = new SqlConnection();
            if (version == "V4")
            {
                connection = new SqlConnection(con);
            }
            else if (version == "V5")
            {
                connection = new SqlConnection(conK2db5);
            }

            using (connection)
            {
                string sql = "SELECT SNValue,Destination FROM VW_WorkflowDestination WHERE  1 = 1" +
                             " AND ProcInstID = '" + search + "'" +
                             " AND Destination like '%" + TypeName + "%'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetSnvalue.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetSnvalue;
        }

        public string SP_HR_Employee(string Emp_Num, string Language, string Emp_Prefix, string Emp_Profile, string Emp_FirstName, string Emp_LastName, string Emp_MidderName, string Emp_Level, string Emp_JobTitle, string Emp_Location, string Emp_Email, string Emp_Extension, string Emp_Comp_Phone, string Emp_StartDate, string Emp_HireDate, string Emp_HR_Shift_ID, string Emp_Type, string Emp_ID_Card
      , string Emp_ID_Card_Expired_Date, string Emp_Birth_Date, string Emp_Gender, string Emp_Nationality, string Emp_Religion, string Emp_Marital_Status, string Emp_Children, string Emp_Address1, string Emp_Address2, string Emp_Address3, string Emp_Address4
      , string Emp_District, string Emp_Country, string Emp_City, string Emp_County, string Emp_ZipCode, string Emp_Phone, string Emp_Bank, string Emp_BankBranch, string Emp_BankAccount, string Emp_Emergency_Contact, string Emp_Emergency_Phone, string Emp_EndDate, string Emp_Status
      , string Emp_Position, string Emp_NickName, string Emp_ManagerID, string Emp_ManagerName, int Emp_StartLongevity, string PayFreq, int FirstTripAbroad, string Department, string Main_Company, string Bef_Shift, string Bef_HRProvince, string Bef_HRCountry, string Bef_ZoneID, string Bef_OTLocation, string Bef_EmpGroup, int Bef_EmpScrub, int Bef_EmpSpray, string Bef_EmpCarrate, string Emp_WeddingBenefit, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Language", Language);
            cmd.Parameters.AddWithValue("Emp_Prefix", Emp_Prefix);
            cmd.Parameters.AddWithValue("Emp_Profile", Emp_Profile);
            cmd.Parameters.AddWithValue("Emp_FirstName", Emp_FirstName);
            cmd.Parameters.AddWithValue("Emp_LastName", Emp_LastName);
            cmd.Parameters.AddWithValue("Emp_MidderName", Emp_MidderName);
            cmd.Parameters.AddWithValue("Emp_Level", Emp_Level);
            cmd.Parameters.AddWithValue("Emp_JobTitle", Emp_JobTitle);
            cmd.Parameters.AddWithValue("Emp_Location", Emp_Location);
            cmd.Parameters.AddWithValue("Emp_Email", Emp_Email);
            cmd.Parameters.AddWithValue("Emp_Extension", Emp_Extension);
            cmd.Parameters.AddWithValue("Emp_Comp_Phone", Emp_Comp_Phone);
            cmd.Parameters.AddWithValue("Emp_StartDate", Emp_StartDate);
            cmd.Parameters.AddWithValue("Emp_HireDate", Emp_HireDate);
            cmd.Parameters.AddWithValue("Emp_HR_Shift_ID", Emp_HR_Shift_ID);
            cmd.Parameters.AddWithValue("Emp_Type", Emp_Type);
            cmd.Parameters.AddWithValue("Emp_ID_Card", Emp_ID_Card);
            cmd.Parameters.AddWithValue("Emp_ID_Card_Expired_Date", Emp_ID_Card_Expired_Date);
            cmd.Parameters.AddWithValue("Emp_Birth_Date", Emp_Birth_Date);
            cmd.Parameters.AddWithValue("Emp_Gender", Emp_Gender);
            cmd.Parameters.AddWithValue("Emp_Nationality", Emp_Nationality);
            cmd.Parameters.AddWithValue("Emp_Religion", Emp_Religion);
            cmd.Parameters.AddWithValue("Emp_Marital_Status", Emp_Marital_Status);
            cmd.Parameters.AddWithValue("Emp_Children", Emp_Children);
            cmd.Parameters.AddWithValue("Emp_Address1", Emp_Address1);
            cmd.Parameters.AddWithValue("Emp_Address2", Emp_Address2);
            cmd.Parameters.AddWithValue("Emp_Address3", Emp_Address3);
            cmd.Parameters.AddWithValue("Emp_Address4", Emp_Address4);
            cmd.Parameters.AddWithValue("Emp_District", Emp_District);
            cmd.Parameters.AddWithValue("Emp_Country", Emp_Country);
            cmd.Parameters.AddWithValue("Emp_City", Emp_City);
            cmd.Parameters.AddWithValue("Emp_County", Emp_County);
            cmd.Parameters.AddWithValue("Emp_ZipCode", Emp_ZipCode);
            cmd.Parameters.AddWithValue("Emp_Phone", Emp_Phone);
            cmd.Parameters.AddWithValue("Emp_Bank", Emp_Bank);
            cmd.Parameters.AddWithValue("Emp_BankBranch", Emp_BankBranch);
            cmd.Parameters.AddWithValue("Emp_BankAccount", Emp_BankAccount);
            cmd.Parameters.AddWithValue("Emp_Emergency_Contact", Emp_Emergency_Contact);
            cmd.Parameters.AddWithValue("Emp_Emergency_Phone", Emp_Emergency_Phone);
            cmd.Parameters.AddWithValue("Emp_EndDate", Emp_EndDate);
            cmd.Parameters.AddWithValue("Emp_Status", Emp_Status);
            cmd.Parameters.AddWithValue("Emp_Position", Emp_Position);
            cmd.Parameters.AddWithValue("Emp_NickName", Emp_NickName);
            cmd.Parameters.AddWithValue("Emp_ManagerID", Emp_ManagerID);
            cmd.Parameters.AddWithValue("Emp_ManagerName", Emp_ManagerName);
            cmd.Parameters.AddWithValue("Emp_StartLongevity", Emp_StartLongevity);
            cmd.Parameters.AddWithValue("PayFreq", PayFreq);
            cmd.Parameters.AddWithValue("FirstTripAbroad", FirstTripAbroad);
            cmd.Parameters.AddWithValue("Department", Department);
            cmd.Parameters.AddWithValue("Main_Company", Main_Company);
            cmd.Parameters.AddWithValue("Bef_Shift", Bef_Shift);
            cmd.Parameters.AddWithValue("Bef_HRProvince", Bef_HRProvince);
            cmd.Parameters.AddWithValue("Bef_HRCountry", Bef_HRCountry);
            cmd.Parameters.AddWithValue("Bef_ZoneID", Bef_ZoneID);
            cmd.Parameters.AddWithValue("Bef_OTLocation", Bef_OTLocation);
            cmd.Parameters.AddWithValue("Bef_EmpGroup", Bef_EmpGroup);
            cmd.Parameters.AddWithValue("Bef_EmpScrub", Bef_EmpScrub);
            cmd.Parameters.AddWithValue("Bef_EmpSpray", Bef_EmpSpray);
            cmd.Parameters.AddWithValue("Bef_EmpCarrate", Bef_EmpCarrate);
            cmd.Parameters.AddWithValue("Wedding_Benefit", Emp_WeddingBenefit);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("msg", "");
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            string returnData = "";
            using (SqlDataReader rs = cmd.ExecuteReader())
            {
                while (rs.Read())
                {
                    returnData = rs["msg"].ToString();
                }
            }

            con.Close();

            return returnData;
        }


        public string SP_HR_Employee_Company(int ID, string Emp_Num, string Company, string CostCenter, string Division, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Company", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Company", Company);
            cmd.Parameters.AddWithValue("CostCenter", CostCenter);
            cmd.Parameters.AddWithValue("Division", Division);
            cmd.Parameters.AddWithValue("Action", Action);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }

        public string SP_HR_Employee_JobExp(int ID, string Company, string JobExperience, string EndDate, int Emp_Num, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_JobExp", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Company", Company);
            cmd.Parameters.AddWithValue("JobExperience", JobExperience);
            cmd.Parameters.AddWithValue("EndDate", EndDate);
            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Action", Action);
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();

            return returnData;

        }

        public string SP_HR_Employee_Education(int ID, string Level, string Institution, string Faculty, string Major, string Graduate, string Emp_Num, string image, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Education", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Emp_Level", Level);
            cmd.Parameters.AddWithValue("Institution", Institution);
            cmd.Parameters.AddWithValue("Faculty", Faculty);
            cmd.Parameters.AddWithValue("Major", Major);
            cmd.Parameters.AddWithValue("Graduate", Graduate);
            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Image_Edu", image);
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());
            cmd.Parameters.AddWithValue("Action", Action);
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();

            return returnData;
        }

        public string SP_HR_Employee_Certificate(int ID, string Emp_Num, string Emp_Certificate, string Description, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Certificate", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Emp_Certificate", Emp_Certificate);
            cmd.Parameters.AddWithValue("Description", Description);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_Master(string PA_TAG_Code, string PA_TAG_Type_Car, string PA_TAG_Band, string PA_TAG_Model, string PA_TAG_Start_DATE
            , string PA_TAG_End_DATE, string PA_TAG_CarID, double PA_TAG_Price, string PA_TAG_Name_Sell, string PA_TAG_IMAGE, string PA_TAG_SN
            , string PA_TAG_DETAIL, string PA_TAG_REMARK, string PA_TAG_Company_Location, string PA_TAG_Status, string PA_TAG_Car_Status
            , string PA_TAG_Contact_ID, string PA_TAG_TAX, string PA_TAG_Type_TAX, string PA_TAG_CHARGE, string PA_TAG_MAC, string PA_TAG_ENG, string PA_TAG_Asset_Type
            , string PA_TAG_Asset_Code, string FleetCardNo, string EasypassNo, string Stauts)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Master", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("PA_TAG_Code", PA_TAG_Code);
            cmd.Parameters.AddWithValue("PA_TAG_Type_Car", PA_TAG_Type_Car);
            cmd.Parameters.AddWithValue("PA_TAG_Band", PA_TAG_Band);
            cmd.Parameters.AddWithValue("PA_TAG_Model", PA_TAG_Model);
            cmd.Parameters.AddWithValue("PA_TAG_Start_DATE", PA_TAG_Start_DATE);
            cmd.Parameters.AddWithValue("PA_TAG_End_DATE", PA_TAG_End_DATE);
            cmd.Parameters.AddWithValue("PA_TAG_CarID", PA_TAG_CarID);
            cmd.Parameters.AddWithValue("PA_TAG_Price", PA_TAG_Price);
            cmd.Parameters.AddWithValue("PA_TAG_Name_Sell", PA_TAG_Name_Sell);
            cmd.Parameters.AddWithValue("PA_TAG_IMAGE", PA_TAG_IMAGE);
            cmd.Parameters.AddWithValue("PA_TAG_SN", PA_TAG_SN);
            cmd.Parameters.AddWithValue("PA_TAG_DETAIL", PA_TAG_DETAIL);
            cmd.Parameters.AddWithValue("PA_TAG_REMARK", PA_TAG_REMARK);
            cmd.Parameters.AddWithValue("PA_TAG_Company_Location", PA_TAG_Company_Location);
            cmd.Parameters.AddWithValue("PA_TAG_Status", PA_TAG_Status);
            cmd.Parameters.AddWithValue("PA_TAG_Car_Status", PA_TAG_Car_Status);
            cmd.Parameters.AddWithValue("PA_TAG_Contact_ID", PA_TAG_Contact_ID);
            cmd.Parameters.AddWithValue("PA_TAG_TAX", PA_TAG_TAX);
            cmd.Parameters.AddWithValue("PA_TAG_CHARGE", PA_TAG_CHARGE);
            cmd.Parameters.AddWithValue("PA_TAG_MAC", PA_TAG_MAC);
            cmd.Parameters.AddWithValue("PA_TAG_ENG", PA_TAG_ENG);
            cmd.Parameters.AddWithValue("PA_TAG_Asset_Type", PA_TAG_Asset_Type);
            cmd.Parameters.AddWithValue("PA_TAG_Asset_Code", PA_TAG_Asset_Code);
            cmd.Parameters.AddWithValue("FleetCardNo", FleetCardNo);
            cmd.Parameters.AddWithValue("EasypassNo", EasypassNo);
            cmd.Parameters.AddWithValue("Username", GetUser());
            cmd.Parameters.AddWithValue("Stauts", Stauts);
            cmd.Parameters.AddWithValue("PA_TAG_Type_TAX", PA_TAG_Type_TAX);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["PA_TAG_Code"].ToString();
            }
            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_Master_IMG(string PA_TAG_Code, string PA_TAG_IMAGE)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Master_IMG", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("PA_TAG_Code", PA_TAG_Code);
            cmd.Parameters.AddWithValue("PA_TAG_IMAGE", PA_TAG_IMAGE);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["PA_TAG_Code"].ToString();
            }
            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_Tax_IMG(int ID, int Tax_ID, string Path)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Tax_IMG", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Tax_ID", Tax_ID);
            cmd.Parameters.AddWithValue("Path", Path);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();


            if (ID != 0)
            {
                System.IO.FileInfo fi = new System.IO.FileInfo(Path);
                try { fi.Delete(); }
                catch (System.IO.IOException e) { Console.WriteLine(e.Message); }
            }

            return returnData;
        }

        public string SP_PA_TAG_Insurance_IMG(int ID, int Insurance_ID, string Path)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Insurance_IMG", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Insurance_ID", Insurance_ID);
            cmd.Parameters.AddWithValue("Path", Path);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();

            if (ID != 0)
            {
                System.IO.FileInfo fi = new System.IO.FileInfo(Path);
                try { fi.Delete(); }
                catch (System.IO.IOException e) { Console.WriteLine(e.Message); }
            }

            return returnData;
        }
        public string SP_PA_TAG_MA_IMG(int ID, int MA_ID, string Path)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_MA_IMG", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("MA_ID", MA_ID);
            cmd.Parameters.AddWithValue("Path", Path);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();

            if (ID != 0)
            {
                System.IO.FileInfo fi = new System.IO.FileInfo(Path);
                try { fi.Delete(); }
                catch (System.IO.IOException e) { Console.WriteLine(e.Message); }
            }

            return returnData;
        }
        public string SP_PA_TAG_PE(string ID, string PA_TAG_Code, string PA_PE_User, string PA_PE_Date, string PA_PE_Detail)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_PE", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("PA_TAG_Code", PA_TAG_Code);
            cmd.Parameters.AddWithValue("PA_PE_User", PA_PE_User);
            cmd.Parameters.AddWithValue("PA_PE_Date", PA_PE_Date);
            cmd.Parameters.AddWithValue("PA_PE_Detail", PA_PE_Detail);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_MA(string ID, string Repair_Type, string PA_MA_DETAIL, string PA_MA_DATE, int PA_MA_SUPPLIER, double PA_MA_PRICE, int PA_MA_MILE)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_MA", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Repair_Type", Repair_Type);
            cmd.Parameters.AddWithValue("PA_MA_DETAIL", PA_MA_DETAIL);
            cmd.Parameters.AddWithValue("PA_MA_DATE", PA_MA_DATE);
            cmd.Parameters.AddWithValue("PA_MA_SUPPLIER", PA_MA_SUPPLIER);
            cmd.Parameters.AddWithValue("PA_MA_PRICE", PA_MA_PRICE);
            cmd.Parameters.AddWithValue("PA_MA_MILE", PA_MA_MILE);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_Insurance(string ID, string PA_TAG_Code, string PA_INS_Detail, string PA_INS_Name_Insurance, string PA_INS_Serial_Insurance, string PA_INS_Start_Date_Insurance, string PA_INS_End_Date_Insurance, string PA_INS_Price_Insurance, string PA_INS_Start_Date_Act, string PA_INS_End_Date_Act, string PA_INS_Price_Act ,string PA_INS_Serial_Act)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Insurance", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("PA_TAG_Code", PA_TAG_Code);
            cmd.Parameters.AddWithValue("PA_INS_Detail", PA_INS_Detail);
            cmd.Parameters.AddWithValue("PA_INS_Name_Insurance", PA_INS_Name_Insurance);
            cmd.Parameters.AddWithValue("PA_INS_Serial_Insurance", PA_INS_Serial_Insurance);
            cmd.Parameters.AddWithValue("PA_INS_Start_Date_Insurance", PA_INS_Start_Date_Insurance);
            cmd.Parameters.AddWithValue("PA_INS_End_Date_Insurance", PA_INS_End_Date_Insurance);
            cmd.Parameters.AddWithValue("PA_INS_Price_Insurance", PA_INS_Price_Insurance);
            cmd.Parameters.AddWithValue("PA_INS_Start_Date_Act", PA_INS_Start_Date_Act);
            cmd.Parameters.AddWithValue("PA_INS_End_Date_Act", PA_INS_End_Date_Act);
            cmd.Parameters.AddWithValue("PA_INS_Price_Act", PA_INS_Price_Act);
            cmd.Parameters.AddWithValue("PA_INS_Serial_Act", PA_INS_Serial_Act);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }
        
    public string SP_PA_TAG_Tax(int ID, string PA_TAG_Code, string PA_TAX_Detail, string PA_TAX_Start_Date, string PA_TAX_End_Date ,double PA_TAX_Price)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Tax", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("PA_TAG_Code", PA_TAG_Code);
            cmd.Parameters.AddWithValue("PA_TAX_Detail", PA_TAX_Detail);
            cmd.Parameters.AddWithValue("PA_TAX_Start_Date", PA_TAX_Start_Date);
            cmd.Parameters.AddWithValue("PA_TAX_End_Date", PA_TAX_End_Date);
            cmd.Parameters.AddWithValue("PA_TAX_Price", PA_TAX_Price);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();
            return returnData;
        }

        public string SP_HR_Employee_Authen(string Emp_Num, string Username, string Permission, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Authen", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Emp_Num_Per", Emp_Num);
            cmd.Parameters.AddWithValue("Username", Username);
            cmd.Parameters.AddWithValue("Permission", Permission);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Emp_Num"].ToString();
            }
            con.Close();

            return returnData;

        }


        public List<ArrayList> VW_HR_List_Company(string search)
        {
            List<ArrayList> Company = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [Costcenter],[CostcenterDesc],[Divition],[BU_Group],[BU_GroupDesc] FROM [HRPortal].[dbo].[VW_Dept_AllSite] where ";

                if (search != "") { search = '%' + search + '%'; sql += "( [Costcenter] LIKE '" + search + "' or [CostcenterDesc] LIKE '" + search + "' or [BU_GroupDesc] LIKE '" + search + "') AND"; }
                sql += " [BU_GroupDesc] IS NOT NULL ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Company.Add(detail);
                        }
                    }
                }
            }
            return Company;
        }
        public List<ArrayList> VW_HR_List_Group(string search)
        {
            List<ArrayList> Company = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT Distinct [BU_GroupDesc] FROM [HRPortal].[dbo].[VW_Dept_AllSite] where ";

                if (search != "") { search = '%' + search + '%'; sql += "( [Costcenter] LIKE '" + search + "' or [CostcenterDesc] LIKE '" + search + "' or [BU_GroupDesc] LIKE '" + search + "') AND"; }
                sql += " [BU_GroupDesc] IS NOT NULL ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Company.Add(detail);
                        }
                    }
                }
            }
            return Company;
        }
        public List<ArrayList> VW_HR_List_CompanyExport(string search, string company, string buGroup, string step)
        {
            List<ArrayList> Company = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "";
                if (step == "group") { sql += " SELECT  DISTINCT [BU_Group],[BU_GroupDesc] FROM [HRPortal].[dbo].[VW_Dept_AllSite] where "; }
                else { sql += " SELECT  DISTINCT [BU_Group],[CostCenterDesc],[CostCenter] FROM [HRPortal].[dbo].[VW_Dept_AllSite] where "; }

                if (step == "group" && search != "") { search = '%' + search + '%'; sql += "( [BU_Group] LIKE '" + search + "' or[BU_GroupDesc] LIKE '" + search + "') AND"; }
                if (step != "group" && search != "") { search = '%' + search + '%'; sql += "( [BU_GroupDesc] LIKE '" + search + "' or[CostCenter] LIKE '" + search + "') AND"; }
                if (company != "") { company = '%' + company + '%'; sql += "( [site_ref] LIKE '" + company + "') AND"; }
                if (buGroup != "") { buGroup = '%' + buGroup + '%'; sql += "( [BU_Group] LIKE '" + buGroup + "') AND"; }
                sql += " [BU_GroupDesc] IS NOT NULL  ";


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Company.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return Company;
        }

        public string VW_HR_List_Employee(int ID, int Emp_Num, int CheckMain, string Company, string Division, string CostCenter)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("VW_HR_List_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("CheckMain", CheckMain);
            cmd.Parameters.AddWithValue("Company", Company);
            cmd.Parameters.AddWithValue("Division", Division);
            cmd.Parameters.AddWithValue("CostCenter", CostCenter);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();

            return returnData;
        }

        public string SP_HR_Employee_Leave(int ID, string Emp_Num, string Emp_UserName, string Emp_Type, string Leave_StartDate, string Leave_EndDate, string Redirect, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Leave", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Emp_UserName", Emp_UserName);
            cmd.Parameters.AddWithValue("Emp_Type", Emp_Type);
            cmd.Parameters.AddWithValue("Leave_StartDate", Leave_StartDate);
            cmd.Parameters.AddWithValue("Leave_EndDate", Leave_EndDate);
            cmd.Parameters.AddWithValue("Redirect", Redirect);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("User", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();

            return returnData;
        }

        public string GetConfName(string SiteRef)
        {
            string sql;
            sql = "SELECT ConfName FROM [PATKOL_K2APP_DATA].[dbo].SiteDatabase WHERE SiteRef ='" + SiteRef + "'";
            SqlConnection con = new SqlConnection(conPKS);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ConfName"].ToString();
            }
            con.Close();

            return returnData;
        }
        public List<List<ArrayList>> GetExportEmp(string Emp_Company, string Emp_Group, string CostCenterStart, string CostCenterEnd, string ExportActive, string ExportInActive, string type)
        {
            DataTable DTData = new DataTable();

            SqlConnection Con = new SqlConnection(conHRPortal);
            SqlCommand Com = new SqlCommand();

            string sql = "SELECT [Emp_Num],[Language],[Emp_Prefix],[Emp_FirstName],[Emp_LastName],[Emp_MidderName] ,[Emp_Level],[JobTitle_Name],[Emp_Location],[Emp_Email],[Emp_Extension],[Emp_Comp_Phone]" +
                         ",[Emp_StartDate],[Emp_HireDate],[Emp_HR_Shift_ID],[Emp_Type],[Emp_ID_Card],[Emp_ID_Card_Expired_Date],[Emp_Birth_Date]" +
                         ",[Emp_Gender],[Emp_Nationality],[Emp_Religion],[Emp_Marital_Status],[Emp_Children],[Emp_Address1],[Emp_Address2],[Emp_Address3],[Emp_Address4],[Emp_District],[Emp_Country],[Emp_City],[Emp_County],[Emp_ZipCode],[Emp_Phone],[Emp_Bank],[Emp_BankBranch],[Emp_BankAccount],[Emp_Emergency_Contact],[Emp_Emergency_Phone],[Emp_Status]" +
                         ",[EndDate],[Emp_Position],[Emp_NickName],[Emp_ManagerID],[Emp_ManagerName],[PayFreq],[FirstTripAbroad],[Department],[Main_Company],[Bef_Shift],[Bef_HRProvince],[Bef_HRCountry],[Bef_ZoneID],[Bef_OTLocation],[Bef_EmpGroup],[Bef_EmpScrub]" +
                         ",[Bef_EmpSpray],[Bef_EmpCarrate],[Wedding_Benefit] FROM [dbo].[TB_HR_Employee] emp ";

            sql += "LEFT JOIN[VW_Dept_AllSite] dept ON emp.[Main_Company] = dept.[site_ref]";
            sql += "AND emp.[Department] = dept.[Costcenter]";
            if (Emp_Company != "") { sql += "Where emp.[Main_Company] = '" + Emp_Company + "'"; }
            if (Emp_Group != "") { sql += " and dept.[BU_Group] = '" + Emp_Group + "'"; }
            if (CostCenterStart != "" && CostCenterEnd != "") { sql += " AND ( emp.[Department] >= '" + CostCenterStart + "' AND emp.[Department]  <= '" + CostCenterEnd + "')"; }
            if (ExportActive == "Active" && ExportInActive != "InActive") { sql += " AND(emp.[Emp_Status] = '" + ExportActive + "')"; }
            if (ExportActive != "Active" && ExportInActive == "InActive") { sql += "AND ( emp.[Emp_Status] = '" + ExportInActive + "')"; }
            sql += "AND (  [Language] = '" + type + "')";
            sql += "ORDER BY emp.[Emp_Num]";

            try
            {
                Con.Open();
                Com.Connection = Con;
                Com.CommandType = CommandType.Text;
                Com.CommandText = sql;
                Com.CommandTimeout = 0;
                DTData.Load(Com.ExecuteReader());
            }
            catch (SqlException ex)
            {
                Con.Close();
                Com.Dispose();
            }
            Con.Close();
            Com.Dispose();
            //Query ข้อมูล
            List<List<ArrayList>> ListTotal = new List<List<ArrayList>>();
            List<ArrayList> ListColumn = new List<ArrayList>();
            List<ArrayList> ListData = new List<ArrayList>();
            //สร้าง Columnหัวตาราง
            //สร้าง ข้อมูลข้างใน

            if (DTData.Rows.Count > 0)
            {
                foreach (DataColumn row in DTData.Columns)
                {
                    ArrayList detail = new ArrayList();
                    detail.Add(row.ColumnName.ToString());
                    ListColumn.Add(detail);
                }

                foreach (DataRow row in DTData.Rows)
                {
                    ArrayList detail = new ArrayList();
                    for (int i = 0; i < row.ItemArray.Length; i++) { detail.Add(row[i].ToString()); }
                    ListData.Add(detail);
                }

                ListTotal.Add(ListColumn);
                ListTotal.Add(ListData);
            }
            return ListTotal;
        }

        public string SP_Maintain_InterBenefit(int ID, string ZoneID, string Country, string Allowance, int Actualfood, string food, int ActualBenefit, string Accomodation, string Currency, string Effect_Data, string EmpLevel, string Action)
        {
            string sql;
            sql = " EXEC  [dbo].[SP_Maintain_InterBenefit]" +
             "@ID = " + ID + ", @ZoneID = '" + ZoneID + "', " +
             "@Country ='" + Country + "'," +
             "@Allowance = '" + Allowance + "'," +
             "@Actualfood = " + Actualfood + "," +
             "@food = '" + food + "' ," +
             "@ActualBenefit = " + ActualBenefit + "," +
             "@Accomodation = '" + Accomodation + "' ," +
             "@Currency = '" + Currency + "' ," +
             "@EffecttiveDate = '" + Effect_Data + "'," +
             "@EmpLevel ='" + EmpLevel + "'," +
             "@Action  ='" + Action + "'," +
             "@txtEmpDefult = '" + GetUser() + "'";
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();

            return returnData;
        }
        public string SP_Maintain_Domestic(int ID, string ZoneID, string Allowance, int Actualfood, string food, int ActualBenefit, string Accomodation, string Currency, string Effect_Data, string EmpLevel, string Action)
        {
            string sql;
            sql = " EXEC  [dbo].[SP_Maintain_Domestic]" +
             "@ID = " + ID + ", @ZoneID = '" + ZoneID + "', " +
             "@Allowance = '" + Allowance + "'," +
             "@Actualfood = " + Actualfood + "," +
             "@food = '" + food + "' ," +
             "@ActualBenefit = " + ActualBenefit + "," +
             "@Accomodation = '" + Accomodation + "' ," +
             "@Currency = '" + Currency + "' ," +
             "@EffecttiveDate = '" + Effect_Data + "'," +
             "@EmpLevel ='" + EmpLevel + "'," +
             "@Action  ='" + Action + "'," +
             "@txtEmpDefult = '" + GetUser() + "'";
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["ID"].ToString();
            }
            con.Close();

            return returnData;
        }
        public List<ArrayList> GetListEmployee_Draft(string Emp_Num, string search, string type, string fillter)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {

                string sql = "SELECT [Emp_Num],[Language],[Emp_Prefix],[Emp_Profile],[Emp_FirstName],[Emp_LastName],[Emp_MidderName] ,[Emp_Level],[Emp_JobTitle],[Emp_Location],[Emp_Email],[Emp_Extension],[Emp_Comp_Phone]" +
                    ",[Emp_StartDate],[Emp_HireDate],[Emp_HR_Shift_ID],[Emp_Type],[Emp_ID_Card],[Emp_ID_Card_Expired_Date],[Emp_Birth_Date]" +
                    ",[Emp_Gender],[Emp_Nationality],[Emp_Religion],[Emp_Marital_Status],[Emp_Children],[Emp_Address1],[Emp_Address2],[Emp_Address3],[Emp_Address4],[Emp_District],[Emp_Country],[Emp_City],[Emp_County],[Emp_ZipCode],[Emp_Phone],[Emp_Bank],[Emp_BankBranch],[Emp_BankAccount],[Emp_Emergency_Contact],[Emp_Emergency_Phone],[Emp_Status]" +
                    ",[EndDate],[Emp_Position],[Emp_NickName],[Emp_ManagerID],[Emp_ManagerName],[PayFreq],[FirstTripAbroad],[Department],[Main_Company],[Bef_Shift],[Bef_HRProvince],[Bef_HRCountry],[Bef_ZoneID],[Bef_OTLocation],[Bef_EmpGroup],[Bef_EmpScrub]" +
                    ",[Bef_EmpSpray],[Bef_EmpCarrate],[Wedding_Benefit],[StartLongevity] FROM [dbo].[TB_HR_Employee_Draft] ";

                //sql += " WHERE [Language] = '" + type + "' ";

                if (Emp_Num != "") { sql += "WHERE  [Emp_Num] = '" + Emp_Num + "'  "; }
                if (search != "")
                {
                    search = '%' + search + '%';
                    if (fillter != "")
                    {
                        sql += "WHERE ( " + fillter + " LIKE '" + search + "' ";
                        if (fillter == "[Emp_FirstName]")
                        {
                            sql += "OR [Emp_LastName] LIKE '" + search + "' ";
                        }
                        else if (fillter == "[Emp_ManagerName]")
                        {
                            sql += "OR [Emp_ManagerID] LIKE '" + search + "' ";
                        }
                        sql += ")";
                    }
                    else
                    {
                        sql += "WHERE ([Emp_FirstName] LIKE '" + search + "' OR [Emp_Num] LIKE '" + search + "' OR [Emp_MidderName] LIKE'" + search + "' OR [Emp_LastName] LIKE '" + search + "' OR [Emp_Email] LIKE '" + search + "' OR [Emp_Extension] LIKE '" + search + "') ";
                    }
                }

                if (type == "EN") { sql += " ORDER BY Language ASC, Emp_FirstName DESC "; } else { sql += " ORDER BY Language DESC, Emp_FirstName DESC "; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }

        public string SP_HR_Employee_Draft(string Emp_Num, string Language, string Emp_Prefix, string Emp_Profile, string Emp_FirstName, string Emp_LastName, string Emp_MidderName, string Emp_Level, string Emp_JobTitle, string Emp_Location, string Emp_Email, string Emp_Extension, string Emp_Comp_Phone, string Emp_StartDate, string Emp_HireDate, string Emp_HR_Shift_ID, string Emp_Type, string Emp_ID_Card
      , string Emp_ID_Card_Expired_Date, string Emp_Birth_Date, string Emp_Gender, string Emp_Nationality, string Emp_Religion, string Emp_Marital_Status, string Emp_Children, string Emp_Address1, string Emp_Address2, string Emp_Address3, string Emp_Address4
      , string Emp_District, string Emp_Country, string Emp_City, string Emp_County, string Emp_ZipCode, string Emp_Phone, string Emp_Bank, string Emp_BankBranch, string Emp_BankAccount, string Emp_Emergency_Contact, string Emp_Emergency_Phone, string Emp_EndDate, string Emp_Status
      , string Emp_Position, string Emp_NickName, string Emp_ManagerID, string Emp_ManagerName, int Emp_StartLongevity, string PayFreq, int FirstTripAbroad, string Department, string Main_Company, string Bef_Shift, string Bef_HRProvince, string Bef_HRCountry, string Bef_ZoneID, string Bef_OTLocation, string Bef_EmpGroup, int Bef_EmpScrub, int Bef_EmpSpray, string Bef_EmpCarrate, string Emp_WeddingBenefit, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Draft", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Language", Language);
            cmd.Parameters.AddWithValue("Emp_Prefix", Emp_Prefix);
            cmd.Parameters.AddWithValue("Emp_Profile", Emp_Profile);
            cmd.Parameters.AddWithValue("Emp_FirstName", Emp_FirstName);
            cmd.Parameters.AddWithValue("Emp_LastName", Emp_LastName);
            cmd.Parameters.AddWithValue("Emp_MidderName", Emp_MidderName);
            cmd.Parameters.AddWithValue("Emp_Level", Emp_Level);
            cmd.Parameters.AddWithValue("Emp_JobTitle", Emp_JobTitle);
            cmd.Parameters.AddWithValue("Emp_Location", Emp_Location);
            cmd.Parameters.AddWithValue("Emp_Email", Emp_Email);
            cmd.Parameters.AddWithValue("Emp_Extension", Emp_Extension);
            cmd.Parameters.AddWithValue("Emp_Comp_Phone", Emp_Comp_Phone);
            cmd.Parameters.AddWithValue("Emp_StartDate", Emp_StartDate);
            cmd.Parameters.AddWithValue("Emp_HireDate", Emp_HireDate);
            cmd.Parameters.AddWithValue("Emp_HR_Shift_ID", Emp_HR_Shift_ID);
            cmd.Parameters.AddWithValue("Emp_Type", Emp_Type);
            cmd.Parameters.AddWithValue("Emp_ID_Card", Emp_ID_Card);
            cmd.Parameters.AddWithValue("Emp_ID_Card_Expired_Date", Emp_ID_Card_Expired_Date);
            cmd.Parameters.AddWithValue("Emp_Birth_Date", Emp_Birth_Date);
            cmd.Parameters.AddWithValue("Emp_Gender", Emp_Gender);
            cmd.Parameters.AddWithValue("Emp_Nationality", Emp_Nationality);
            cmd.Parameters.AddWithValue("Emp_Religion", Emp_Religion);
            cmd.Parameters.AddWithValue("Emp_Marital_Status", Emp_Marital_Status);
            cmd.Parameters.AddWithValue("Emp_Children", Emp_Children);
            cmd.Parameters.AddWithValue("Emp_Address1", Emp_Address1);
            cmd.Parameters.AddWithValue("Emp_Address2", Emp_Address2);
            cmd.Parameters.AddWithValue("Emp_Address3", Emp_Address3);
            cmd.Parameters.AddWithValue("Emp_Address4", Emp_Address4);
            cmd.Parameters.AddWithValue("Emp_District", Emp_District);
            cmd.Parameters.AddWithValue("Emp_Country", Emp_Country);
            cmd.Parameters.AddWithValue("Emp_City", Emp_City);
            cmd.Parameters.AddWithValue("Emp_County", Emp_County);
            cmd.Parameters.AddWithValue("Emp_ZipCode", Emp_ZipCode);
            cmd.Parameters.AddWithValue("Emp_Phone", Emp_Phone);
            cmd.Parameters.AddWithValue("Emp_Bank", Emp_Bank);
            cmd.Parameters.AddWithValue("Emp_BankBranch", Emp_BankBranch);
            cmd.Parameters.AddWithValue("Emp_BankAccount", Emp_BankAccount);
            cmd.Parameters.AddWithValue("Emp_Emergency_Contact", Emp_Emergency_Contact);
            cmd.Parameters.AddWithValue("Emp_Emergency_Phone", Emp_Emergency_Phone);
            cmd.Parameters.AddWithValue("Emp_EndDate", Emp_EndDate);
            cmd.Parameters.AddWithValue("Emp_Status", Emp_Status);
            cmd.Parameters.AddWithValue("Emp_Position", Emp_Position);
            cmd.Parameters.AddWithValue("Emp_NickName", Emp_NickName);
            cmd.Parameters.AddWithValue("Emp_ManagerID", Emp_ManagerID);
            cmd.Parameters.AddWithValue("Emp_ManagerName", Emp_ManagerName);
            cmd.Parameters.AddWithValue("Emp_StartLongevity", Emp_StartLongevity);
            cmd.Parameters.AddWithValue("PayFreq", PayFreq);
            cmd.Parameters.AddWithValue("FirstTripAbroad", FirstTripAbroad);
            cmd.Parameters.AddWithValue("Department", Department);
            cmd.Parameters.AddWithValue("Main_Company", Main_Company);
            cmd.Parameters.AddWithValue("Bef_Shift", Bef_Shift);
            cmd.Parameters.AddWithValue("Bef_HRProvince", Bef_HRProvince);
            cmd.Parameters.AddWithValue("Bef_HRCountry", Bef_HRCountry);
            cmd.Parameters.AddWithValue("Bef_ZoneID", Bef_ZoneID);
            cmd.Parameters.AddWithValue("Bef_OTLocation", Bef_OTLocation);
            cmd.Parameters.AddWithValue("Bef_EmpGroup", Bef_EmpGroup);
            cmd.Parameters.AddWithValue("Bef_EmpScrub", Bef_EmpScrub);
            cmd.Parameters.AddWithValue("Bef_EmpSpray", Bef_EmpSpray);
            cmd.Parameters.AddWithValue("Bef_EmpCarrate", Bef_EmpCarrate);
            cmd.Parameters.AddWithValue("Wedding_Benefit", Emp_WeddingBenefit);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("msg", "");
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            string returnData = "";
            using (SqlDataReader rs = cmd.ExecuteReader())
            {
                while (rs.Read())
                {
                    returnData = rs["msg"].ToString();
                }
            }

            con.Close();

            return returnData;
        }

        public List<ArrayList> VW_GetListEmployee(string[] search, string[] fillter, string type)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {

                string sql = "SELECT [Emp_Num],[Language],[Emp_Prefix],[Emp_Profile],[Emp_FirstName],[Emp_LastName],[Emp_MidderName] ,[Emp_Level],[Emp_JobTitle],[Emp_Location],[Emp_Email],[Emp_Extension],[Emp_Comp_Phone]" +
                  ",[Emp_StartDate],[Emp_HireDate],[Emp_HR_Shift_ID],[Emp_Type],[Emp_ID_Card],[Emp_ID_Card_Expired_Date],[Emp_Birth_Date]" +
                  ",[Emp_Gender],[Emp_Nationality],[Emp_Religion],[Emp_Marital_Status],[Emp_Children],[Emp_Address1],[Emp_Address2],[Emp_Address3],[Emp_Address4],[Emp_District],[Emp_Country],[Emp_City],[Emp_County],[Emp_ZipCode],[Emp_Phone],[Emp_Bank],[Emp_BankBranch],[Emp_BankAccount],[Emp_Emergency_Contact],[Emp_Emergency_Phone],[Emp_Status]" +
                  ",[EndDate],[Emp_Position],[Emp_NickName],[Emp_ManagerID],[Emp_ManagerName],[PayFreq],[FirstTripAbroad],[Department],[Main_Company],[Bef_Shift],[Bef_HRProvince],[Bef_HRCountry],[Bef_ZoneID],[Bef_OTLocation],[Bef_EmpGroup],[Bef_EmpScrub]" +
                  ",[Bef_EmpSpray],[Bef_EmpCarrate],[Wedding_Benefit],[DataType] FROM [dbo].[VW_HR_Employee_CurrAndDraft] ";


                for (int i = 0; i < search.Length; i++)
                {
                    if (i == 0 && (search[i] != "" || fillter[i] != ""))
                    {
                        sql += " Where ";
                    }
                    else if (i != 0 && search[i] != "")
                    {
                        sql += " AND ";
                    }
                    if (search[i] != "" && fillter[i] == "")
                    {
                        sql += " ( [Emp_Num] LIKE '" + '%' + search[i] + "%' OR [Emp_FirstName] LIKE '" + '%' + search[i] + "%'  " +
                        " OR [Emp_LastName] LIKE '" + '%' + search[i] + "%') ";
                    }
                    else if (search[i] == "" && fillter[i] == "[DataType]")
                    {
                        if (i > 0)
                        {
                            sql += "OR ";
                        }
                        sql += " ( [Emp_Num] Like '" + search[i] + "%' AND [DataType] ='Draft' )";
                    }
                    else if (search[i] != "" && fillter[i] == "[DataType]")
                    {
                        sql += " ( [Emp_Num] Like '" + search[i] + "%' AND [DataType] ='Draft' )";
                    }
                    else if (search[i] != "" && fillter[i] != "")
                    {
                        sql += " ( " + fillter[i] + " Like '" + search[i] + "%' )";
                    }
                    else if (search[i] == "" && fillter[i] != "")
                    {
                        if (i > 0)
                        {
                            sql += "OR ( " + fillter[i] + " Like '" + search[i] + "%' )";
                        }
                        else
                        {
                            sql += " ( " + fillter[i] + " Like '" + search[i] + "%' )";
                        }

                    }
                }


                if (type == "EN") { sql += " ORDER BY Language ASC, Emp_FirstName DESC "; } else { sql += " ORDER BY Language DESC, Emp_FirstName DESC "; }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetData;
        }

        public string SP_HR_Employee_Tranfer(string Emp_Num, string Emp_Current, int Emp_StartLongevity, string Emp_HireDate)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Tranfer", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Emp_Current", Emp_Current);
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());
            cmd.Parameters.AddWithValue("Emp_StartLongevity", Emp_StartLongevity);
            cmd.Parameters.AddWithValue("Emp_HireDate", Emp_HireDate);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();

            return returnData;

        }

        public string SP_HR_Employee_Attachment(int ID, string File_type, string part, string name, string ref_ID, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Attachment", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("File_type", File_type);
            cmd.Parameters.AddWithValue("part", part);
            cmd.Parameters.AddWithValue("name", name);
            cmd.Parameters.AddWithValue("ref_ID", ref_ID);
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());
            cmd.Parameters.AddWithValue("Action", Action);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();

            return returnData;
        }

        public string SP_IT_Maintain(string Emp_Num, string Emp_Email, string Emp_Extension, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_IT_Maintain", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Emp_Email", Emp_Email);
            cmd.Parameters.AddWithValue("Emp_Extension", Emp_Extension);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();

            return returnData;
        }

        public string SP_Permission(int ID, string username, string Per_Page, string viewer, string editor, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_Permission", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("username", username);
            cmd.Parameters.AddWithValue("Per_Page", Per_Page);
            cmd.Parameters.AddWithValue("viewer", viewer);
            cmd.Parameters.AddWithValue("editor", editor);
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());
            cmd.Parameters.AddWithValue("Action", Action);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();

            return returnData;
        }

        public List<ArrayList> GetPermission(string user, string page)
        {
            List<ArrayList> GetPermission = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[username],[page],[viewer],[editor] FROM [dbo].[TB_Permission]";
                if (user != "" && page != "")
                {
                    sql += "WHERE [username] ='" + user + "' AND [page] = '" + page + "'";
                }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPermission.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPermission;
        }

        public List<ArrayList> GetUsername(string search)
        {
            List<ArrayList> GetPermission = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [Emp_Num], [Username] from  [dbo].[TB_HR_Employee_Authen]  where [Permission_Type] = 'UserAD'";
                if (search != "")
                {
                    sql += " AND ([Username] like '" + search + "%' OR [Emp_Num] like '" + search + "%')";
                }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPermission.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPermission;
        }

        public List<ArrayList> GetUsernamePE(string search)
        {
            List<ArrayList> GetPermission = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [res_id],[Fullname],[costcenter],[UserAD] FROM [dbo].[VW_EmployeesSerch] ";
                if (search != "")
                {
                    sql += "  WHERE  ([res_id] like '" + search + "%' OR [Fullname] like '" + search + "%' OR [UserAD] like '" + search + "%')";
                }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPermission.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPermission;
        }
        public string SP_Zone(int ID, string Emp_zone, string Country, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_Zone", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Emp_zone", Emp_zone);
            cmd.Parameters.AddWithValue("Country", Country);
            cmd.Parameters.AddWithValue("txtEmpDefult", GetUser());
            cmd.Parameters.AddWithValue("Action", Action);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();

            return returnData;
        }
        public List<ArrayList> GetTB_Zone(string value)
        {
            List<ArrayList> getHrshiftID = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [ID],[Emp_zone] ,TBZ.Country ,HRZ.[zone_description],CM.[Uf_CountryTH] " +
                    "FROM[dbo].[TB_Zone] TBZ " +
                    "LEFT JOIN[ERP_PKS_App].[dbo].[PPCC_HR_Zone] HRZ " +
                    "ON TBZ.[Emp_zone] = HRZ.[zone_id] " +
                    "LEFT JOIN[ERP_PKS_App].[dbo].[country_mst] CM " +
                    "ON TBZ.[country] = CM.[iso_country_code]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            getHrshiftID.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return getHrshiftID;
        }
        public List<ArrayList> GetTB_Domestic()
        {
            List<ArrayList> getHrshiftID = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "Select [ID],DO.[Zone_ID],[Allowance],[ActualBenefit],[Accomodation],[Currency],[EmpLevel],[EffectiveData],[Actualfood],[food]," +
                    "CT.[country] as Country_desc " +
                    "FROM [HRPortal].[dbo].[TB_Domestic] DO " +
                    "LEFT join [ERP_PKS_app].[dbo].[country_mst] CT " +
                    "ON DO.[Zone_ID] = CT.[iso_country_code] ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            getHrshiftID.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return getHrshiftID;
        }

        public List<ArrayList> GetLeaveMaster(string search)
        {
            List<ArrayList> getHrshiftID = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                //string sql = "SELECT [Leave_ID],[Leave_Group],[Leave_Reason] ,[Sex] ,[Effective_Start],[isLimited],[availableDay],[availablePayDay],[Leave_Condition],[Leave_Minimum],[Longevity_Year],[Reset_Date],[Reset_Date2] ,[Remind] FROM [dbo].[TB_Leave_Type]";

                string sql = "SELECT [Leave_ID],LT.[Leave_Group],[Leave_Reason] ,[Sex] ,[Effective_Start],[isLimitedDay],[availableDay],[isLimitedPayDay],[availablePayDay],[Leave_Condition],[Leave_Minimum],[Longevity_Year],[Reset_Date],[Reset_Date2] ,[Remind],LG.[Description] FROM [dbo].[TB_Leave_Type] LT" +
                    " left join [dbo].[TB_Leave_Group] LG on LT.[Leave_Group] = LG.[Leave_Group] ";
                if (search != "")
                {
                    sql += " WHERE [Leave_ID] ='" + search + "'";
                }
                sql += " order by [Leave_Group]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            getHrshiftID.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return getHrshiftID;
        }

        public List<ArrayList> GetleaveGroup(string search)
        {
            List<ArrayList> GetleaveGroup = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {

                string sql = "SELECT [Leave_Group],[Description] FROM [dbo].[TB_Leave_Group] ";
                if (search != "")
                {
                    sql += "WHERE [Leave_Group] = '" + search + "'";
                }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                        http://localhost:56996/Connected Services/Syteline/
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetleaveGroup.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetleaveGroup;
        }
        public string SP_Leave_Type_Maintain(int Leave_ID, string Leave_Group, string Leave_Reason, string Sex, int isLimitedDay, int availableDay
           , int isLimitedPayDay, int availablePayDay, string Leave_Condition, int Leave_Minimum, string Effective_Start, int Longevity_Year,
           int reqpaper, string Reset_Date, string Reset_Date2, string Remind, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_Leave_Type_Maintain", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Leave_ID", Leave_ID);
            cmd.Parameters.AddWithValue("Leave_Group", Leave_Group);
            cmd.Parameters.AddWithValue("Leave_Reason", Leave_Reason);
            cmd.Parameters.AddWithValue("Sex", Sex);
            cmd.Parameters.AddWithValue("isLimitedDay", isLimitedDay);
            cmd.Parameters.AddWithValue("availableDay", availableDay);
            cmd.Parameters.AddWithValue("isLimitedPayDay", isLimitedPayDay);
            cmd.Parameters.AddWithValue("availablePayDay", availablePayDay);
            cmd.Parameters.AddWithValue("Leave_Condition", Leave_Condition);
            cmd.Parameters.AddWithValue("Leave_Minimum", Leave_Minimum);
            cmd.Parameters.AddWithValue("Effective_Start", Effective_Start);
            cmd.Parameters.AddWithValue("Longevity_Year", Longevity_Year);
            cmd.Parameters.AddWithValue("reqpaper", reqpaper);
            cmd.Parameters.AddWithValue("Reset_Date", Reset_Date);
            cmd.Parameters.AddWithValue("Reset_Date2", Reset_Date2);
            cmd.Parameters.AddWithValue("Remind", Remind);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            string returnData = "";
            using (SqlDataReader rs = cmd.ExecuteReader())
            {
                while (rs.Read())
                {
                    returnData = rs["msg"].ToString();
                }
            }

            con.Close();

            return returnData;
        }

        public List<ArrayList> GetYearLeaveLimit(string Emp_Num)
        {
            List<ArrayList> year = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT DISTINCT YEAR([Create_Date]) as 'Create_Date'  From [dbo].[TB_Leave_Limit] Where Emp_Num = '" + Emp_Num + "' ORDER BY [Create_Date] DESC ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            year.Add(detail);
                        }
                    }
                }
            }
            return year;
        }

        public List<ArrayList> GetTBLeaveLimit(string Emp_Num, string Year)
        {
            List<ArrayList> Company = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT  [ID],[Leave_ID],[Available_Date],[Accommodation_Date],[Accommodation_Hour] FROM [dbo].[TB_Leave_Limit] WHERE [Emp_Num] ='" + Emp_Num + "'AND [Create_Date] like '" + Year + "%'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Company.Add(detail);
                        }
                    }
                }
            }
            return Company;
        }
        public string SPLeaveLimit(int ID, int Accommodation_Date, int Accommodation_Hour, string Action)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_Leave_Limit", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Accommodation_Date", Accommodation_Date);
            cmd.Parameters.AddWithValue("Accommodation_Hour", Accommodation_Hour);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            string returnData = "";
            using (SqlDataReader rs = cmd.ExecuteReader())
            {
                while (rs.Read())
                {
                    returnData = rs["msg"].ToString();
                }
            }

            con.Close();

            return returnData;
        }
        public List<ArrayList> Get_TBLeaveAbsence(string Emp_Num, string Year)
        {
            List<ArrayList> LeaveAbsence = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [ID],[Accommodation_Date],[Accommodation_Hour],[Effect_Date] FROM [TB_Leave_Absence] WHERE [Emp_Num] ='" + Emp_Num + "'AND [Effect_Date] like '" + Year + "%' ORDER BY [ID] DESC";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            LeaveAbsence.Add(detail);
                        }
                    }
                }
            }
            return LeaveAbsence;
        }

        public List<ArrayList> GetLeaveTransaction(string empNum, string leaveID, string ID)
        {
            List<ArrayList> LeaveTrans = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [StartDate],[EndDate],[UsedDays],[UsedHour],TR.[ID],TR.[Emp_Num], " +
                   "[Ref_LeaveType_ID],[Description], WF1.[Status],LT.[Leave_Reason],TR.[Type] " +
                   "FROM[TB_LeaveTransaction] TR " +
                   "LEFT JOIN[TB_Workflow] WF1  " +
                   "ON WF1.[Leave_ID] = TR.[ID] " +
                   "LEFT JOIN [TB_Leave_Limit] LI " +
                   "ON LI.[ID] = TR.[Ref_LeaveType_ID] " +
                   "LEFT JOIN [TB_Leave_Type] LT " +
                   "ON LT.[Leave_ID] = LI.[Leave_ID] " +
                   "INNER JOIN " +
                   "(SELECT[Leave_ID], MAX([Trans_ID]) AS 'Trans_ID' " +
                   "FROM[TB_Workflow] GROUP BY[Leave_ID]) WF2 " +
                   "ON WF1.[Leave_ID] = WF2.[Leave_ID] AND WF1.[Trans_ID] = WF2.[Trans_ID] " +
                   "WHERE TR.[Emp_Num] like '" + empNum + "%' and[Ref_LeaveType_ID] like '" + leaveID + "%' ";
                if (ID != "")
                {
                    sql += "And TR.[ID] = '" + ID + "'";
                }

                sql += "ORDER BY TR.[ID]  DESC  ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            LeaveTrans.Add(detail);
                        }
                    }
                }
            }
            return LeaveTrans;
        }

        public string SPLeaveAbsence(int ID, string Emp_Num, int Accommodation_Date, int Accommodation_Hour, string Effect_Date, string Action)
        {

            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_Leave_Absence", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Emp_Num", Emp_Num);
            cmd.Parameters.AddWithValue("Accommodation_Date", Accommodation_Date);
            cmd.Parameters.AddWithValue("Accommodation_Hour", Accommodation_Hour);
            cmd.Parameters.AddWithValue("Effect_Date", Effect_Date);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("msg", "");
            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();
            return returnData;
        }
        public List<ArrayList> SPLeaveTotalAbsence(string Emp_Num, string Year)
        {
            List<ArrayList> SPLeaveTotalAbsence = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "EXEC[SP_Leave_TotalAbsence] '" + Emp_Num + "', '" + Year + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            SPLeaveTotalAbsence.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return SPLeaveTotalAbsence;
        }

        public List<ArrayList> GetLeaveType(string Emp_Num)
        {
            List<ArrayList> GetLeaveType = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT ID , LT.Leave_Reason , LT.Remind  " +
                    "FROM [TB_Leave_Limit] LM " +
                    "LEFT JOIN [TB_Leave_Type] LT " +
                    "ON LM.[Leave_ID] = LT.Leave_ID " +
                    "WHERE Emp_Num = " + Emp_Num + " AND " +
                    "Create_Date like Convert(nvarchar(10),( YEAR(GETDATE())))+'%'  ";


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetLeaveType.Add(detail);
                        }
                    }
                }
            }
            return GetLeaveType;
        }

        public List<ArrayList> GetLeaveTotalUsed(string Emp_Num, int LeaveType)
        {
            List<ArrayList> TotalUsed = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "  SELECT [Available_Date] ,'0' as [Available_house],[Accommodation_Date],[Accommodation_Hour] " +
                    "FROM [TB_Leave_Limit] WHERE [Emp_Num] = '" + Emp_Num + "' AND " +
                    "Create_Date like Convert(nvarchar(10),( YEAR(GETDATE())))+'%' AND " +
                    "[ID] = " + LeaveType + " ";


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            TotalUsed.Add(detail);
                        }
                    }
                }
            }
            return TotalUsed;
        }

        public List<ArrayList> GetHistory(int Leave_ID, string Language)
        {
            List<ArrayList> GetHistory = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [Trans_ID],[Leave_ID],em.[Emp_FirstName]+' '+em.[Emp_LastName] as name,[Action],[Status],[Start_date],[End_date],[WF_Status],[Comment]" +
                    "FROM [dbo].[TB_Workflow] wf left join[TB_HR_Employee] em on wf.[Destination] = em.[Emp_Num]" +
                    "where[Leave_ID] = '" + Leave_ID + "' and [Language] = '" + Language + "'" +
                    "Order by [Trans_ID] desc";


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetHistory.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetHistory;
        }

        public DataTable GetExportCustomerReportv2(string Paramiter)
        {
            string sql = "SELECT * FROM [HRPortal].[dbo].[VW_Leave_Online_Report]";
            if (Paramiter != "")
            {
                sql += " WHERE  " + Paramiter;

            }
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }

        public List<String[]> GetPaymentID(string site_ref)
        {
            List<String[]> GetPaymentID = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT [pay_type_num],[pay_type_name] FROM [dbo].[ppcc_esy_vch_pay_type]" +
                    "ORDER BY[pay_type_num]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getData = new String[2];
                            getData[0] = reader[0].ToString().Trim();
                            getData[1] = reader[1].ToString().Trim();
                            GetPaymentID.Add(getData);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPaymentID;
        }

        public List<String[]> GetERPCostcenter(string site_ref, string search)
        {
            List<String[]> GetERPCostcenter = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT 'All' as [dept], 'All' as [description] UNION ALL(" +
                    "SELECT[dept], [description] FROM [dbo].[dept_mst]" +
                    "WHERE [dept] like '%" + search + "%' OR [description] like '%" + search + "%') " +
                    "ORDER BY[dept]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getData = new String[2];
                            getData[0] = reader[0].ToString().Trim();
                            getData[1] = reader[1].ToString().Trim();
                            GetERPCostcenter.Add(getData);
                        }
                    }
                    connection.Close();
                }
            }
            return GetERPCostcenter;
        }

        public List<String[]> GetERPLevel(string site_ref)
        {
            List<String[]> GetERPLevel = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string sql = "SELECT [level] FROM [dbo].[PPCC_HRLevel] ORDER BY[level]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getData = new String[1];
                            getData[0] = reader[0].ToString().Trim();
                            GetERPLevel.Add(getData);
                        }
                    }
                    connection.Close();
                }
            }
            return GetERPLevel;
        }

        public List<String[]> GetEemp(string site_ref, string search)
        {
            List<String[]> GetEemp = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [Emp_Num],[Emp_FirstName] + ' ' + [Emp_LastName] as 'EmpName',[Department] FROM[dbo].[TB_HR_Employee]" +
                    "WHERE[Language] = 'TH' AND ([Emp_Num] like '%"+ search + "%' OR [Emp_FirstName] like '%"+ search + "%' OR [Emp_LastName] like '%" + search + "%' OR [Department] like '%" + search + "%' )" +
                    "ORDER BY[Emp_Num]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getData = new String[3];
                            getData[0] = reader[0].ToString().Trim();
                            getData[1] = reader[1].ToString().Trim();
                            getData[2] = reader[2].ToString().Trim();
                            GetEemp.Add(getData);
                        }
                    }
                    connection.Close();
                }
            }
            return GetEemp;
        }

        public List<String[]> GetEERegular(int ID, string paymentID, string payTypeName, string costcenter, string Ref, string site_ref)
        {
            List<String[]> GetEERegular = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [ID], [Payment_ID], [pay_type_name], [CostCenter], [Ref],[Level],[Emp_name],[Value],[Start_Date],[End_Date],[Type] FROM VW_HR_ERegulars_Ref " +
                    "WHERE [site_ref] = '" + site_ref + "' AND [Payment_ID] = '" + paymentID + "' AND ([CostCenter] like '%" + Ref + "%' OR[pay_type_name] like '%" + Ref + "%' OR[Ref] like '%" + Ref + "%')";

                if (ID != 0)
                {
                    sql += " AND ID = '"+ ID +"' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getData = new String[11];
                            getData[0] = reader[0].ToString().Trim();
                            getData[1] = reader[1].ToString().Trim();
                            getData[2] = reader[2].ToString().Trim();
                            getData[3] = reader[3].ToString().Trim();
                            getData[4] = reader[4].ToString().Trim();
                            getData[5] = reader[5].ToString().Trim();
                            getData[6] = reader[6].ToString().Trim();
                            getData[7] = reader[7].ToString().Trim();
                            getData[8] = reader[8].ToString().Trim();
                            getData[9] = reader[9].ToString().Trim();
                            getData[10] = reader[10].ToString().Trim();
                            GetEERegular.Add(getData);
                        }
                    }
                    connection.Close();
                }
            }
            return GetEERegular;
        }
        public string SP_HR_ERegulars(int ID, string Payment_ID, string CostCenter, string Level_OR_EmpNum, float Value, string Start_Date,
            string End_Date, string Type, string site_ref)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_ERegulars", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("Payment_ID", Payment_ID);
            cmd.Parameters.AddWithValue("CostCenter", CostCenter);
            cmd.Parameters.AddWithValue("Level", Level_OR_EmpNum);
            cmd.Parameters.AddWithValue("Value", Value);
            cmd.Parameters.AddWithValue("Start_Date", Start_Date);
            cmd.Parameters.AddWithValue("End_Date", End_Date);
            cmd.Parameters.AddWithValue("Type", Type);
            cmd.Parameters.AddWithValue("CreateBy", GetUser());
            cmd.Parameters.AddWithValue("site_ref", site_ref);
            cmd.Parameters.AddWithValue("Msg", "");

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
            }

            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_Charge(string CH_Code, string Detail,string Status)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Charge", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("CH_Code", CH_Code);
            cmd.Parameters.AddWithValue("Detail", Detail);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
            }

            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_Charge_Detail(int ID, string CH_Code, string CH_Desc, string CH_Value, string EffectDate)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Charge_Detail", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("CH_Code", CH_Code);
            cmd.Parameters.AddWithValue("CH_Desc", CH_Desc);
            cmd.Parameters.AddWithValue("CH_Value", CH_Value);
            cmd.Parameters.AddWithValue("EffectDate", EffectDate);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());


            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
            }

            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_Charge_Group(string Group_Code, string Group_Detail, string Group_Status, string Status)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_Group", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Group_Code", Group_Code);
            cmd.Parameters.AddWithValue("Group_Detail", Group_Detail);
            cmd.Parameters.AddWithValue("Group_Status", Group_Status);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());


            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
            }

            con.Close();
            return returnData;
        }
        public string SP_PA_TAG_ServiceCenterofRepairing(string ID, string NameStatus, string Status)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_PA_TAG_ServiceCenterofRepairing", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("ID", ID);
            cmd.Parameters.AddWithValue("NameStatus", NameStatus);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());


            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["Msg"].ToString();
            }

            con.Close();
            return returnData;
        }

        public DataTable GetExportPayment(string Paramiter)
        {
            string sql = "SELECT [Code],[Name],[Type],[CostCenter],[EmpNum/Level],[Value],[Start_Date],[End_Date] " +
                    "FROM [HRPortal].[dbo].[VW_HR_ERegulars_Export]";
            if (Paramiter != "")
            {
                sql += Paramiter;
            }
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public List<String[]> GetExportPreview(string paymentID,string costExport,string costToExport,string levelExport,string empExport,string effDateExport,string effDateToExport,string site_ref)
        {
            List<String[]> GetERPLevel = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string condition = "";
                string sql = "SELECT [Code],[Name],[Type],[CostCenter],[EmpNum/Level],[Value],[Start_Date],[End_Date] " +
                    "FROM [HRPortal].[dbo].[VW_HR_ERegulars_Export]" +
                    "WHERE ";
                if (paymentID!="")
                {
                    sql += "[Code] = '" + paymentID + "'";
                    condition = " and ";
                }
                if (costExport != "")
                {
                    sql += condition+"([CostCenter] between '" + costExport + "' and '" + costToExport + "')";
                    condition = " and ";
                }
                if (levelExport != "" || empExport != "")
                {
                    sql += condition+"([EmpNum/Level] = '" + levelExport + "' or [EmpNum/Level] = '" + empExport + "')";
                    condition = " and ";
                }
                if (effDateExport != "")
                {
                    sql += condition+ "([Start_Date] between CONVERT(datetime,'" + DateTime.Parse(effDateExport) + "',103) and CONVERT(datetime,'" + DateTime.Parse(effDateToExport) + "',103))";
                    condition = " and ";
                }
                sql += condition+"[site_ref] ='" + site_ref + "' ";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getData = new String[8];
                            getData[0] = reader[0].ToString().Trim();
                            getData[1] = reader[1].ToString().Trim();
                            getData[2] = reader[2].ToString().Trim();
                            getData[3] = reader[3].ToString().Trim();
                            getData[4] = reader[4].ToString().Trim();
                            getData[5] = reader[5].ToString().Trim();
                            getData[6] = reader[6].ToString().Trim();
                            getData[7] = reader[7].ToString().Trim();
                            GetERPLevel.Add(getData);
                        }
                    }
                    connection.Close();
                }
            }
            return GetERPLevel;
        }

        public List<String[]> GetExportPreviewSearch(string empExport, string costExport, string costToExport, string site_ref)
        {
            List<String[]> GetExport = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(SeletSite_ref(site_ref)))
            {
                string condition = "";
                string sql = "SELECT [Code],[Name],[Emp_Num],[EmpName],[Department],[Emp_Level],[Value],[Start_Date],[End_Date] " +
                    "FROM [HRPortal].[dbo].[VW_HR_ERegulars_Benefit_ByEmployee]" +
                    "WHERE ";
                if (empExport != "")
                {
                    sql += "[Emp_Num] = '" + empExport + "'";
                    condition = " and ";
                }
                if (costExport != "")
                {
                    sql += condition + "([CostCenter] between '" + costExport + "' and '" + costToExport + "')";
                    condition = " and ";
                }
                sql += condition + "[site_ref] ='" + site_ref + "' ";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] getData = new String[9];
                            getData[0] = reader[0].ToString().Trim();
                            getData[1] = reader[1].ToString().Trim();
                            getData[2] = reader[2].ToString().Trim();
                            getData[3] = reader[3].ToString().Trim();
                            getData[4] = reader[4].ToString().Trim();
                            getData[5] = reader[5].ToString().Trim();
                            getData[6] = reader[6].ToString().Trim();
                            getData[7] = reader[7].ToString().Trim();
                            getData[8] = reader[8].ToString().Trim();
                            GetExport.Add(getData);
                        }
                    }
                    connection.Close();
                }
            }
            return GetExport;
        }

        public DataTable GetExportBenefit(string Paramiter)
        {
            string sql = "SELECT [Code],[Name],[Emp_Num],[EmpName],[Department],[Emp_Level],[Value],[Start_Date],[End_Date] " +
                    "FROM [HRPortal].[dbo].[VW_HR_ERegulars_Benefit_ByEmployee]";
            if (Paramiter != "")
            {
                sql += Paramiter;
            }
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }

        public string clearOTData(string empnum)
        {
            SqlConnection con = new SqlConnection(conPKS);
            SqlCommand cmd = new SqlCommand("SP_OTMobile_Temp_ClearRawdata", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("user", empnum);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();

            return returnData;

        }

        public string importData(string empnum)
        {
            SqlConnection con = new SqlConnection(conPKS);
            SqlCommand cmd = new SqlCommand("SP_OTMobile_Temp_Import", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("user", empnum);

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();
            string returnData = "";
            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();

            return returnData;

        }

        public List<ArrayList> GetOTDetails(string empnum)
        {
            List<ArrayList> GetOT = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " SELECT [emp_num],[workingdate],[time_normal],[time_OT01],[time_OT15],[time_OT20],[time_OT30] FROM [dbo].[VW_OTMobile_Temp_CheckExits_Detail] ";
                sql += " WHERE [CreateBy] = '" + empnum + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetOT.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetOT;
        }

        public List<ArrayList> GetOT(string empnum)
        {
            List<ArrayList> GetOT = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conPKS))
            {
                string sql = " SELECT [TotQtyPass],[TotQtyFail] FROM [dbo].[VW_OTMobile_Temp_CheckExits] ";
                sql += " WHERE [CreateBy] = '" + empnum + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetOT.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetOT;
        }

        public List<ArrayList> GETPA_TAG_Charge()
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [CH_Code],[Detail] FROM [dbo].[TB_PA_TAG_Charge] ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> TB_PA_TAG_MASTER(string PATAG)
        {
            List<ArrayList> PA_TAG_MASTER = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [PA_TAG_Code],[PA_TAG_Type_Car],[PA_TAG_Band],[PA_TAG_Model]," +
                    "convert(nvarchar, [PA_TAG_Start_DATE], 103) as 'PA_TAG_Start_DATE'," +
                    "convert(nvarchar, [PA_TAG_End_DATE], 103) as 'PA_TAG_End_DATE'," +
                    "[PA_TAG_CarID]," +
                    "cast([PA_TAG_Price] as numeric(36,2)) as 'PA_TAG_Price'" +
                    ",[PA_TAG_Name_Sell],[PA_TAG_IMAGE],[PA_TAG_SN],[PA_TAG_DETAIL],[PA_TAG_REMARK],[PA_TAG_Company_Location],[PA_TAG_Status],[PA_TAG_Car_Status]" +
                    ",[PA_TAG_Contact_ID],[PA_TAG_TAX],[PA_TAG_TYPE_TAX],[PA_TAG_CHARGE],[PA_TAG_MAC],[PA_TAG_ENG],[PA_TAG_Asset_Type],[PA_TAG_Asset_Code],[FleetCardNo]" +
                    ",[EasypassNo],[CREATE_DATE],[CREATE_By],[UPDATE_DATE],[UPDATE_By] FROM[HRPortal].[dbo].[VW_PA_TAG_MASTER]";
                if (PATAG != "")
                {
                    sql += " WHERE [PA_TAG_Code] = '" + PATAG + "' ";
                }
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            PA_TAG_MASTER.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return PA_TAG_MASTER;
        }
        public List<ArrayList> TB_PA_TAG_MASTER_Search(string SearchPATAG)
        {
            List<ArrayList> PA_TAG_MASTER = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [PA_TAG_Code],[PA_TAG_Type_Car],[PA_TAG_Band],[PA_TAG_Model]," +
                    "convert(nvarchar, [PA_TAG_Start_DATE], 103) as 'PA_TAG_Start_DATE'," +
                    "convert(nvarchar, [PA_TAG_End_DATE], 103) as 'PA_TAG_End_DATE'," +
                    "[PA_TAG_CarID],[PA_TAG_Price]" +
                    ",[PA_TAG_Name_Sell],[PA_TAG_IMAGE],[PA_TAG_SN],[PA_TAG_DETAIL],[PA_TAG_REMARK],[PA_TAG_Company_Location],[PA_TAG_Status],[PA_TAG_Car_Status]" +
                    ",[PA_TAG_Contact_ID],[PA_TAG_TAX],[PA_TAG_CHARGE],[PA_TAG_MAC],[PA_TAG_ENG],[PA_TAG_Asset_Type],[PA_TAG_Asset_Code],[FleetCardNo]" +
                    ",[EasypassNo],[CREATE_DATE],[CREATE_By],[UPDATE_DATE],[UPDATE_By] FROM[HRPortal].[dbo].[VW_PA_TAG_MASTER] ";

                
                if (SearchPATAG != "" )
                {
                    sql += " WHERE [PA_TAG_Code] like '%" + SearchPATAG + "%' OR PA_TAG_CarID like  '%"+ SearchPATAG + "%' OR PA_TAG_DETAIL like '%" + SearchPATAG + "%' ";
                    
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            PA_TAG_MASTER.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return PA_TAG_MASTER;
        }
        public List<ArrayList> GETPA_TAG_Charge_Detail(string CH_CODE)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[CH_Desc], cast([CH_Value] as numeric(36,2)) as 'CH_Value',convert(nvarchar, [EffectDate], 103) as 'EffectDate',[CH_Code] FROM [dbo].[TB_PA_TAG_Charge_Detail] ";
                sql += " WHERE [CH_Code] = '"+ CH_CODE + "' ORDER BY [ID]";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> GETPA_TAX(string PATAG)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[PA_TAG_Code],[PA_TAX_Detail]," +
                    "convert(nvarchar, [PA_TAX_Start_Date], 103) as 'PA_TAX_Start_Date' ," +
                    "convert(nvarchar, [PA_TAX_End_Date], 103) as 'PA_TAX_End_Date' ," +
                    "cast([PA_TAX_Price] as numeric(36,2)) as 'PA_TAX_Price' ," +
                    "[CreateDate],[CreateBy],[UpdateDate],[UpdateBy] FROM [dbo].[TB_PA_TAG_Tax]";
                sql += " WHERE  [PA_TAG_Code] = '"+ PATAG + "' ORDER BY [ID] DESC ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> GET_PATAG_Insurance(string PATAG)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[PA_TAG_Code],[PA_INS_Detail],[PA_INS_Name_Insurance],[PA_INS_Serial_Insurance]" +
                    ",convert(nvarchar, [PA_INS_Start_Date_Insurance], 103) as 'PA_INS_Start_Date_Insurance'" +
                    ",convert(nvarchar, [PA_INS_End_Date_Insurance], 103) as 'PA_INS_End_Date_Insurance'" +
                    ",cast([PA_INS_Price_Insurance] as numeric(36,2)) as 'PA_INS_Price_Insurance' " +
                    ",convert(nvarchar, [PA_INS_Start_Date_Act], 103) as 'PA_INS_Start_Date_Act'" +
                    ",convert(nvarchar, [PA_INS_End_Date_Act], 103) as 'PA_INS_End_Date_Act'" +
                    ",cast([PA_INS_Price_Act] as numeric(36,2)) as 'PA_INS_Price_Act' " +
                    ",[CreateDate],[CreateBy],[UpdateDate],[UpdateBy] FROM [dbo].[TB_PA_TAG_Insurance]" ;
                sql += " WHERE  [PA_TAG_Code] = '"+ PATAG + "' ORDER BY [ID] DESC ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> GET_PATAG_MA(string PATAG)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT  [ID],[PA_TAG_Code],[K2ID],[Repair_Type],[PA_MA_DETAIL], [PA_MA_DATE]" +
                     //",convert(nvarchar, [PA_MA_DATE], 103) as 'PA_MA_DATE'" +
                    ",[PA_MA_SUPPLIER],[PA_MA_PRICE],[PA_MA_MILE],[CreateDate],[CreateBy],[site_ref],[Flow_ID],[PA_MA_SUPPLIER_ID] FROM [dbo].[VW_PA_TAG_MA]";
                sql += " WHERE  [PA_TAG_Code] = '"+ PATAG + "'  ORDER BY [K2ID] DESC,[PA_MA_DATE] DESC";


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }

        public List<ArrayList> GETPA_TAX_IMAGE(string TAX_ID)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID],[Tax_ID],[Path] FROM [dbo].[TB_PA_TAG_Tax_Img]";
                sql += " WHERE  [TAX_ID] = '" + TAX_ID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> GETPA_INS_IMAGE(string Insurance_ID)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [ID] ,[Insurance_ID] ,[Path] FROM [dbo].[TB_PA_TAG_Insurance_Img]";
                sql += " WHERE  [Insurance_ID] = '" + Insurance_ID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }public List<ArrayList> GETPA_MA_IMAGE(string MA_ID)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT  [ID],[MA_ID],[Path],[CreateDate],[CreateBy]  FROM [dbo].[TB_PA_TAG_MA_Img]";
                sql += " WHERE  [MA_ID] = '" + MA_ID + "'";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> GETPA_TAG_Charge_Group()
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT [Group_Code],[Group_Detail],[Group_Status] FROM [dbo].[TB_PA_TAG_Group]  ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
    public List<ArrayList> GETPATAG_PE(string PATAG)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [ID],[PA_TAG_Code],[PA_PE_User],[Emp_Num],[Fullname],[CostCenter],[JobTitle],[Level]" +
                    ",CONVERT(nvarchar(10),CAST([PA_PE_Date] as DATE),103) as 'PE_Date'" +
                    ",[PA_PE_Detail] FROM [dbo].[VW_PA_TAG_PE]" +
                    " WHERE [PA_TAG_Code] = '"+ PATAG + "' ORDER BY [PA_PE_Date] DESC ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> GETPA_TAG_ServiceCenterofRepairing()
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [ID],[NameStatus] FROM [HRPortal].[dbo].[TB_PA_TAG_ServiceCenterofRepairing] ORDER BY [ID] DESC ";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }

        public List<List<ArrayList>> GetPreviewExcel(string from ,string snsStatus)
        {
            DataTable DTData = new DataTable();
            SqlConnection Con = new SqlConnection(conHRPortal);
            SqlCommand Com = new SqlCommand();
 
            string sql = "Select TOP(200) * from  "+ from ;
                if (snsStatus != "")
                {
                    sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
                }
                if( from == "VW_PA_TAG_Report_Charge")
                {
                    sql += "  order by [PA_TAG_Company_Location],[PA_TAG_Status]";
                }
            try
            {
                Con.Open();
                Com.Connection = Con;
                Com.CommandType = CommandType.Text;
                Com.CommandText = sql;
                Com.CommandTimeout = 0;
                DTData.Load(Com.ExecuteReader());
            }
            catch (SqlException ex)
            {
                Con.Close();
                Com.Dispose();
            }
            Con.Close();
            Com.Dispose();
            //Query ข้อมูล
            List<List<ArrayList>> ListTotal = new List<List<ArrayList>>();
            List<ArrayList> ListColumn = new List<ArrayList>();
            List<ArrayList> ListData = new List<ArrayList>();
            //สร้าง Columnหัวตาราง
            //สร้าง ข้อมูลข้างใน
 
            if (DTData.Rows.Count > 0)
            {
                foreach (DataColumn row in DTData.Columns)
                {
                    ArrayList detail = new ArrayList();
                    detail.Add(row.ColumnName.ToString());
                    ListColumn.Add(detail);
                }
 
                foreach (DataRow row in DTData.Rows)
                {
                    ArrayList detail = new ArrayList();
                    for (int i = 0; i < row.ItemArray.Length; i++) { detail.Add(row[i].ToString()); }
                    ListData.Add(detail);
                }
 
                ListTotal.Add(ListColumn);
                ListTotal.Add(ListData);
            }
            return ListTotal;
        }


        public List<ArrayList> GetPreviewExcel_Charge(string snsStatus)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT TOP(200) * FROM [dbo].[VW_PA_TAG_Report_Charge]";
                if (snsStatus != "")
                {
                    sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
                }
                sql += "  order by [PA_TAG_Company_Location],[PA_TAG_Status]";
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> GetPreviewExcel_Tax(string snsStatus)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT TOP(200) * FROM [dbo].[VW_PA_TAG_Report_Tax]";
                if (snsStatus != "")
                {
                    sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }

        public List<ArrayList> GetPreviewExcel_Insurance(string snsStatus)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT TOP(200) * FROM [dbo].[VW_PA_TAG_Report_Insurance]";
                if (snsStatus != "")
                {
                    sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<ArrayList> GetPreviewExcel_MA(string snsStatus)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT TOP(200) * FROM [dbo].[VW_PA_TAG_Report_MA] ";
                if (snsStatus != "")
                {
                    sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
                }

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }

        public DataTable GetExportExcel_Charge(string snsStatus)
        {
            string sql = "SELECT * FROM [dbo].[VW_PA_TAG_Report_Charge]";
            if (snsStatus != "")
            {
                sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
            }
            sql += "  order by [PA_TAG_Company_Location],[PA_TAG_Status]";
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public DataTable GetExportExcel_Tax(string snsStatus)
        {
            string sql = "SELECT * FROM [dbo].[VW_PA_TAG_Report_Tax]";
            if (snsStatus != "")
            {
                sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
            }

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public DataTable GetExportExcel_Insurance(string snsStatus)
        {
            string sql = "SELECT * FROM [dbo].[VW_PA_TAG_Report_Insurance]";
            if (snsStatus != "")
            {
                sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
            }

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        public DataTable GetExportExcel_MA(string snsStatus)
        {
            string sql = "SELECT * FROM [dbo].[VW_PA_TAG_Report_MA] ";
            if(snsStatus != "")
            {
                sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
            }
                

            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();

            return DT;
        }
        
       
        public List<ArrayList> GetHeaderTable(string from, string snsStatus)
        {
            List<ArrayList> GetPA = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT  Column_Name FROM INFORMATION_SCHEMA.COLUMNS ";

                if (from != "")
                {
                    sql += "  WHERE Table_Name = '" + from + "'";
                }
                if (snsStatus != "")
                {
                    sql += "  WHERE [PA_TAG_Status] = '" + snsStatus + "'";
                }


                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetPA.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return GetPA;
        }
        public List<String[]> getAttactmentFile(string WorkflowType, string WorkflowID)
        {
            List<String[]> ListAttactmentFile = new List<String[]>();
            using (SqlConnection connection = new SqlConnection(con))
            {
                string sql = "SELECT [ID],[Site_ref],[ProcInsID],[WorkflowType],[WorkflowID],[Attachment],[CreateBy],[CreateDate] FROM [K2].[dbo].[TB_Attachments] " +
                    "WHERE [WorkflowID] = '" + WorkflowID + "' and [WorkflowID] <> '' AND  [WorkflowType] = '" + WorkflowType + "'";
                //[ProcInsID] = '" + ProcInsID + "' AND 
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandTimeout = 1000;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            String[] detail = new string[8];

                            detail[0] = reader["ID"].ToString();
                            detail[1] = reader["Site_ref"].ToString();
                            detail[2] = reader["ProcInsID"].ToString();
                            detail[3] = reader["WorkflowType"].ToString();
                            detail[4] = reader["WorkflowID"].ToString();
                            detail[5] = reader["Attachment"].ToString();
                            detail[6] = reader["CreateBy"].ToString();
                            detail[7] = reader["CreateDate"].ToString();

                            ListAttactmentFile.Add(detail);
                        }
                    }
                }
            }
            return ListAttactmentFile;
        }
        public List<ArrayList> Get_User_BCP(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHRPortal))
            {
                string sql = " SELECT TOP (100) [Site_Ref],[Emp_Num],[sname],[name],[dept],[Uf_Level],[Uf_Location],[Uf_PositionID],[Uf_Jobtitle],[Uf_JobTitleEN],[BUGroup],[BUGroupDesc]  FROM[dbo].[VW_Employee]  WHERE [LANGUAGE] = 'TH' ";
                if (search != "")
                {
                    sql += " AND ( [Emp_Num] like '%" + search + "%' OR [Emp_Num] like '%" + search + "%'OR [name] like '%" + search + "%' )";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> VW_BCP_Employee(string Emp_num,string CostCenter ,string BCP,string Type,string BUGroup
            , string Emp_Status)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT TOP (200) [Emp_num],[name],[dept],[Uf_Level],[Site_Ref],[BUGroup]" +
                    ",[BUGroupDesc],[Emp_Status],[BCP],[Type],[Effect_date],[Remark]FROM  [dbo].[VW_BCP_Employee]";

                sql += " WHERE 1=1 ";

                if (Emp_num != "")
                {
                    sql += "AND  [Emp_num] like '%" + Emp_num + "%' ";
                }

                if  (CostCenter != "")
                {
                    sql += "AND [dept] like '%" + CostCenter + "%'  ";
                }

                if  (BCP != "")
                {
                    sql += "AND [BCP] like '%" + BCP + "%' ";
                }

                if ( Type  != "")
                {
                    sql += "AND [Type] like '%" + Type + "%' ";
                }

                if (BUGroup != "")
                {
                    sql += "AND [BUGroup] like '%" + BUGroup + "%' ";
                }

                if (Emp_Status != "")
                {
                    sql += "AND [Emp_Status] = '" + Emp_Status + "' ";
                }

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public DataTable Export_ListEmp(string BUGroup, string Status, string BCP, string Type)
        {
                string sql = "SELECT  [MainCompany_TH],[BUGroup],[BUGroupDesc],[Emp_num],[name],[dept],[Uf_Level],[Emp_Status],[BCP],[Type],[Effect_date],[Remark]  FROM  [dbo].[VW_BCP_Employee]";
            sql += " WHERE [Emp_Status] ='Active' AND [BCP] IS NOT NULL ";
            if(BUGroup !="")
            {
                sql += "AND [BUGroup] ='"+ BUGroup + "' ";
            }
            if(Status != "")
            {
                sql += "AND [Emp_Status] ='" + Status + "' ";
            }
            if(BCP != "")
            {
                sql += "AND [BCP] ='" + BCP + "' ";
            }
            if(Type != "")
            {
                sql += "AND [Type] ='" + Type + "' ";
            }
            sql += "order by [MainCompany_TH] , [BUGroup] , [Emp_num] , [dept] ";
            DataTable DT = new DataTable();
            SqlConnection connection = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand(sql, connection);

            try
            {
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                cmd.CommandTimeout = 0;
                DT.Load(cmd.ExecuteReader());
            }
            catch (SqlException ex)
            {
                connection.Close();
                cmd.Dispose();
                return DT;
            }
            connection.Close();
            cmd.Dispose();
            return DT;
        }
        public void SP_BCP_Employee(string Emp_num,int BCP,string Type, string Effect_date, string Remark)
        {
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_BCP_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Emp_num", Emp_num);
            cmd.Parameters.AddWithValue("BCP", BCP);
            cmd.Parameters.AddWithValue("Type", Type);
            cmd.Parameters.AddWithValue("Effect_date", Effect_date);
            cmd.Parameters.AddWithValue("Remark", Remark);
            cmd.Parameters.AddWithValue("UpdateBy", GetUser());

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        public List<ArrayList> BCP_Employee_Trans(string Emp_num)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT TOP (1000) [ID],[Emp_num],[BCP],[Type],[Effect_date],[Remark] FROM [HRPortal].[dbo].[TB_BCP_Employee_Trans] ";
                
                    sql += " WHERE [Emp_num] like '%"+ Emp_num + "%' ORDER BY [ID] DESC ";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GET_BCP_TB_BCP_Maintain()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [Type],[Name] FROM [dbo].[TB_BCP_Maintain] WHERE [Type] = 'BCP'";
                
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GET_Type_TB_BCP_Maintain()
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT [Type],[Name] FROM [dbo].[TB_BCP_Maintain] WHERE [Type] = 'Type'";
                
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> GET_VW_BuGroup_AllSite(string search)
        {
            List<ArrayList> GetData = new List<ArrayList>();
            using (SqlConnection conn = new SqlConnection(conHRPortal))
            {
                string sql = "SELECT DISTINCT [Uf_Group],[GroupDesc] FROM [dbo].[VW_BuGroup_AllSite]";
                if (search != "")
                {
                    sql += "Where Uf_Group like '%"+ search + "%' or GroupDesc like '%"+ search + "%'";
                }
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandTimeout = 300;
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            GetData.Add(detail);
                        }
                    }
                }
            }
            return GetData;
        }
        public List<ArrayList> LoadDataPosition()
        {
            List<ArrayList> Position = new List<ArrayList>();
            using (SqlConnection connection = new SqlConnection(conHRPortal))
            {
                string sql = "Select * from TB_HR_Employee_Position";

                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    connection.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ArrayList detail = new ArrayList();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                detail.Add(reader[i].ToString());
                            }
                            Position.Add(detail);
                        }
                    }
                    connection.Close();
                }
            }
            return Position;
        }

        public string SavePosition(string Position, string JobTitle, string JobTitleEN, string Status, string Action)
        {
            string returnData = "";
            SqlConnection con = new SqlConnection(conHRPortal);
            SqlCommand cmd = new SqlCommand("SP_HR_Employee_Position_Action", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Position", Position);
            cmd.Parameters.AddWithValue("JobTitle", JobTitle);
            cmd.Parameters.AddWithValue("JobTitleEN", JobTitleEN);
            cmd.Parameters.AddWithValue("Status", Status);
            cmd.Parameters.AddWithValue("Action", Action);
            cmd.Parameters.AddWithValue("Username", GetUser());

            con.Open();
            //cmd.ExecuteNonQuery();
            SqlDataReader rs = cmd.ExecuteReader();

            if (rs.Read())
            {
                returnData = rs["msg"].ToString();
            }
            con.Close();

            return returnData;
        }


    }

}

