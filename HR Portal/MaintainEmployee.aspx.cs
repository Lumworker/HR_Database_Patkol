using MobileTask.AppCode;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

namespace HR_Portal
{
    public partial class MaintainEmployee : System.Web.UI.Page
    {

        

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void exportTableC_Click(object sender, EventArgs e)
        {
            IWorkbook workbook;
            string customerJSON = Request.Form["CustomerJSON"];
            DataTable dt = JsonConvert.DeserializeObject<DataTable>(customerJSON);
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
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "ExportHr_Portal.xlsx"));
                Response.BinaryWrite(exportData.ToArray());
                //xlsx file format
                //Response.ContentType = "application/vnd.ms-excel";
                //Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", "Report Tax .xls"));
                //Response.BinaryWrite(exportData.GetBuffer());
                ////xls file format
                Response.End();
            }
            
        }

        


        [WebMethod]
        public static List<ArrayList> GetListEmployee(string Emp_Num, string search, string type,string fillter)
        {
            return new ClassBrowseNew().GetListEmployee(Emp_Num, search, type, fillter);
        }

        [WebMethod]
        public static List<ArrayList> VW_GetListEmployee(string[] search, string[] fillter, string type )
        {
            return new ClassBrowseNew().VW_GetListEmployee( search, fillter, type);
        }

        [WebMethod]
        public static List<ArrayList> GetListUserRedirect( string search, string type)
        {
            return new ClassBrowseNew().GetListUserRedirect( search, type);
        }

        [WebMethod]
        public static List<ArrayList> Getleave(string EmpNum)
        {
            return new ClassBrowseNew().Getleave(EmpNum);
        }

        [WebMethod]
        public static List<ArrayList> GetListCompany(string Empcomp, string Main)
        {
            return new ClassBrowseNew().GetListCompany(Empcomp, Main);
        }
        [WebMethod]
        public static List<ArrayList> GetListCompanyMain(string EmpcompMain, string Main)
        {
            return new ClassBrowseNew().GetListCompanyMain(EmpcompMain, Main);
        }



        //[WebMethod]
        //public static List<ArrayList> GetListJobExp(int ID, string checkjob)
        //{
        //    return new ClassBrowseNew().GetListJobExp(ID, checkjob);
        //}

        [WebMethod]
        public static List<ArrayList> GetListEducation(string search)
        {
            return new ClassBrowseNew().GetListEducation(search);
        }

        [WebMethod]
        public static List<ArrayList> GetListAttachment(string ref_id, string type)
        {
            return new ClassBrowseNew().GetListAttachment(ref_id, type);
        }

        [WebMethod]
        public static List<ArrayList> GetCertificate(string search)
        {
            return new ClassBrowseNew().GetCertificate(search);
        }

        //[WebMethod]
        //public static List<ArrayList> GetListsComp(int ID, string checkempcomp)
        //{
        //    return new ClassBrowseNew().GetListsComp(ID, checkempcomp);
        //}


        [WebMethod]
        public static List<ArrayList> GetListPermission(int ID)
        {
            return new ClassBrowseNew().GetListPermission(ID);
        }
        
        [WebMethod]
        public static List<ArrayList> getHrshiftID()
        {
            return new ClassBrowseNew().getHrshiftID();
        }

        [WebMethod]
        public static List<ArrayList> GetCountry(string search)
        {
            return new ClassBrowseNew().GetCountry(search);
        }

        [WebMethod]
        public static List<ArrayList> ShowCountry(string search)
        {
            return new ClassBrowseNew().ShowCountry(search);
        }

        [WebMethod]
        public static List<ArrayList> Gettypeleave()
        {
            return new ClassBrowseNew().Gettypeleave();
        }

        [WebMethod]
        public static List<ArrayList> GetBank(string TypeName,string search)
        {
            return new ClassBrowseNew().GetBank(TypeName, search);
        }

        //Benefit Start
        [WebMethod]
        public static List<ArrayList> GetListBenefit(string Emp_Num, string type)
        {
            return new ClassBrowseNew().GetListBenefit(Emp_Num, type);
        }
        //Benefit End

        [WebMethod]
        public static List<ArrayList> GetLocation()
        {
            return new ClassBrowseNew().GetLocation();
        }

        [WebMethod]
        public static List<ArrayList> GetMainCompany()
        {
            return new ClassBrowseNew().GetMainCompany();
        }

        [WebMethod]
        public static List<ArrayList> GetSearchMainCompany(string search)
        {
            return new ClassBrowseNew().GetSearchMainCompany(search);
        }

        [WebMethod]
        public static List<ArrayList> GetSiteRef()
        {
            return new ClassBrowseNew().GetSiteRef();
        }
        [WebMethod]
        public static List<ArrayList> GetPA_TAG_Type_Car()
        {
            return new ClassBrowseNew().GetPA_TAG_Type_Car();
        }
        [WebMethod]
        public static List<ArrayList> VW_PA_TAG_Charge(string search)
        {
            return new ClassBrowseNew().VW_PA_TAG_Charge(search);
        }

        [WebMethod]
        public static List<ArrayList> GetUserAD(string user, string search)
        {
            return new ClassBrowseNew().GetUserAD(user, search);
        }

        [WebMethod]
        public static List<ArrayList> GetPosition(string search)
        {
            return new ClassBrowseNew().GetPosition(search);
        }

        [WebMethod] 
        public static List<ArrayList> GetProvince(string search)
        {
            return new ClassBrowseNew().GetProvince(search);
        }

        [WebMethod]
        public static List<ArrayList> GetCountries(string search)
        {
            return new ClassBrowseNew().GetCountries(search);
        }

        [WebMethod]
        public static List<ArrayList> GetZoneID(string search)
        {
            return new ClassBrowseNew().GetZoneID(search);
        }

        [WebMethod]
        public static List<ArrayList> GetEmpGroup(string search)
        {
            return new ClassBrowseNew().GetEmpGroup(search);
        }

        [WebMethod]
        public static List<ArrayList> GetJobExp(string search)
        {
            return new ClassBrowseNew().GetJobExp(search);
        }

        [WebMethod]
        public static List<ArrayList> GetTbListRedirect(string search)
        {
            return new ClassBrowseNew().GetTbListRedirect(search);
        }

        [WebMethod]
        public static List<List<ArrayList>> GetExportEmp(string Emp_Company, string Emp_Group, string CostCenterStart, string CostCenterEnd, string ExportActive, string ExportInActive,string type)
        {
            return new ClassBrowseNew().GetExportEmp(Emp_Company, Emp_Group, CostCenterStart, CostCenterEnd, ExportActive, ExportInActive, type);
        }

        [WebMethod]
        public static List<ArrayList> GetCurrency(string search)
        {
            return new ClassBrowseNew().GetCurrency(search);
        }

        [WebMethod]
        public static List<ArrayList> VW_HR_List_Company(string search)
        {
            return new ClassBrowseNew().VW_HR_List_Company(search);
        }
        [WebMethod]
        public static List<ArrayList> VW_HR_List_Group(string search)
        {
            return new ClassBrowseNew().VW_HR_List_Group(search);
        }
        
        [WebMethod]
        public static List<ArrayList> VW_HR_List_CompanyExport(string search ,string company, string buGroup , string step)
        {
            return new ClassBrowseNew().VW_HR_List_CompanyExport(search , company , buGroup, step);
        }
        [WebMethod]
        public static string SP_HR_Employee(string Emp_Num, string Language, string Emp_Prefix, string Emp_Profile, string Emp_FirstName, string Emp_LastName, string Emp_MidderName, string Emp_Level, string Emp_JobTitle, string Emp_Location, string Emp_Email, string Emp_Extension, string Emp_Comp_Phone, string Emp_StartDate, string Emp_HireDate, string Emp_HR_Shift_ID, string Emp_Type, string Emp_ID_Card
      , string Emp_ID_Card_Expired_Date, string Emp_Birth_Date, string Emp_Gender, string Emp_Nationality, string Emp_Religion, string Emp_Marital_Status, string Emp_Children, string Emp_Address1, string Emp_Address2, string Emp_Address3, string Emp_Address4
      , string Emp_District, string Emp_Country, string Emp_City, string Emp_County, string Emp_ZipCode, string Emp_Phone, string Emp_Bank, string Emp_BankBranch, string Emp_BankAccount, string Emp_Emergency_Contact, string Emp_Emergency_Phone, string Emp_EndDate, string Emp_Status
      , string Emp_Position, string Emp_NickName, string Emp_ManagerID, string Emp_ManagerName,int Emp_StartLongevity, string PayFreq, int FirstTripAbroad, string Department, string Main_Company, string Bef_Shift, string Bef_HRProvince, string Bef_HRCountry, string Bef_ZoneID, string Bef_OTLocation, string Bef_EmpGroup, int Bef_EmpScrub, int Bef_EmpSpray, string Bef_EmpCarrate,string Emp_WeddingBenefit, string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee( Emp_Num,  Language,  Emp_Prefix,  Emp_Profile,  Emp_FirstName,  Emp_LastName,  Emp_MidderName,  Emp_Level,  Emp_JobTitle,  Emp_Location,  Emp_Email,  Emp_Extension,  Emp_Comp_Phone,  Emp_StartDate,  Emp_HireDate,  Emp_HR_Shift_ID,  Emp_Type,  Emp_ID_Card
      ,  Emp_ID_Card_Expired_Date,  Emp_Birth_Date,   Emp_Gender,  Emp_Nationality,  Emp_Religion,  Emp_Marital_Status,  Emp_Children,  Emp_Address1,  Emp_Address2,  Emp_Address3, Emp_Address4
      ,  Emp_District,  Emp_Country,  Emp_City,  Emp_County,  Emp_ZipCode,  Emp_Phone,  Emp_Bank,  Emp_BankBranch,  Emp_BankAccount,  Emp_Emergency_Contact,  Emp_Emergency_Phone, Emp_EndDate, Emp_Status
      ,  Emp_Position, Emp_NickName, Emp_ManagerID , Emp_ManagerName, Emp_StartLongevity, PayFreq, FirstTripAbroad,  Department,  Main_Company,  Bef_Shift,  Bef_HRProvince,  Bef_HRCountry,  Bef_ZoneID,  Bef_OTLocation,  Bef_EmpGroup,  Bef_EmpScrub,  Bef_EmpSpray,  Bef_EmpCarrate, Emp_WeddingBenefit, Action);
        }

        [WebMethod]
        public static string SP_HR_Employee_Company(int ID, string Emp_Num, string Company, string CostCenter,string Division, string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee_Company(ID, Emp_Num, Company, CostCenter,Division, Action);
        }

        [WebMethod]
        public static string SP_Benefits(string Emp_Num, string Bef_Shift, string HRProvince, string HRCountry, string ZoneID, string OTLocation,
        string Emp_group, int Emp_scrub, int Emp_spray, string Emp_carrate, string Language, string Action)
        {
            return new ClassBrowseNew().SP_Benefits(Emp_Num, Bef_Shift, HRProvince, HRCountry, ZoneID, OTLocation,
            Emp_group, Emp_scrub, Emp_spray, Emp_carrate, Language, Action);
        }

        [WebMethod]
        public static string SP_HR_Employee_JobExp(int ID, string Company, string JobExperience, string EndDate, int Emp_Num , string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee_JobExp(ID, Company, JobExperience, EndDate, Emp_Num, Action);
        }

        [WebMethod]
        public static string SP_HR_Employee_Education(int ID, string Level, string Institution, string Faculty, string Major, string Graduate, string Emp_Num, string image, string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee_Education(ID, Level, Institution, Faculty, Major, Graduate, Emp_Num, image, Action);
        }

        [WebMethod]
        public static string SP_HR_Employee_Certificate(int ID, string Emp_Num, string Emp_Certificate, string Description, string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee_Certificate(ID, Emp_Num, Emp_Certificate, Description, Action);
        }

        [WebMethod]
        public static string SP_PA_TAG_Master(string PA_TAG_Code, string PA_TAG_Type_Car, string PA_TAG_Band, string PA_TAG_Model, string PA_TAG_Start_DATE
            , string PA_TAG_End_DATE, string PA_TAG_CarID, double PA_TAG_Price, string PA_TAG_Name_Sell, string PA_TAG_IMAGE, string PA_TAG_SN, string PA_TAG_DETAIL
            , string PA_TAG_REMARK, string PA_TAG_Company_Location, string PA_TAG_Status, string PA_TAG_Car_Status, string PA_TAG_Contact_ID
            , string PA_TAG_TAX, string PA_TAG_Type_TAX, string PA_TAG_CHARGE, string PA_TAG_MAC, string PA_TAG_ENG, string PA_TAG_Asset_Type, string PA_TAG_Asset_Code
            , string FleetCardNo, string EasypassNo,string Stauts)
        {
            return new ClassBrowseNew().SP_PA_TAG_Master(PA_TAG_Code, PA_TAG_Type_Car, PA_TAG_Band, PA_TAG_Model, PA_TAG_Start_DATE
            , PA_TAG_End_DATE, PA_TAG_CarID, PA_TAG_Price, PA_TAG_Name_Sell, PA_TAG_IMAGE, PA_TAG_SN, PA_TAG_DETAIL
            , PA_TAG_REMARK, PA_TAG_Company_Location, PA_TAG_Status, PA_TAG_Car_Status, PA_TAG_Contact_ID
            , PA_TAG_TAX, PA_TAG_Type_TAX, PA_TAG_CHARGE, PA_TAG_MAC, PA_TAG_ENG, PA_TAG_Asset_Type, PA_TAG_Asset_Code
            , FleetCardNo, EasypassNo, Stauts);
        }
        [WebMethod]
        public static string SP_PA_TAG_Master_IMG(string PA_TAG_Code, string PA_TAG_IMAGE)
        {
            return new ClassBrowseNew().SP_PA_TAG_Master_IMG( PA_TAG_Code,  PA_TAG_IMAGE);
        }
        [WebMethod]
        public static string SP_PA_TAG_Insurance_IMG(int ID, int Insurance_ID, string Path)
        {
            return new ClassBrowseNew().SP_PA_TAG_Insurance_IMG(ID, Insurance_ID, Path);
        }
        [WebMethod]
        public static string SP_PA_TAG_MA_IMG(int ID, int MA_ID, string Path)
        {
            return new ClassBrowseNew().SP_PA_TAG_MA_IMG(ID, MA_ID, Path);
        }
        [WebMethod]
        public static string SP_PA_TAG_Tax_IMG(int ID, int Tax_ID, string Path)
        {
            return new ClassBrowseNew().SP_PA_TAG_Tax_IMG(ID, Tax_ID, Path);
        }
        [WebMethod]
        public static string SP_PA_TAG_PE(string ID, string PA_TAG_Code, string PA_PE_User, string PA_PE_Date, string PA_PE_Detail)
        {
            return new ClassBrowseNew().SP_PA_TAG_PE(ID, PA_TAG_Code, PA_PE_User, PA_PE_Date, PA_PE_Detail);
        }
        [WebMethod]
        public static string SP_PA_TAG_MA(string ID, string Repair_Type, string PA_MA_DETAIL, string PA_MA_DATE, int PA_MA_SUPPLIER, double PA_MA_PRICE, int PA_MA_MILE)
        {
            return new ClassBrowseNew().SP_PA_TAG_MA(ID, Repair_Type, PA_MA_DETAIL, PA_MA_DATE, PA_MA_SUPPLIER, PA_MA_PRICE, PA_MA_MILE);
        }

        [WebMethod]
        public static string SP_PA_TAG_Tax(int ID, string PA_TAG_Code, string PA_TAX_Detail, string PA_TAX_Start_Date, string PA_TAX_End_Date, double PA_TAX_Price)
        {
            return new ClassBrowseNew().SP_PA_TAG_Tax(ID, PA_TAG_Code, PA_TAX_Detail, PA_TAX_Start_Date, PA_TAX_End_Date, PA_TAX_Price);
        }
        [WebMethod]
        public static string SP_PA_TAG_Insurance(string ID, string PA_TAG_Code, string PA_INS_Detail, string PA_INS_Name_Insurance, string PA_INS_Serial_Insurance, string PA_INS_Start_Date_Insurance, string PA_INS_End_Date_Insurance, string PA_INS_Price_Insurance, string PA_INS_Start_Date_Act, string PA_INS_End_Date_Act, string PA_INS_Price_Act,string PA_INS_Serial_Act)
        {
            return new ClassBrowseNew().SP_PA_TAG_Insurance(ID, PA_TAG_Code, PA_INS_Detail, PA_INS_Name_Insurance, PA_INS_Serial_Insurance, PA_INS_Start_Date_Insurance, PA_INS_End_Date_Insurance, PA_INS_Price_Insurance, PA_INS_Start_Date_Act, PA_INS_End_Date_Act, PA_INS_Price_Act, PA_INS_Serial_Act);
        }
        //[WebMethod]
        //public static string VW_HR_List_Employee(int ID, int Emp_Num, int CheckMain, string Company, string Division, string CostCenter)
        //{
        //    return new ClassBrowseNew().VW_HR_List_Employee(ID, Emp_Num, CheckMain, Company, Division, CostCenter);
        //}

        [WebMethod]
        public static string SP_HR_Employee_Authen (string Emp_Num, string Username, string Permission, string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee_Authen (Emp_Num, Username, Permission, Action);
        }

        [WebMethod]
        public static string SP_HR_Employee_Leave(int ID, string Emp_Num, string Emp_UserName, string Emp_Type, string Leave_StartDate, string Leave_EndDate, string Redirect, string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee_Leave(ID, Emp_Num, Emp_UserName, Emp_Type, Leave_StartDate, Leave_EndDate, Redirect, Action);
        }
        
        [WebMethod]
        public static string btnsync_Click(string Empnum,string MainComp)
        {
            ClassAutomationSL ConAutomat = new ClassAutomationSL();
            ClassBrowseNew ConClassBrowseNew = new ClassBrowseNew();
            string SessionToken,ConfName,Param;

            ConfName = ConClassBrowseNew.GetConfName(MainComp);
            SessionToken = ConAutomat.CheckPermission(ConfName);
            
            if (SessionToken != "") { 
                Param = "<Parameters><Parameter ByRef=\"EmpNum\">" + Empnum + "</Parameter>";
                Param += "</Parameters>";
              
                    object result;
                    result = ConAutomat.CallIDO(SessionToken, "VW_ProjectInfos", "SP_HRPortal_SyncDataEmp", Param);

                    Console.WriteLine(result);
                if (result.ToString() == "0" ){
                    string msg = "Automation Success";
                    return msg;
                }
                else{
                    return result.ToString();
                }
            }
            else{
                    string msg = "Permission limited or Password was incorrect.";
                    return msg;
            }
        }


        //[WebMethod]
        //public static string btnRedirect(string RedirectFrom,string RedirectTO,string SNvalue)
        //{
        //    var client = new RestClient("http://k2app/K2Redirect/api/K2TaskRedirect");
        //    var request = new RestRequest(Method.POST);
        //    request.AddHeader("cache-control", "no-cache");
        //    request.AddHeader("content-type", "application/x-www-form-urlencoded");
        //    request.AddParameter("application/x-www-form-urlencoded", "SerialNumber=" + SNvalue + "&RedirectTo=" + RedirectTO + "&RedirectFrom=" + RedirectFrom + "", ParameterType.RequestBody);
        //    IRestResponse response = client.Execute(request);
        //    string Text = response.Content;
        //    return Text;
        //}

        //[WebMethod]
        //public static string btnDelegate(string RedirectFrom, string RedirectTO, string SNvalue)
        //{
        //    var client = new RestClient("http://k2app/K2Redirect/api/K2TaskDelegate");
        //    var request = new RestRequest(Method.POST);
        //    request.AddHeader("cache-control", "no-cache");
        //    request.AddHeader("content-type", "application/x-www-form-urlencoded");
        //    request.AddParameter("application/x-www-form-urlencoded", "SerialNumber=" + SNvalue + "&RedirectTo=" + RedirectTO + "&RedirectFrom=" + RedirectFrom + "", ParameterType.RequestBody);
        //    IRestResponse response = client.Execute(request);
        //    string Text = response.Content;
        //    return Text;
        //}

        [WebMethod]
        public static string btnCallK2URL(string RedirectFrom, string RedirectTO, string SNvalue, string url)
        {
            var client = new RestClient(url);
            var request = new RestRequest(Method.POST);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/x-www-form-urlencoded");
            request.AddParameter("application/x-www-form-urlencoded", "SerialNumber=" + SNvalue + "&RedirectTo=" + RedirectTO + "&RedirectFrom=" + RedirectFrom + "", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            string Text = response.Content;
            return Text;
        }

        [WebMethod]
        public static List<ArrayList> GetSNvalueRedirect(string RedirectFrom, string K2Redirect,string version)
        {
            return new ClassBrowseNew().GetSNvalueRedirect( RedirectFrom,K2Redirect,version);
        }

        [WebMethod]
        public static string SP_Maintain_InterBenefit(int ID, string ZoneID, string Country, string Allowance, int Actualfood, string food, int ActualBenefit, string Accomodation, string Currency, string Effect_Data, string EmpLevel, string Action)
        {
            return new ClassBrowseNew().SP_Maintain_InterBenefit(ID, ZoneID, Country, Allowance,  Actualfood, food, ActualBenefit, Accomodation, Currency, Effect_Data, EmpLevel, Action);
        }
        [WebMethod]
        public static string SP_Maintain_Domestic(int ID, string ZoneID, string Allowance, int Actualfood, string food, int ActualBenefit, string Accomodation, string Currency, string Effect_Data, string EmpLevel, string Action)
        {
            return new ClassBrowseNew().SP_Maintain_Domestic(ID, ZoneID, Allowance, Actualfood, food, ActualBenefit, Accomodation, Currency, Effect_Data, EmpLevel, Action);
        }

        [WebMethod]
        public static List<ArrayList> GetInterBenefit()
        {
            return new ClassBrowseNew().GetInterBenefit();
        }

        [WebMethod]
        public static string SP_HR_Employee_Attachment(int ID, string File_type, string part, string name, string ref_ID, string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee_Attachment(ID, File_type, part, name, ref_ID, Action);
        }
        [WebMethod]
        public static string SP_IT_Maintain(string Emp_Num, string Emp_Email, string Emp_Extension, string Action)
        {
            return new ClassBrowseNew().SP_IT_Maintain(Emp_Num, Emp_Email, Emp_Extension, Action);
        }
        [WebMethod]
        public static string SP_Permission(int ID, string username, string Per_Page, string viewer, string editor, string Action)
        {
            return new ClassBrowseNew().SP_Permission(ID, username, Per_Page, viewer, editor, Action);
        }
        [WebMethod]
        public static List<ArrayList> GetPermission(string user, string page)
        {
            return new ClassBrowseNew().GetPermission(user,page);
        }

        [WebMethod]
        public static List<ArrayList> GetUsername(string search)
        {
            return new ClassBrowseNew().GetUsername(search);
        }
        [WebMethod]
        public static List<ArrayList> GetUsernamePE(string search)
        {
            return new ClassBrowseNew().GetUsernamePE(search);
        }

        [WebMethod]
        public static string GetUser(string para)
        {
            return new ClassBrowseNew().GetUser();
        }
        [WebMethod]
        public static string SP_Zone(int ID, string Emp_zone, string Country, string Action)
        {
            return new ClassBrowseNew().SP_Zone(ID, Emp_zone, Country, Action);
        }
        [WebMethod]
        public static List<ArrayList> GetTB_Zone(string value)
        {
            return new ClassBrowseNew().GetTB_Zone(value);
        }
        [WebMethod]
        public static List<ArrayList> GetTB_Domestic()
        {
            return new ClassBrowseNew().GetTB_Domestic();
        }
        [WebMethod]
        public static List<ArrayList> GetLeaveMaster(string search)
        {
            return new ClassBrowseNew().GetLeaveMaster(search);
        }
        [WebMethod]
        public static List<ArrayList> GetleaveGroup(string search)
        {
            return new ClassBrowseNew().GetleaveGroup(search);
        }
        [WebMethod]
        public static string SP_Leave_Type_Maintain(int Leave_ID, string Leave_Group, string Leave_Reason, string Sex, int isLimitedDay, int availableDay, int isLimitedPayDay, int availablePayDay, string Leave_Condition, int Leave_Minimum, string Effective_Start, int Longevity_Year, int reqpaper, string Reset_Date, string Reset_Date2, string Remind, string Action)
        {
            return new ClassBrowseNew().SP_Leave_Type_Maintain(Leave_ID, Leave_Group, Leave_Reason, Sex, isLimitedDay, availableDay, isLimitedPayDay, availablePayDay, Leave_Condition, Leave_Minimum, Effective_Start, Longevity_Year, reqpaper, Reset_Date, Reset_Date2, Remind, Action);
        }
        [WebMethod]
        public static List<ArrayList> GetYearLeaveLimit(string Emp_Num)
        {
            return new ClassBrowseNew().GetYearLeaveLimit(Emp_Num);
        }
        [WebMethod]
        public static List<ArrayList> GetTBLeaveLimit(string Emp_Num, string Year)
        {
            return new ClassBrowseNew().GetTBLeaveLimit(Emp_Num, Year);
        }
        [WebMethod]
        public static string SPLeaveLimit(int ID, int Accommodation_Date, int Accommodation_Hour, string Action)
        {
            return new ClassBrowseNew().SPLeaveLimit(ID, Accommodation_Date, Accommodation_Hour, Action);
        }
        [WebMethod]
        public static List<ArrayList> Get_TBLeaveAbsence(string Emp_Num, string Year)
        {
            return new ClassBrowseNew().Get_TBLeaveAbsence(Emp_Num, Year);
        }
        [WebMethod]
        public static string SPLeaveAbsence(int ID, string Emp_Num, int Accommodation_Date, int Accommodation_Hour,string Effect_Date, string Action)
        {
            return new ClassBrowseNew().SPLeaveAbsence(ID, Emp_Num, Accommodation_Date, Accommodation_Hour, Effect_Date, Action);
        }
        [WebMethod]
        public static List<ArrayList> SPLeaveTotalAbsence(string Emp_Num,string Year)
        {
            return new ClassBrowseNew().SPLeaveTotalAbsence(Emp_Num, Year);
        }

        [WebMethod]
        public static List<ArrayList> GetLeaveTransaction(string empNum, string leaveID, string ID)
        {
            return new ClassBrowseNew().GetLeaveTransaction(empNum, leaveID, ID);
        }

        [WebMethod]
        public static List<ArrayList> GetLeaveType(string Emp_Num)
        {
            return new ClassBrowseNew().GetLeaveType(Emp_Num);
        }

        [WebMethod]
        public static List<ArrayList> GetLeaveTotalUsed(string Emp_Num, int LeaveType)
        {
            return new ClassBrowseNew().GetLeaveTotalUsed(Emp_Num, LeaveType);
        }

        [WebMethod]
        public static List<ArrayList> GetHistory(int Leave_ID, string Language)
        {
            return new ClassBrowseNew().GetHistory(Leave_ID, Language);
        }

        [WebMethod]
        public static List<String[]> GetPaymentID(string site_ref)
        {
            return new ClassBrowseNew().GetPaymentID(site_ref);
        }

        [WebMethod]
        public static List<String[]> GetEemp(string site_ref, string search)
        {
            return new ClassBrowseNew().GetEemp(site_ref, search);
        }

        [WebMethod]
        public static List<String[]> GetERPLevel(string site_ref)
        {
            return new ClassBrowseNew().GetERPLevel(site_ref);
        }

        [WebMethod]
        public static List<String[]> GetERPCostcenter(string site_ref, string search)
        {
            return new ClassBrowseNew().GetERPCostcenter(site_ref, search);
        }

        [WebMethod]
        public static List<String[]> GetEERegular(int ID, string paymentID, string payTypeName, string costcenter, string Ref, string site_ref)
        {
            return new ClassBrowseNew().GetEERegular( ID, paymentID, payTypeName, costcenter, Ref, site_ref);
        }

        [WebMethod]
        public static string SP_HR_ERegulars(int ID, string Payment_ID,  string CostCenter, string Level_OR_EmpNum, float Value, string Start_Date, string End_Date, string Type, string site_ref)
        {
            return new ClassBrowseNew().SP_HR_ERegulars(ID, Payment_ID, CostCenter, Level_OR_EmpNum, Value, Start_Date, End_Date, Type, site_ref);
        }

        [WebMethod]
        public static string SP_PA_TAG_Charge(string CH_Code, string Detail,string Status)
        {
            return new ClassBrowseNew().SP_PA_TAG_Charge(CH_Code, Detail, Status);
        }
        [WebMethod]
        public static string SP_PA_TAG_Charge_Detail(int ID, string CH_Code,  string CH_Desc, string CH_Value, string EffectDate)
        {
            return new ClassBrowseNew().SP_PA_TAG_Charge_Detail(ID, CH_Code, CH_Desc, CH_Value, EffectDate);
        }
        [WebMethod]
        public static string SP_PA_TAG_Charge_Group(string Group_Code, string Group_Detail, string Group_Status, string Status)
        {
            return new ClassBrowseNew().SP_PA_TAG_Charge_Group(Group_Code, Group_Detail, Group_Status, Status);
        }
        [WebMethod]
        public static string SP_PA_TAG_ServiceCenterofRepairing(string ID, string NameStatus, string Status)
        {
            return new ClassBrowseNew().SP_PA_TAG_ServiceCenterofRepairing(ID, NameStatus, Status);
        }

        [WebMethod]
        public static List<String[]> GetExportPreview(string paymentID, string costExport, string costToExport, string levelExport, string empExport, string effDateExport, string effDateToExport, string site_ref)
        {
            return new ClassBrowseNew().GetExportPreview(paymentID, costExport, costToExport, levelExport, empExport, effDateExport, effDateToExport, site_ref);
        }

        [WebMethod]
        public static List<String[]> GetExportPreviewSearch(string empExport, string costExport, string costToExport, string site_ref)
        {
            return new ClassBrowseNew().GetExportPreviewSearch(empExport, costExport, costToExport, site_ref);
        }
        [WebMethod]
        public static string clearData(string empnum)
        {
            return new ClassBrowseNew().clearOTData(empnum);
        }
        [WebMethod]
        public static string importData(string empnum)
        {
            return new ClassBrowseNew().importData(empnum);
        }
        [WebMethod]
        public static List<ArrayList> GetOTDetails(string empnum)
        {
            return new ClassBrowseNew().GetOTDetails(empnum);
        }
        [WebMethod]
        public static List<ArrayList> GetOT(string empnum)
        {
            return new ClassBrowseNew().GetOT(empnum);
        }
        [WebMethod]
        public static List<ArrayList> GETPA_TAG_Charge()
        {
            return new ClassBrowseNew().GETPA_TAG_Charge();
        }
        [WebMethod]
        public static List<ArrayList> TB_PA_TAG_MASTER(string PATAG)
        {
            return new ClassBrowseNew().TB_PA_TAG_MASTER(PATAG);
        }
        [WebMethod]
        public static List<ArrayList> TB_PA_TAG_MASTER_Search(string SearchPATAG)
        {
            return new ClassBrowseNew().TB_PA_TAG_MASTER_Search(SearchPATAG);
        }
        [WebMethod]
        public static List<ArrayList> GETPA_TAG_Charge_Detail(string CH_CODE)
        {
            return new ClassBrowseNew().GETPA_TAG_Charge_Detail(CH_CODE);
        }
        [WebMethod]
        public static List<ArrayList> GETPA_TAX(string PATAG)
        {
            return new ClassBrowseNew().GETPA_TAX(PATAG);
        }
        [WebMethod]
        public static List<ArrayList> GET_PATAG_Insurance(string PATAG)
        {
            return new ClassBrowseNew().GET_PATAG_Insurance(PATAG);
        }
        [WebMethod]
        public static List<ArrayList> GET_PATAG_MA(string PATAG)
        {
            return new ClassBrowseNew().GET_PATAG_MA(PATAG);
        }
        [WebMethod]
        public static List<ArrayList> GETPA_TAX_IMAGE(string TAX_ID)
        {
            return new ClassBrowseNew().GETPA_TAX_IMAGE(TAX_ID);
        }
        [WebMethod]
        public static List<ArrayList> GETPA_INS_IMAGE(string Insurance_ID)
        {
            return new ClassBrowseNew().GETPA_INS_IMAGE(Insurance_ID);
        }
        [WebMethod]
        public static List<ArrayList> GETPA_MA_IMAGE(string MA_ID)
        {
            return new ClassBrowseNew().GETPA_MA_IMAGE(MA_ID);
        }

        [WebMethod]
        public static List<ArrayList> GETPA_TAG_Charge_Group()
        {
            return new ClassBrowseNew().GETPA_TAG_Charge_Group();
        }
        [WebMethod]
        public static List<ArrayList> GETPATAG_PE(string PATAG)
        {
            return new ClassBrowseNew().GETPATAG_PE(PATAG);
        }
        [WebMethod]
        public static List<ArrayList> GETPA_TAG_ServiceCenterofRepairing()
        {
            return new ClassBrowseNew().GETPA_TAG_ServiceCenterofRepairing();
        }
        [WebMethod]
        public static List<ArrayList> GetPreviewExcel_Charge(string snsStatus)
        {
            return new ClassBrowseNew().GetPreviewExcel_Charge(snsStatus);
        }
        [WebMethod]
        public static List<ArrayList> GetPreviewExcel_Tax(string snsStatus)
        {
            return new ClassBrowseNew().GetPreviewExcel_Tax(snsStatus);
        }
        [WebMethod]
        public static List<ArrayList> GetPreviewExcel_Insurance(string snsStatus)
        {
            return new ClassBrowseNew().GetPreviewExcel_Insurance(snsStatus);
        }
        [WebMethod]
        public static List<ArrayList> GetPreviewExcel_MA(string snsStatus)
        {
            return new ClassBrowseNew().GetPreviewExcel_MA(snsStatus);
        }
        [WebMethod]
        public static List<ArrayList> GetHeaderTable(string from,string snsStatus)
        {
            return new ClassBrowseNew().GetHeaderTable(from,snsStatus);
        }
        [WebMethod]
        public static List<String[]> getAttactmentFile(string WorkflowType, string WorkflowID)
        {
            return new ClassBrowseNew().getAttactmentFile(WorkflowType, WorkflowID);
        }
        [WebMethod]
        public static List<List<ArrayList>> GetPreviewExcel(string from, string snsStatus)
        {
            return new ClassBrowseNew().GetPreviewExcel(from,snsStatus);
        }
        [WebMethod]
        public static List<ArrayList> Get_User_BCP(string search)
        {
            return new ClassBrowseNew().Get_User_BCP(search);
        }
        [WebMethod]
        public static List<ArrayList> VW_BCP_Employee(string Emp_num, string CostCenter, string BCP, string Type
            , string BUGroup, string Emp_Status)
        {
            return new ClassBrowseNew().VW_BCP_Employee( Emp_num,  CostCenter,  BCP,  Type, BUGroup, Emp_Status);
        }
        [WebMethod]
        public static DataTable Export_ListEmp(string BUGroup, string Status, string BCP, string Type)
        {
            return new ClassBrowseNew().Export_ListEmp(BUGroup, Status, BCP, Type);
        }
        [WebMethod]
        public static List<ArrayList> BCP_Employee_Trans(string Emp_num)
        {
            return new ClassBrowseNew().BCP_Employee_Trans( Emp_num);
        }
        [WebMethod]
        public static void SP_BCP_Employee(string Emp_num, int BCP, string Type, string Effect_date, string Remark)
        {
             new ClassBrowseNew().SP_BCP_Employee(Emp_num, BCP, Type, Effect_date, Remark);
        }
        [WebMethod]
        public static List<ArrayList> GET_BCP_TB_BCP_Maintain()
        {
            return new ClassBrowseNew().GET_BCP_TB_BCP_Maintain();
        }
        [WebMethod]
        public static List<ArrayList> GET_Type_TB_BCP_Maintain()
        {
            return new ClassBrowseNew().GET_Type_TB_BCP_Maintain();
        }
        [WebMethod]
        public static List<ArrayList> GET_VW_BuGroup_AllSite(string search)
        {
            return new ClassBrowseNew().GET_VW_BuGroup_AllSite(search);
        }
    }
}
