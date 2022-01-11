using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

namespace HR_Portal
{ 
    public class ClassAutomationSL
{
    //ClassDBConnSL DBConnSL = new ClassDBConnSL();


    //public string[] GetConfigurationNames();
    //String sessionToken;
    DataSet idoDataSet;
    DataTable idoDataTable;
    Syteline.DOWebServiceSoapClient webService = new Syteline.DOWebServiceSoapClient();
    Syteline.DOWebServiceSoapClient idoWS = new Syteline.DOWebServiceSoapClient();
    String UserDomain, IDO, Field, Where, Orderby;
    public String code = "", name = "";
    DataTable DTDDL = new DataTable();
    DataTable DTTemp = new DataTable();
    string SessionToken;


        public string GetUser()
    {
        UserDomain = HttpContext.Current.Request.LogonUserIdentity.Name;
        //UserDomain = "WILAIPORN.PA";
        UserDomain = UserDomain.Replace("PATKOL\\", "");
        return UserDomain;
    }

        public string CheckPermission(string SiteRef)
        {

            SessionToken = Login(SiteRef);
            return SessionToken;
        }

        

        public string Login(string SiteConf)
        {

            //string Token, SiteRef;
            string Token;

             //DBConnSL.GetSiteConfName(SiteConf);
             //SiteRef = DBConnSL.rParamSL;
             UserDomain = GetUser();
            //UserDomain = "wanlapa";

            try {
                Token = idoWS.CreateSessionToken(UserDomain, "SyteLine1234", SiteConf);
                return Token;
            }
            catch (Exception ){

                Token = "";
                return Token;
            }
}



        public DataSet LoadEmployeeAll(String SessToken)
        {
            IDO = "SLEmployees";
            Field = "Name,EmpNum";
            Where = "empUf_UserAD = '" + UserDomain + "'";
            return LoadData(SessToken, IDO, Field, Where, "");

        }

        public void LoadDDL(DropDownList DDL, DataTable DT)
        {
            DDL.DataSource = DT;
            DDL.DataTextField = "name";
            DDL.DataValueField = "code";
            DDL.DataBind();

        }

        public void LoadSite_Ref(DropDownList DDL)
        {
            //DTDDL = DBConnSL.DTSite_Ref();
            //LoadDDL(DDL, DTDDL);
        }

        public DataSet LoadData(String sessionToken, String IDO, String Field, String Where, String Orderby)
        {

            idoDataSet = idoWS.LoadDataSet(sessionToken, IDO, Field, Where, Orderby, "", -1);
            return idoDataSet;

        }
        public object CallIDO(String sessionToken, String IDO, String Method, String Parameters)
        {
            object idoDataSet1;

            try
            {
                idoDataSet1 = idoWS.CallMethod(sessionToken, IDO, Method, ref Parameters);
               
            }
            catch (Exception ex)
            {
                idoDataSet1 = ex.ToString();
            }
            return (idoDataSet1);
        }

    }

}
