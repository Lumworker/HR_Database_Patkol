using MobileTask.AppCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HR_Portal
{
    public partial class MaintainEmployee_Darft : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        [WebMethod]
        public static List<ArrayList> GetListEmployee_Darft(string Emp_Num, string search, string type, string fillter)
        {
            return new ClassBrowseNew().GetListEmployee_Draft(Emp_Num, search, type, fillter);
        }

        [WebMethod]
        public static string SP_HR_Employee_Darft(string Emp_Num, string Language, string Emp_Prefix, string Emp_Profile, string Emp_FirstName, string Emp_LastName, string Emp_MidderName, string Emp_Level, string Emp_JobTitle, string Emp_Location, string Emp_Email, string Emp_Extension, string Emp_Comp_Phone, string Emp_StartDate, string Emp_HireDate, string Emp_HR_Shift_ID, string Emp_Type, string Emp_ID_Card
      , string Emp_ID_Card_Expired_Date, string Emp_Birth_Date, string Emp_Gender, string Emp_Nationality, string Emp_Religion, string Emp_Marital_Status, string Emp_Children, string Emp_Address1, string Emp_Address2, string Emp_Address3, string Emp_Address4
      , string Emp_District, string Emp_Country, string Emp_City, string Emp_County, string Emp_ZipCode, string Emp_Phone, string Emp_Bank, string Emp_BankBranch, string Emp_BankAccount, string Emp_Emergency_Contact, string Emp_Emergency_Phone, string Emp_EndDate, string Emp_Status
      , string Emp_Position, string Emp_NickName, string Emp_ManagerID, string Emp_ManagerName, string PayFreq, int FirstTripAbroad, string Department, string Main_Company, string Bef_Shift, string Bef_HRProvince, string Bef_HRCountry, string Bef_ZoneID, string Bef_OTLocation, string Bef_EmpGroup, int Bef_EmpScrub, int Bef_EmpSpray, string Bef_EmpCarrate, string Emp_WeddingBenefit, string Action)
        {
            return new ClassBrowseNew().SP_HR_Employee_Draft(Emp_Num, Language, Emp_Prefix, Emp_Profile, Emp_FirstName, Emp_LastName, Emp_MidderName, Emp_Level, Emp_JobTitle, Emp_Location, Emp_Email, Emp_Extension, Emp_Comp_Phone, Emp_StartDate, Emp_HireDate, Emp_HR_Shift_ID, Emp_Type, Emp_ID_Card
      , Emp_ID_Card_Expired_Date, Emp_Birth_Date, Emp_Gender, Emp_Nationality, Emp_Religion, Emp_Marital_Status, Emp_Children, Emp_Address1, Emp_Address2, Emp_Address3, Emp_Address4
      , Emp_District, Emp_Country, Emp_City, Emp_County, Emp_ZipCode, Emp_Phone, Emp_Bank, Emp_BankBranch, Emp_BankAccount, Emp_Emergency_Contact, Emp_Emergency_Phone, Emp_EndDate, Emp_Status
      , Emp_Position, Emp_NickName, Emp_ManagerID, Emp_ManagerName, PayFreq, FirstTripAbroad, Department, Main_Company, Bef_Shift, Bef_HRProvince, Bef_HRCountry, Bef_ZoneID, Bef_OTLocation, Bef_EmpGroup, Bef_EmpScrub, Bef_EmpSpray, Bef_EmpCarrate, Emp_WeddingBenefit, Action);
        }
    }
}