<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MaintainEmployee_Draft.aspx.cs" Inherits="HR_Portal.MaintainEmployee_Draft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .max-wide {
            max-width: 100%;
        }

        .datepicker {
            background: #333;
            border: 1px solid #555;
            color: #EEE;
        }

        .img-preview {
            margin: auto;
            max-width: 100%;
            height: 180px;
        }

        .nav-tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }
    </style>
    <div class="page-header">
        <h2>Draft General Information
    <button id="btnmodal" class="btn btn-secondary" type="button" data-toggle="modal">
        <i class="glyphicon glyphicon-search"></i>
    </button>
            <button id="newemp" class="btn btn-info" type="button">New</button>
            <%--<button id="btnModalExport" class="btn btn-warning" type="button">Export</button>--%>
        </h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <button id="btnupdate" class="btn btn-warning" type="button" style="display: none">Save</button>
                <button id="btnsave" class="btn btn-info" type="button">Save</button>
                <button id="transmodal" class="btn btn-danger" type="button" style="display: none" >Transfer</button>
            </div>
        </div>
    </div>
    <!----End Header---->

    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                <label class="control-label">Emp Num :</label>
                                            </div>
                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                <input id="Emp_Num" type="text" name="empnum" class="form-control max-wide" >
                                            </div>
                                        </div>
                                    </div>
                                    <!--- End EmpCode --->

                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-3 col-sm-6 col-xs-12">
                                                <label class="control-label" id="EmpPrefix">Prefix :</label>
                                            </div>
                                            <div class="col-md-9 col-sm-6 col-xs-12">
                                                <label class="radio-inline">
                                                    <input name="Prefix" id="Mr" value="นาย" type="radio" checked /><span id="P1">นาย</span>
                                                </label>
                                                <label class="radio-inline">
                                                    <input name="Prefix" id="Mrs" value="นาง" type="radio" /><span id="P2">นาง</span>
                                                </label>
                                                <label class="radio-inline">
                                                    <input name="Prefix" id="Miss" value="นส." type="radio" /><span id="P3">นางสาว</span>
                                                </label>
                                                <label class="radio-inline">
                                                    <input name="Prefix" id="Other" value="" type="radio" /><span id="P4">ไม่ระบุ</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!--- End Prefix --->
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="row form-group">
                                    <div class="col-md-2 col-sm-6 col-xs-12">
                                        <label class="control-label">Full Name :</label>
                                    </div>
                                    <div class="col-md-5 col-sm-6 col-xs-12">
                                        <input id="Emp_FullName" type="text" class="form-control max-wide" disabled>
                                    </div>
                                    <!--- End Full Name--->
                                    <div class="col-md-2 col-sm-6 col-xs-12">
                                        <label class="control-label">Nick Name :</label>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-xs-12">
                                        <input id="Emp_NickName" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                            </div>
                            <%--End Nickname--%>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                <label class="control-label">First Name :</label>
                                            </div>
                                            <div class="col-md-7 col-sm-6 col-xs-12">
                                                <input id="Emp_FirstName" type="text" class="form-control max-wide">
                                            </div>
                                        </div>
                                    </div>
                                    <!--- End First Name--->

                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                <label class="control-label" id="PMidname">Middel Name :</label>
                                            </div>
                                            <div class="col-md-7 col-sm-6 col-xs-12">
                                                <input id="Emp_MiddelName" type="text" class="form-control max-wide">
                                            </div>
                                        </div>
                                    </div>
                                    <!--- End Middel Name--->
                                </div>

                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                <label class="control-label">Last Name :</label>
                                            </div>
                                            <div class="col-md-7 col-sm-6 col-xs-12">
                                                <input id="Emp_LastName" type="text" class="form-control max-wide">
                                            </div>
                                        </div>
                                    </div>
                                    <!--- End Last Name --->

                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-3 col-sm-6 col-xs-12">
                                                <label class="control-label">Level :</label>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-12">
                                                <input id="Emp_Level" type="text" class="form-control max-wide">
                                            </div>
                                        </div>
                                    </div>
                                    <!--- End Level --->
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <label class="control-label">Position :</label>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="input-group">
                                                    <input type="text" id="Emp_position" class="form-control" disabled />
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default Browse_modal" type="button" data-type="position">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <!----End Position --->
                                            <div class="col-md-1 col-sm-1 col-xs-12">
                                                <label class="control-label">Job Title :</label>
                                            </div>
                                            <div class="col-md-5 col-sm-5 col-xs-12">
                                                <input id="JobTitle" type="text" class="form-control max-wide" disabled>
                                            </div>
                                            <!--- End Jobtitle --->
                                        </div>
                                    </div>
                                    <%--End Position--%>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <label class="control-label">Manager :</label>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="input-group">
                                                    <input id="Emp_ManagerName" type="text" class="form-control max-wide" disabled>
                                                    <div class="input-group-btn">
                                                        <button id="Browse_Emp_ManagerID" class="btn btn-default" type="button">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <input id="Emp_ManagerID" type="text" class="form-control max-wide" style="display: none" disabled>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <label class="control-label">Department :</label>
                                            </div>
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="input-group">
                                                    <input type="text" id="Emp_CostCenter" class="form-control" disabled />
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default Browse_modal" type="button" id="btnCost" data-type="costCenter">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                                <%--<input id="Emp_CostCenter" name="listcostcenter" type="text" class="form-control max-wide" disabled>--%>
                                            </div>
                                            <div class="col-md-1 col-sm-1 col-xs-12">
                                                <label class="control-label">Group:</label>
                                            </div>
                                            <div class="col-md-5 col-sm-5 col-xs-12">
                                                <input id="Emp_Division" name="listdivision" type="text" class="form-control max-wide" disabled>
                                            </div>
                                        </div>
                                        `
                                    </div>
                                    <!--- End Col-md-12 --->

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="row form-group">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <label class="control-label" style="font-size: 13px">Main Company :</label>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <%--<input id="Emp_Company" name="Emplistcomp" type="text" class="form-control max-wide" disabled>--%>
                                                <select class="form-control max-wide" id="Emp_Company">
                                                    <option></option>
                                                </select>
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <label class="control-label">Location :</label>
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <select class="form-control max-wide" id="Emp_Location">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!--- End Col-md-12 --->
                                </div>


                            </div>
                            <!--- End Col-md-12 --->
                        </div>
                        <!--- End Col-md-9 --->

                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="main-img-preview">
                                        <%--<a href="javascript:void(0)" id="Emp_Profile" >
                                            <img class="thumbnail img-preview" src="images/img.png" alt="IMAGE" />
                                        </a>--%>
                                        <img class="thumbnail img-preview" src="images/img.png" alt="IMAGE" id="img-show" />
                                        <%--<div style="display: none;">
                                            <input type="file" name="IEmp_Profile" id="IEmp_Profile">
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End col-md-3 --->
                    </div>
                    <!--- End Col-md-12 --->

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="row form-group">
                                        <div class="col-md-4 col-xs-12">
                                            <label class="control-label">Email :</label>
                                        </div>
                                        <div class="col-md-8 col-xs-12">
                                            <input id="Emp_Email" type="text" class="form-control max-wide">
                                        </div>
                                    </div>
                                </div>
                                <!--- End Email --->

                                <div class="col-md-4 col-sm-3 col-xs-12">
                                    <div class="row form-group">
                                        <div class="col-md-4 col-xs-12">
                                            <label class="control-label">Extension :</label>
                                        </div>
                                        <div class="col-md-5 col-xs-12">
                                            <input id="Emp_Extension" type="text" class="form-control max-wide">
                                        </div>
                                    </div>
                                </div>
                                <!--- End Extension --->

                                <div class="col-md-4 col-sm-3 col-xs-12">
                                    <div class="row form-group">
                                        <div class="col-md-3 col-sm-4 col-xs-12">
                                            <label class="control-label">Business Phone :</label>
                                        </div>
                                        <div class="col-md-9 col-sm-4 col-xs-12">
                                            <input id="Emp_BizPhone" type="tel" class="form-control max-wide">
                                        </div>
                                    </div>
                                </div>
                                <!--- End Biz Phone --->
                            </div>
                        </div>
                    </div>
                    <!--- End Col-md-12 --->

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <div class="row form-group">
                                        <div class="col-md-4 col-xs-12">
                                            <label class="control-label">Status :</label>
                                        </div>
                                        <div class="col-md-5 col-xs-12">
                                            <select id="Emp_Status" class="form-control max-wide">
                                                <option>Active</option>
                                                <option>InActive</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!--- End Emp_Status --->
                            </div>
                        </div>
                    </div>
                    <!--- End Col-md-12 --->
                </div>
            </div>
        </div>
    </div>
    <!---------End New---------->

    <div class="panel nav-tab panel-default">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <li class="nav-item active">
                    <a href="#HR" class="nav-link" role="tab" data-toggle="tab">HR</a>
                </li>   
                  <li class="nav-item disabled">
                    <a href="#TabCompany" class="nav-link disabled-tab" role="tab">Company</a>
                </li>
                <li class="nav-item disabled">
                    <a href="#Benefits" class="nav-link disabled-tab" role="tab" >Benefits</a>
                </li>
                <li class="nav-item disabled">
                    <a href="#Leave" class="nav-link disabled-tab" role="tab">Leave</a>
                </li>
                <li class="nav-item disabled">
                    <a href="#History" class="nav-link disabled-tab" role="tab">History</a>
                </li>
                <li class="nav-item disabled">
                    <a href="#Training" class="nav-link disabled-tab" role="tab">Training</a>
                </li>
                <li class="nav-item disabled">
                    <a href="#JobExpreirenc" class="nav-link disabled-tab" role="tab">Job Experience</a>
                </li>
                <li class="nav-item disabled">
                    <a href="#Education" class="nav-link disabled-tab" role="tab">Education</a>
                </li>
                <li class="nav-item disabled">
                    <a href="#Certificate" class="nav-link disabled-tab" role="tab">Certificate</a>
                </li>
                <%--<li class="nav-item disabled">
                    <a href="#Permission" class="nav-link disabled-tab" role="tab">Permission</a>
                </li>--%>
                <li class="nav-item disabled">
                    <a href="#TabRedirect" class="nav-link disabled-tab" role="tab">Redirect</a>
                </li>
                <li class="nav-item disabled">
                    <a href="#Pyramid" class="nav-link disabled-tab" id="clickpyramid" role="tab">Pyramid</a>
                </li>

            </ul>

            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="HR">
                        <br />
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Hire Date :</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12 date" data-provide="datepicker">
                                        <input placeholder="dd/mm/yyyy" id="Emp_StartDate" type="text" class="form-control notText max-wide" autocomplete="off" >
                                    </div>
                                </div>
                                <!--- End Start Date--->

                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <label class="control-label">EndDate :</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12 date" data-provide="datepicker">
                                        <input placeholder="dd/mm/yyyy" id="Emp_EndDate" type="text" class="form-control notText max-wide" autocomplete="off">
                                    </div>
                                </div>
                                <!--- End yearsexp --->

                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Probation Date :</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12 date" data-provide="datepicker">
                                        <input placeholder="dd/mm/yyyy" id="Emp_HireDate" type="text" class="form-control notText max-wide" autocomplete="off" >
                                    </div>
                                </div>
                                <!--- End Hire date --->
                            </div>
                        </div>
                        <!--End col-md-12-->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Start Longevity :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                         <input id="Emp_StartLongevity" type="number" class="form-control max-wide"  value ="0">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <label class="control-label">Pay Freq :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <select class="form-control max-wide" id="PayFreq">
                                            <option value="">==Please Select==</option>
                                            <option value="D">Daily</option>
                                            <option value="S">Semimonthly</option>
                                            <option value="M">Monthly</option>
                                        </select>
                                    </div>
                                    </div>
                                <!--- End PayFreq --->
                                <%--<div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-4 col-xs-12">
                                        <label class="control-label">Issue :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control max-wide" id="issue" />
                                    </div>
                                </div>--%>
                                <!--- End Issue --->
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <label class="control-label">First Trip Airbroad :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <label class="checkbox">
                                            <input id="FTA" type="checkbox" name="firstTripAirbroad" /></label>
                                    </div>
                                </div>
                                
                                </div>
                                <!--- End First Trip Airbroad --->
                            </div>
                            <!--- End Row --->
                        <!--- End col-md-12 --->


                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">HR Shift ID :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <select class="form-control max-wide" id="Emp_HR_Shift_ID">
                                            <option value="">==Please Select==</option>
                                        </select>
                                    </div>
                                </div>
                                <!--- End Shift ID --->

                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-4 col-xs-12">
                                        <label class="control-label">Emp Type :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <select class="form-control max-wide" id="Emp_Type">
                                            <option value="">==Please Select==</option>
                                            <option value="H">Hourly</option>
                                            <option  value="S" selected>Salaried</option>
                                            <option  value="N">Non-employee</option>
                                        </select>
                                    </div>
                                </div>
                                <!--- End EmpType --->
                            </div>
                            <!--- End Row --->
                        </div>
                        <!--- End col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">ID Card No :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input id="Emp_ID_Card" type="text" class="form-control max-wide" onkeypress="InputNumber(event)">
                                    </div>
                                </div>
                                <!--- End ID Card --->

                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <label class="control-label">ID Card Expired Date :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-5 col-xs-12 date" data-provide="datepicker">
                                        <input placeholder="dd/mm/yyyy" id="Emp_ID_Card_Expired_Date" type="text" class="form-control notText max-wide" autocomplete="off" >
                                    </div>
                                </div>
                                <!--- End expired --->
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Birth Date :</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12 date" data-provide="datepicker">
                                        <input placeholder="dd/mm/yyyy" id="Emp_Birth_Date" type="text" class="form-control notText max-wide" autocomplete="off" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End Col-md-12-->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Gender :</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control max-wide" id="Emp_Gender">
                                            <option value="">=Please Select=</option>
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <label class="control-label">Status :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <select class="form-control max-wide" id="Emp_Marital_Status">
                                            <option value="">=Please Select=</option>
                                            <option>Single</option>
                                            <option>Married</option>
                                            <option>Divorced</option>
                                            <option>Widowed</option>
                                            <option>Living Together</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Children :</label>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input id="Emp_Children" type="text" class="form-control max-wide" onkeypress="InputNumber(event)">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End Col-md-12-->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Religion :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input id="Emp_Religion" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <label class="control-label">Nationality :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <input id="Emp_Nationality" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <label class="control-label" style="font-size: 13px;">Wedding Benefit :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <input id="Emp_WeddingBenefit" type="checkbox">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End Col-md-12-->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Address[1] :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <input id="Emp_Address1" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">District :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input id="Emp_District" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Address[2] :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <input id="Emp_Address2" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">City :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input id="Emp_City" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-4 col-xs-12">
                                        <label class="control-label">Address[3] :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <input id="Emp_Address3" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">County :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input id="Emp_County" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Address[4] :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <input id="Emp_Address4" type="text" class="form-control max-wide">
                                    </div>
                                </div>

                                <div class="col-md-4 col-xs-12">
                                    <div class="col-md-4 col-xs-12">
                                        <label class="control-label">ZipCode :</label>
                                    </div>
                                    <div class="col-md-8 col-xs-12">
                                        <input id="Emp_ZipCode" type="text" class="form-control max-wide" onkeypress="InputNumber(event)">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End Col-md-12-->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Country :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <%-- <select id="Emp_Country" class="form-control max-wide">
                                        </select>--%>
                                        <div class="input-group">
                                            <input type="text" id="Emp_Country" class="form-control max-wide" disabled />
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal" type="button" data-type="Emp_Country">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End Col-md-12-->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Phone :</label>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <input id="Emp_Phone" type="tel" class="form-control max-wide">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End Col-md-12-->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Bank Name :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <%-- <select id="Emp_Bank" class="form-control max-wide">
                                        </select>--%>
                                        <div class="input-group">
                                            <input type="text" id="Emp_Bank" class="form-control max-wide" disabled />
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal" type="button" data-type="Emp_Bank">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Bank Branch:</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <%--<select id="Emp_BankBranch" class="form-control max-wide">
                                        </select>--%>
                                        <div class="input-group">
                                            <input type="text" id="Emp_BankBranch" class="form-control max-wide" disabled />
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal" type="button" data-type="Emp_BankBranch">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <label class="control-label">Bank Account :</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 col-xs-12">
                                        <input id="Emp_BankAccount" type="text" class="form-control max-wide" onkeypress="InputNumber(event)">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Emergency Contact :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input id="Emp_Contact" type="text" class="form-control max-wide">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Emergency Phone :</label>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="Emp_Emergency_Phone" type="tel" class="form-control max-wide">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->
                    </div>
                    <!--End Tab HR-->

                    <div class="tab-pane fade" role="tabpanel" id="TabCompany">
                        <div class="col-md-12 row">
                            <div class="table-responsive">
                                <table class="table table-striped" id="TbListComp">
                                    <thead>
                                        <tr>
                                            <th style="display: none">Employee Code</th>
                                            <th style="width: 30%;">Company</th>
                                            <th style="width: 40%;">Position</th>
                                            <th style="width: 20%;">Group</th>
                                            <th style="width: 10%;">Cost Center</th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListComp">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Tab Company-->
                    <div class="tab-pane fade " role="tabpanel" id="Benefits">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <div class="col-md-3 col-sm-8 col-xs-12">
                                        <label class="control-label">Shift :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-8 col-xs-12">
                                        <select name="cars" id="Bef_Shift" class="form-control">
                                            <option value="">===Please Select===</option>
                                            <option value="SA1">PK : SA1</option>
                                            <option value="SB1">PKM : SB1</option>
                                            <option value="SC1">PKT : SC1</option>
                                            <option value="SH1">TG : SH1</option>
                                            <option value="SF1">HA : SF1</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--End Shift--%>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <div class="col-md-3 col-sm-4 col-xs-12">
                                        <label class="control-label">HR Province :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-8 col-xs-12">
                                        <div class="input-group">
                                            <input id="HRProvince" type="text" class="form-control max-wide" disabled>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal" type="button" data-type="province">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5 col-sm-4 col-xs-12">
                                    <div class="col-md-3 col-sm-4 col-xs-12">
                                        <label class="control-label">OT Location :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-6 col-xs-12 date">
                                        <%--<div id="OTLocation">--%>
                                        <input id="OTLocation" type="text" class="form-control notText max-wide" autocomplete="off" disabled>
                                        <%--</div>--%>
                                    </div>
                                </div>
                                <!--- End OT Location--->
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-5 col-sm-8 col-xs-12">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <label class="control-label">Zone ID :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <div class="input-group">
                                            <input id="ZoneID" type="text" class="form-control max-wide" disabled>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal" type="button" data-type="zoneid">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--End Zone ID--%>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <label class="control-label" style="font-size: 12.5px;">HR Country :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12">
                                        <div class="input-group">
                                            <input id="HRCountry" type="text" class="form-control max-wide" disabled>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal" type="button" data-type="country">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--END HR Country :--%>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-5 col-sm-4 col-xs-12">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <label class="control-label">Employee Group :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12 date" data-provide="datepicker">
                                        <div class="input-group">
                                            <input id="Emp_group" type="text" class="form-control max-wide" disabled>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal" type="button" data-type="empgroup">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--- End Employee Group--->
                                <div class="col-md-5 col-sm-4 col-xs-12">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <label class="control-label">Employee Scrub :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12 date" data-provide="datepicker">
                                        <select id="Emp_scrub" class="form-control">
                                            <option value="1">Yes</option>
                                            <option value="0" selected>NO</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Employee Scrub--->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-5 col-sm-4 col-xs-12">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <label class="control-label">Employee Spray :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12 date" data-provide="datepicker">
                                        <select id="Emp_spray" class="form-control">
                                            <option value="1">Yes</option>
                                            <option value="0" selected>NO</option>
                                        </select>
                                    </div>
                                </div>
                                <!--- End Employee Spray --->
                                <div class="col-md-5 col-sm-4 col-xs-12">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <label class="control-label">Emp Carrate :</label>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12 date" data-provide="datepicker">
                                        <select id="Emp_carrate" class="form-control">
                                            <option value="0.00" selected>0.00</option>
                                            <option value="4.00">4.00</option>
                                            <option value="5.00">5.00</option>
                                            <option value="7.00">7.00</option>

                                        </select>
                                    </div>
                                </div>
                            </div>

                            <!--- End Emp Carrate  --->
                        </div>
                    </div>
                    <%--End Benefit--%>
                    <div class="tab-pane fade" role="tabpanel" id="Leave">
                        <br>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">UserName :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <input id="UserName" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Leave :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <select class="form-control" id="EmpLeave"></select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">Start Date :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12" data-provide="datepicker">
                                        <input placeholder="dd/mm/yyyy" id="StartDate" type="text" class="form-control notText max-wide" autocomplete="off">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <label class="control-label">End Date :</label>
                                    </div>
                                    <div class="col-md-8 col-sm-8 col-xs-12" data-provide="datepicker">
                                        <input placeholder="dd/mm/yyyy" id="EndDate" type="text" class="form-control notText max-wide" autocomplete="off">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <div class="col-md-4 col-xs-12 col-sm-4">
                                        <label class="control-label">Redirect :</label>
                                    </div>
                                    <div class="mol-md-8 col-xs-12 col-sm-8">
                                        <div class="input-group">
                                            <input class="form-control" type="text" id="Redirect" style="min-width: 100%;" readonly>
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-default" id="btnbrowseuser">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="col-md-4 col-xs-12 col-sm-4">
                                        <%--<label class="control-label">Redirect :</label>--%>
                                    </div>
                                    <div class="mol-md-8 col-xs-12 col-sm-8">
                                        <div class="input-group">
                                            <%-- <%--input class="form-control" type="text" id="Redirect">--%>
                                            <div class="input-group-btn">
                                                <%-- <button type="button" class="btn btn-default">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12" style="display: none">
                                    <div class="col-md-4 col-xs-12 col-sm-4">
                                        <label class="control-label">Emp_num :</label>
                                    </div>
                                    <div class="mol-md-8 col-xs-12 col-sm-8">
                                        <input id="empleavenum" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: right">
                                    <button type="button" class="btn btn-success" id="btnLeave">Add Row</button>
                                </div>
                            </div>
                        </div>
                        <!--- End Col-md-12 --->
                        <br>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="table-responsive">
                                <table class="table table-striped " id="TbLeave">
                                    <thead>
                                        <tr>
                                            <th style="width: 5px; display: none">emp_num</th>
                                            <th>UserName</th>
                                            <th>Leave</th>
                                            <th>start Date</th>
                                            <th>End Date</th>
                                            <th>Redirect</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListLeave">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--- End Tab leave --->
                    <div class="tab-pane fade" role="tabpanel" id="History">History</div>
                    <div class="tab-pane fade" role="tabpanel" id="Training">Training</div>
                    <div class="tab-pane fade" role="tabpanel" id="JobExpreirenc">
                        <%--Job-Expreirenc--%>
                        <div class="col-md-12 row">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered" id="TbListJobExp">
                                    <thead>
                                        <tr>
                                            <%--<th style="width: 20px;">Employee Code</th>--%>
                                            <th>Company</th>
                                            <th>Job Title</th>
                                            <th>End Date</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListJobExp">
                                        <tr>
                                            <%--<td>
                                                <input type="text" class="form-control max-wide" id="Emp_Num_job"></td>--%>
                                            <td>
                                                <input type="text" class="form-control max-wide" id="JobExpComp"></td>
                                            <td>
                                                <input type="text" class="form-control max-wide" id="JobExpTitle"></td>
                                            <td class="date" data-provide="datepicker">
                                                <input placeholder="dd/mm/yyyy" type="text" class="form-control notText max-wide" id="JobExpEnd" autocomplete="off"></td>
                                            <td>
                                                <button type="button" class="btn btn-info" id="btnAddJob">Add Row</button></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Tab Job-->


                    <div class="tab-pane fade" role="tabpanel" id="Education">
                        Education
                        <%--                        <div class="col-md-12 col-xs-12">
                            <div class="row form-group">
                                <table id="TB_Edu" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 20px; display: none">Employee Code</th>
                                            <th>Level</th>
                                            <th>Institution</th>
                                            <th>Faculty</th>
                                            <th>Major</th>
                                            <th style="width: 20px">Graduate</th>
                                            <th></th>
                                            <th></th>

                                        </tr>
                                    </thead>
                                    <tbody id="ListEdu">
                                        <tr>
                                            <td>
                                                <input type="text" id="Emp_Num_Edu" class="form-control max-wide"></td>
                                            <td>
                                                <input type="text" id="Level" class="form-control max-wide"></td>
                                            <td>
                                                <input type="text" id="Institution" class="form-control max-wide"></td>
                                            <td>
                                                <input type="text" id="Faculty" class="form-control max-wide"></td>
                                            <td>
                                                <input type="text" id="Major" class="form-control max-wide"></td>
                                            <td>
                                                <input type="text" id="Graduate" class="form-control max-wide"></td>
                                            <td>
                                                <button type="button" class="btn btn-info" id="btnAddEdu">Add Row</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>--%>
                    </div>
                    <!--End Tab Education-->

                    <div class="tab-pane fade" role="tabpanel" id="Certificate">
                        Certificate
                        <%--                        <div class="col-md-12 col-xs-12">
                            <div class="row form-group">
                                <table id="TB_Certificate" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 20px; display: none">Employee Code</th>
                                            <th>Certificate</th>
                                            <th>Description</th>
                                            <th style="width: 20px"></th>
                                            <th style="width: 20px"></th>
                                            <th style="width: 20px"></th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListCer">
                                        <tr>
                                            <td>
                                                <input type="text" class="form-control max-wide" id="Emp_Num_Cer"></td>
                                            <td>
                                                <div class="form-group">
                                                    <input type="file" class="form-control max-wide" id="AddCer">
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control max-wide" id="CerDesc"></td>
                                            <td>
                                                <button type="button" class="btn btn-info" id="btnAddCer">Add Row</button></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>--%>
                    </div>
                    <!--End Tab Certificate-->

                    <div class="tab-pane fade" role="tabpanel" id="Permission">
                        <div class="col-md-12 col-xs-12">
                            <div class="row form-group">
                                <table id="TB_Permission" class="table  table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 20px; display: none">Employee Code</th>
                                            <th>User Name</th>
                                            <th>Permission Type</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListPer">
                                        <tr>
                                            <td style="display: none">
                                                <input type="text" class="form-control max-wide" id="Emp_Num_Per"></td>
                                            <td>
                                                <input type="text" class="form-control max-wide" id="peruser"></td>
                                            <td>
                                                <select class="form-control max-wide" id="pertype">
                                                    <option>===Select Type===</option>
                                                    <option>UserAD</option>
                                                    <option>ERP</option>
                                                    <option>K2</option>
                                                    <option>SalesForce</option>
                                                </select></td>
                                            <td>
                                                <button type="button" class="btn btn-info" id="btnAddPer">Add Row</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Tab Permission-->

                    <div class="tab-pane fade" role="tabpanel" id="Pyramid" style="height: 500px">
                        <iframe id="Orgchart" name="org" style="min-width: 100%; min-height: 100%"></iframe>
                    </div>

                    <%--Tab Redirect--%>
                    <div class="tab-pane fade" role="tabpanel" id="TabRedirect">
                        <div class="col-md-12 row">
                            <div class="table-responsive">
                                <table class="table table-striped" id="TbListRedirect">
                                    <thead>
                                        <tr>
                                            <th>K2 ID</th>
                                            <th>WF Type</th>
                                            <th>Subject</th>
                                            <th>CreateDate </th>
                                            <th>Viewflow </th>
                                            <th>Redirect</th>
                                        </tr>
                                    </thead>
                                    <tbody id="ListRediRedirectrect">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--End Tab Redirect-->
                    <!--End Tab Pyramid-->

                    <%--Export Modal--%>
                    <div class="modal fade" id="modalExport" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                        <h4 class="modal-title">Export Employee</h4>
                                    </div>
                                </div>
                                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                                    <div class="col-md-12 col-lg-12 col-sm-12">
                                        <%--Left--%>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3 col-xs-3">
                                                    <label class="control-label" style="font-size: 13px">Company:</label>
                                                </div>
                                                <div class="col-md-9 col-sm-9 col-xs-9">
                                                    <select class="form-control max-wide" id="Emp_CompanyExport">
                                                        <option></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <%--End Emp_CompanyExport--%>

                                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <label class="control-label" style="font-size: 13px">Business Group:</label>
                                                </div>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="Emp_GroupExport" name="listdivision" type="text" class="form-control max-wide" disabled>
                                                        <input id="Emp_GroupIDExport" name="listdivision" type="hidden" class="form-control max-wide" disabled>
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" id="btnCostExport" data-type="GroupExport">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--End Emp_GroupExport--%>
                                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <label class="control-label" style="font-size: 13px">Department Start:</label>
                                                </div>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input type="text" id="Emp_CostCenterStartExport" class="form-control" disabled />
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" id="btnCostStartExport" data-type="costCenterStartExport">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--End Emp_CostCenterStartExport--%>

                                            <div class="col-md-12 col-lg-12 col-sm-12">
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <label class="control-label" style="font-size: 13px">Stauts :</label>
                                                </div>
                                                <div class="col-md-4 col-sm-3 col-xs-12">
                                                    <label class="control-label" style="font-size: 13px;">Active :</label>
                                                    <input id="ExportActive" type="checkbox">
                                                </div>
                                                <div class="col-md-4 col-sm-3 col-xs-12">
                                                    <label class="control-label" style="font-size: 13px;">InActive :</label>
                                                    <input id="ExportInActive" type="checkbox">
                                                </div>
                                            </div>
                                            <%--End Emp_Status--%>
                                        </div>
                                        <%--Right--%>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em; padding-top: 105px;">
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <label class="control-label" style="font-size: 13px">Department End:</label>
                                                </div>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input type="text" id="Emp_CostCenterEndExport" class="form-control" disabled />
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" id="btnCostEndExport" data-type="costCenterEndExport">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <%--Start Table Export--%>
                                    <div class="col-md-12">
                                        <div class="table-responsive" style="max-height: 18em; overflow-y: scroll;">
                                            <table id="TableEmpExport">
                                                <thead id="theaderEmpExport">
                                                </thead>
                                                <tbody id="tbodyEmpExport">
                                                </tbody>
                                            </table>
                                            <input type="hidden" name="CustomerJSON" />
                                        </div>
                                    </div>
                                </div>
                                <%--End Table Export--%>
                                <div class="modal-footer">
                                    <%--<button id="btnExport" class="btn btn-info" type="button">Search</button>--%>
                                    <%--<asp:Button runat="server" Class="btn btn-warning" Text="Export" ID="exportTableC" OnClientClick="GetExport(); this.disabled=true ;" OnClick="exportTableC_Click" />--%>
                                    <%--<asp:Button runat="server" Class="btn btn-warning" Text="Export" ID="exportTableC" OnClientClick="GetExport();" OnClick="exportTableC_Click" />--%>
                                    <button type="button" class="btn btn-default" id="exportClose" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Export Modal--%>


                   <div class="modal fade" id="modalEmp" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-xs">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                        <div class="col-md-9 col-lg-9 col-sm-12">
                                            <h4 class="modal-title">Employee</h4>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <div id="ModalHeaderSerach">
                                        <div class="col-md-12 col-lg-12 col-sm-12 DispalySearchArea" id="search-area1">
                                            <div class="form-group col-md-10 col-lg-10 col-sm-10 multiSearch" style="margin-bottom: 6px">
                                                <div class="input-group">
                                                    <div class="input-group-btn">
                                                        <select class="form-control fillterSearch" style="width: 120px;">
                                                            <option value="">ALL</option>
                                                            <option value="[Emp_Num]">Emp Num</option>
                                                            <option value="[Emp_FirstName]">Name</option>
                                                            <option value="[Emp_ManagerName]">Manager</option>
                                                            <option value="[Department]">Department</option>
                                                            <option value="[Emp_Location]">Location</option>
                                                            <%--<option>Group</option>
                                                        <option>Main Company</option>--%>
                                                            <option value="[DataType]" >Draft</option>
                                                        </select>
                                                    </div>
                                                    <!-- /btn-group -->
                                                    <input type="text" placeholder="Search for Employee ..." title="Type in a name" class="form-control max-wide myInputEmp" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2 col-lg-2 col-sm-2 multiSearchBtn" style="margin-bottom: 6px">
                                                <button type="button" class="btn btn-success max-wide " id="addSearch"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                                    <table id="TbListEmployee" class="table table-striped table-bordered table-responsive">
                                        <thead>
                                            <tr class="header">
                                                <th style="width: 30px">Employee Code</th>
                                                <th>Name</th>
                                                <%--<th>Emp_extension</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyemp'></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--- End Modal Emp --->

                    <div class="modal fade" id="ModalUserAd" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-xs">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                        <div class="col-md-9 col-lg-9 col-sm-12">
                                            <h4 class="modal-title">Employee</h4>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12">
                                        <div class="form-group col-md-9 col-lg-9 col-sm-12">
                                            <input type="text" id="InputUserAD" placeholder="Search for Employee Code..." title="Type in a name" class="form-control max-wide" autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                                    <table id="TbListUserAd" class="table table-striped table-bordered table-responsive">
                                        <thead>
                                            <tr class="header">
                                                <th style="width: 30px">Employee Code</th>
                                                <th>UserAD</th>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyUserAd'></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--- End Modal User --->


                    <%--start--%>
                    <div class="modal fade" id="modalEmpManager" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-xs">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                        <div class="col-md-9 col-lg-9 col-sm-12">
                                            <h4 class="modal-title">Employee</h4>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12">
                                        <div class="form-group col-md-9 col-lg-9 col-sm-12">
                                            <input type="text" id="myInputEmpManager" placeholder="Search for Employee Code..." title="Type in a name" class="form-control max-wide" autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                                    <table id="TbListEmployeeManager" class="table table-striped table-bordered table-responsive">
                                        <thead>
                                            <tr class="header">
                                                <th style="width: 30px">Employee Code</th>
                                                <th>Name</th>
                                                <%--<th>Emp_extension</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyempManager'></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--modal emp UserRedirect--%> 
                    <div class="modal fade" id="ModalUserRedirect" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-xs">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                        <div class="col-md-9 col-lg-9 col-sm-12">
                                            <h4 class="modal-title">Redirect To</h4>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12">
                                        <div class="form-group col-md-9 col-lg-9 col-sm-12">
                                            <input type="text" id="InputUserRedirect" placeholder="Search for Employee Code..." title="Type in a name" class="form-control max-wide" autocomplete="off">
                                            
                                            <input type="hidden" id="K2Redirect" disabled >
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                                    <table id="TbListUserRedirect" class="table table-striped table-bordered table-responsive">
                                        <thead>
                                            <tr class="header">
                                                <th style="width: 30px">Employee</th>
                                                <th>Full name</th>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyUserRedirect'></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--modal emp UserRedirect--%>

                    <div class="modal fade" id="modalBrowse" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-xs">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                        <div class="col-md-9 col-lg-9 col-sm-12">
                                            <h4 id="browseHeader" class="modal-title">Text</h4>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12">
                                        <div class="form-group col-md-9 col-lg-9 col-sm-12">
                                            <div id="search_box">
                                                <%--<input type="text" id="SearchBrowse" placeholder="Search.." class="form-control max-wide" autocomplete="off">--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                                    <table id="TbListBrowse" class="table table-striped table-bordered table-responsive">
                                        <thead>
                                            <tr class="header">
                                                <th style="width: 20%">ID</th>
                                                <th>Title</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyBrowse'></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--modalTransfer  --%>
                    <div class="modal fade" id="modalTransfer" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                        <h4 class="modal-title">Tranfer Master Employee</h4>
                                    </div>
                                </div>
                                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                                        <div class="col-md-12 col-lg-12 col-sm-12">
                                            <h5>Employee Number </h5>
                                        </div>
                                        <div class="col-md-12 col-lg-12 col-sm-12">
                                            <input type="text" class="form-control max-wide" id="transInput" placeholder="New Employee Num" onkeypress="InputNumber(event)" />
                                         </div>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button id="transfer" class="btn btn-danger" type="button">Transfer</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End modalTransfer  --%>

                    <%--Change page  --%>
                    <div class="modal fade" id="modalDraftEmp" role="dialog" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog modal-md">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                                        <h4 class="modal-title">New Employee</h4>
                                    </div>
                                </div>
                                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                                    <div class="col-md-12 col-lg-12 col-sm-12" >
                                        <div class="col-md-6 col-lg-6 col-sm-12" style="border-right: solid 1px #ccc;" >
                                            <input class="form-control max-wide" type="button" onclick="window.location.href = 'MaintainEmployee.aspx'" value="New Employee" />
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-sm-12" >
                                            <input class="form-control max-wide" type="button" onclick="window.location.href = 'MaintainEmployee_Draft.aspx'" value="New Draft Employee" />
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Change Page  --%>

                </div>
            </div>
        </div>

    <%-------------------------------------------------END HR TABS--------------------------------------------%>

    <script type="text/javascript">
        
        $(document).ready(function () {

            

            var emp_num = getAllUrlParams("Emp_Num");
            var getemp = (typeof emp_num === "undefined") ? "" : (emp_num);
            var browse_type;
            //document.getElementById("MainContent_exportTableC").disabled=true;

            $(".fillterSearch").val("[DataType]");

            sessionStorage.setItem('Bank_ID', '');
            sessionStorage.setItem('Bank_Branch', '');
            sessionStorage.setItem('Emp_Country', '');
            sessionStorage.setItem('Page_type', 'Draft');

            if (localStorage.getItem("type") == "EN") {
                //alert("type","Prefix");
                $("#P1").text("Mr.");
                $("#P2").text("Mrs.");
                $("#P3").text("Miss");
                $("#P4").text("Other");
                $("#Mr").val("Mr.");
                $("#Mrs").val("Mrs.");
                $("#Miss").val("Miss");
                $("#Other").val("");

            } else {
                $("#Emp_MiddelName").hide();
                $("#PMidname").hide();
            }



            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/getHrshiftID")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: getHrShiftID
            });


          <%--  $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetBank")%>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ TypeName: "Vendor Bank" , search : ''}),
                success: GetBank
            });--%>



            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetLocation")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetLocation
            });

            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetSiteRef")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetMainCompany
            });

            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetSiteRef")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetMainCompanyExport
            });

            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetSiteRef")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetSiteRef
            });

            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/Gettypeleave")%>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: GetTypeLeave
            });

            if (getemp != "") {
                $("#btnupdate").show();
                $("#transmodal").show();
                $("#btnsave").hide();
                //$("#Emp_Profile").hide();
                //$("#img-show").show();
                //$(".nav-item").removeClass('disabled');
                //$(".disabled-tab").attr("data-toggle", "tab");

                //alert(localStorage.getItem("getemp"));
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/GetListEmployee_Draft") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Emp_Num: getemp, search: "", type: localStorage.getItem("type"), fillter:"" }),
                    success: function (response) {
                        console.log(response.d);
                        if (response.d.length > 0) {
                            $("#Emp_Num").val(response.d[0][0]);
                            $("#Emp_Code_Comp").val(response.d[0][0]);
                            $("#Language").val(response.d[0][1]);
                            $("input[name=Prefix]").each(function () { $(this).val() == response.d[0][2] ? $(this).prop("checked", true) : ""; });
                            //$("#IEmp_Profile").val(response.d[0][3]);
                            //$('#Emp_Profile .img-preview').attr('src', "http:" + response.d[0][3]);
                            $('#img-show').attr('src', "http:\\\\pkflow01\\ImageEmployee\\" + response.d[0][0] + ".png");
                            $("#Emp_FullName").val(response.d[0][4] + " " + response.d[0][5]);
                            $("#Emp_NickName").val(response.d[0][41]);
                            $("#Emp_FirstName").val(response.d[0][4]);
                            $("#Emp_LastName").val(response.d[0][5]);
                            $("#Emp_MiddelName").val(response.d[0][6]);
                            $("#Emp_Level").val(response.d[0][7]);
                            //$("#JobTitle").val(response.d[0][8]);
                            $("#Emp_Location").val(response.d[0][9]);
                            $("#Emp_Email").val(response.d[0][10]);
                            $("#Emp_Extension").val(response.d[0][11]);
                            $("#Emp_BizPhone").val(response.d[0][12]);
                            $("#Emp_StartDate").val(response.d[0][13].includes("-") ? formatDate(response.d[0][13].substring(0,10)) : response.d[0][13].substring(0,10));
                            $("#Emp_EndDate").val(response.d[0][41].includes("-") ? formatDate(response.d[0][41].substring(0,10)) : response.d[0][41].substring(0,10));
                            $("#Emp_HireDate").val(response.d[0][14].includes("-") ? formatDate(response.d[0][14].substring(0,10)) : response.d[0][14].substring(0,10));
                            $("#Emp_HR_Shift_ID").val(response.d[0][15]?response.d[0][15]:'');
                            $("#Emp_Type").val(response.d[0][16]?response.d[0][16]:'');
                            $("#Emp_ID_Card").val(response.d[0][17]);
                            $("#Emp_ID_Card_Expired_Date").val(response.d[0][18].includes("-") ? formatDate(response.d[0][18].substring(0,10)) : response.d[0][18].substring(0,10));
                            $("#Emp_Birth_Date").val(response.d[0][19].includes("-") ? formatDate(response.d[0][19].substring(0,10)) : response.d[0][19].substring(0,10));
                            $("#Emp_Gender").val(response.d[0][20]?response.d[0][20]:'');
                            $("#Emp_Nationality").val(response.d[0][21]);
                            $("#Emp_Religion").val(response.d[0][22]);
                            $("#Emp_Marital_Status").val(response.d[0][23]?response.d[0][23]:'');
                            $("#Emp_Children").val(response.d[0][24]);
                            $("#Emp_Address1").val(response.d[0][25]);
                            $("#Emp_Address2").val(response.d[0][26]);
                            $("#Emp_Address3").val(response.d[0][27]);
                            $("#Emp_Address4").val(response.d[0][28]);
                            $("#Emp_District").val(response.d[0][29]);
                            sessionStorage.setItem('Emp_Country', response.d[0][30]);
                            $("#Emp_City").val(response.d[0][31]);
                            $("#Emp_County").val(response.d[0][32]);
                            $("#Emp_ZipCode").val(response.d[0][33]);
                            $("#Emp_Phone").val(response.d[0][34]);
                            sessionStorage.setItem('Bank_ID', response.d[0][35]);
                            sessionStorage.setItem('Bank_Branch', response.d[0][36]);
                            $("#Emp_BankAccount").val(response.d[0][37]);
                            $("#Emp_Contact").val(response.d[0][38]);
                            $("#Emp_Emergency_Phone").val(response.d[0][39]);
                            $("#Emp_Status").val(response.d[0][40]);
                            $("#Emp_position").val(response.d[0][42]);
                            $("#Emp_NickName").val(response.d[0][43]);
                            $("#Emp_ManagerID").val(response.d[0][44]);
                            $("#Emp_ManagerName").val(response.d[0][45]);
                            $("#PayFreq").val(response.d[0][46] ? response.d[0][46] : '');
                            $("#FTA").prop('checked', (response.d[0][47] == 'True' ? true : false));
                            $("#Emp_CostCenter").val(response.d[0][48]);
                            $("#Emp_Company").val(response.d[0][49]);
                            $("#Bef_Shift").val(response.d[0][50]);
                            $("#HRProvince").val(response.d[0][51]);
                            $("#HRCountry").val(response.d[0][52]);
                            $("#ZoneID").val(response.d[0][53]);
                            $("#OTLocation").val(response.d[0][54]);
                            $("#Emp_group").val(response.d[0][55]);
                            $("#Emp_scrub").val((response.d[0][56]) == 'True' ? 1 : 0);
                            $("#Emp_spray").val((response.d[0][57]) == 'True' ? 1 : 0);
                            $("#Emp_carrate").val(response.d[0][58]);
                            $("#Emp_WeddingBenefit").prop('checked', (response.d[0][59] == 'True' ? true : false));
                            $("#Emp_StartLongevity").val(response.d[0][60]);
                            //console.log(response.d[0]);
                        }

                    }
                });

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUserAD")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ user: getemp, search: "" }),
                    success: GetUsername
                });

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/Getleave")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EmpNum: getemp }),
                    success: Getleave
                });

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListCompany") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Empcomp: getemp, Main: '0' }),
                    success: getlistcomp
                });



                <%--$.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListPermission")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ID: getemp }),
                    success: GetListPermission
                });--%>

                var department = $("#Emp_CostCenter").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Company")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: department }),
                    success: GetListBUGroup
                });

                var jobtitle = $("#Emp_position").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetPosition")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: jobtitle }),
                    success: GetPosition
                });

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetBank")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TypeName: 'Vendor Bank', search: sessionStorage.getItem('Bank_ID') }),
                    success: GetBank_ID
                });
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetBank")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TypeName: 'Vendor Branch', search: sessionStorage.getItem('Bank_Branch') }),
                    success: GetBranch
                });
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/ShowCountry")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: sessionStorage.getItem('Emp_Country') }),
                    success: GetCountry
                });
                <%--$.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetJobExp")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: $("#Emp_Num").val() }),
                    success: getlistjob
                });--%>
                  $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetTbListRedirect")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search : $("#UserName").val() }),
                    success: GetTbListRedirect
                });

                //<---------------------------------------------------------END IF--------------------------------------------------->
            } else {
                  if (!sessionStorage.getItem('newEmp')) {
                    $('#modalEmp').modal('show');
                }
                $("#TBbodyemp").empty();
                var fragment = "";
                var type = localStorage.getItem("type");
                var Search = new Array();
                var fillter = new Array();
                $(document).find(".DispalySearchArea").each(function (index, val) {
                    var text = $(this).find("input[type=text]").val();
                    var column = $(this).find("Select option:selected").val();
                    Search.push(text);
                    fillter.push(column);
                });

                //$("#Emp_Profile").show();
                //$("#img-show").hide();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_GetListEmployee") %>",//new
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: Search,
                        fillter: fillter,
                        type: type
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empnum = val[0];
                                var name = val[4];
                                var lastname = val[5];
                                var dataType = val[60];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + empnum + '</a></td>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + name + " " + lastname + '</a></td>';
                                fragment += '<td style="display:none"><a class="clickselectemp" href="javascript:void(0)" >' + dataType + '</a></td>';
                                //fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + lastname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyemp").append(fragment);
                    }
                });
            }

            $("#btnsave").on('click', function () {
                //if ($('#Emp_Company').val() == '' || $('#PayFreq').val() == '' || $('#Emp_HR_Shift_ID').val() == '' || $('#Emp_Type').val() == '' || $('#Bef_Shift').val() == '') {
                //    alert("Please fill all input boxes.");
                //} else {
                //console.log(getemp);
                var Emp_Num = $("#Emp_Num").val();
                var Language = $("#Language").val();
                var Emp_Prefix = $("input[name=Prefix]:Checked").val();
                //var Emp_Profile = "\\\\pkflow01\\Syteline Pic\\Staff Picture\\" + Emp_Num + "." + (($('#IEmp_Profile').val()).replace(/^.*\./, '')).toLowerCase();
                //var Emp_Profile = "\\\\pkflow01\\ImageEmployee\\" + Emp_Num ;
                var Emp_Profile = '';
                var Emp_FirstName = $("#Emp_FirstName").val();
                var Emp_LastName = $("#Emp_LastName").val();
                var Emp_MidderName = $("#Emp_MiddelName").val();
                var Emp_Level = $("#Emp_Level").val();
                var Emp_Level = $("#Emp_Level").val();
                var Emp_JobTitle = '';
                var Emp_Location = $("#Emp_Location").val();
                var Emp_Email = $("#Emp_Email").val();
                var Emp_Extension = $("#Emp_Extension").val();
                var Emp_Comp_Phone = $("#Emp_BizPhone").val();
                var Emp_StartDate = $("#Emp_StartDate").val() == null ? '' : $("#Emp_StartDate").val();
                var Emp_EndDate = $("#Emp_EndDate").val() == null ? '' : $("#Emp_EndDate").val();
                var Emp_HireDate = $("#Emp_HireDate").val() == null ? '' : $("#Emp_HireDate").val();
                var Emp_HR_Shift_ID = $("#Emp_HR_Shift_ID").val();
                var Emp_Type = $("#Emp_Type").val();
                var Emp_ID_Card = $("#Emp_ID_Card").val();
                var Emp_ID_Card_Expired_Date = $("#Emp_ID_Card_Expired_Date").val();
                var Emp_Birth_Date = $("#Emp_Birth_Date").val();
                var Emp_Gender = $("#Emp_Gender").val();
                var Emp_Nationality = $("#Emp_Nationality").val();
                var Emp_Religion = $("#Emp_Religion").val();
                var Emp_Marital_Status = $("#Emp_Marital_Status").val();
                var Emp_Children = $("#Emp_Children").val();
                var Emp_Address1 = $("#Emp_Address1").val();
                var Emp_Address2 = $("#Emp_Address2").val();
                var Emp_Address3 = $("#Emp_Address3").val();
                var Emp_Address4 = $("#Emp_Address4").val();
                var Emp_District = $("#Emp_District").val();
                var Emp_Country = sessionStorage.getItem('Emp_Country');
                var Emp_City = $("#Emp_City").val();
                var Emp_County = $("#Emp_County").val();
                var Emp_ZipCode = $("#Emp_ZipCode").val();
                var Emp_Phone = $("#Emp_Phone").val();
                var Emp_Bank = sessionStorage.getItem('Bank_ID');
                var Emp_BankBranch = sessionStorage.getItem('Bank_Branch');
                var Emp_BankAccount = $("#Emp_BankAccount").val();
                var Emp_Emergency_Contact = $("#Emp_Contact").val();
                var Emp_Emergency_Phone = $("#Emp_Emergency_Phone").val();
                var Emp_Status = $("#Emp_Status").val();
                var Emp_Position = $("#Emp_position").val();
                var Emp_NickName = $("#Emp_NickName").val();
                var Emp_ManagerID = $("#Emp_ManagerID").val();
                var Emp_ManagerName = $("#Emp_ManagerName").val();
                var Emp_StartLongevity = $("#Emp_StartLongevity").val();
                var PayFreq = $("#PayFreq").val();
                var FirstTripAirbroad = ($("#FTA").is(':checked') ? 1 : 0);
                var Bef_Shift = $("#Bef_Shift").val()
                var Bef_HRProvince = $("#HRProvince").val();
                var Bef_HRCountry = $("#HRCountry").val();
                var Bef_ZoneID = $("#ZoneID").val();
                var Bef_OTLocation = $("#OTLocation").val();
                var Bef_EmpGroup = $("#Emp_group").val();
                var Bef_EmpScrub = parseInt($("#Emp_scrub").val());
                var Bef_EmpSpray = parseInt($("#Emp_spray").val());
                var Bef_EmpCarrate = $("#Emp_carrate").val();
                var Department = $("#Emp_CostCenter").val();
                var Main_Company = $("#Emp_Company").val();
                var Emp_WeddingBenefit = $("#Emp_WeddingBenefit").is(':checked') ? 1 : 0;

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Draft") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: Emp_Num,
                        Language: localStorage.getItem("type"),
                        Emp_Prefix: Emp_Prefix,
                        Emp_Profile: Emp_Profile,
                        Emp_FirstName: Emp_FirstName,
                        Emp_LastName: Emp_LastName,
                        Emp_MidderName: Emp_MidderName,
                        Emp_Level: Emp_Level,
                        Emp_JobTitle: Emp_JobTitle,
                        Emp_Location: Emp_Location,
                        Emp_Email: Emp_Email,
                        Emp_Extension: Emp_Extension,
                        Emp_Comp_Phone: Emp_Comp_Phone,
                        Emp_StartDate: Emp_StartDate,
                        Emp_EndDate: Emp_EndDate,
                        Emp_HireDate: Emp_HireDate,
                        Emp_HR_Shift_ID: Emp_HR_Shift_ID,
                        Emp_Type: Emp_Type,
                        Emp_ID_Card: Emp_ID_Card,
                        Emp_ID_Card_Expired_Date: Emp_ID_Card_Expired_Date,
                        Emp_Birth_Date: Emp_Birth_Date,
                        Emp_Gender: Emp_Gender,
                        Emp_Nationality: Emp_Nationality,
                        Emp_Religion: Emp_Religion,
                        Emp_Marital_Status: Emp_Marital_Status,
                        Emp_Children: Emp_Children,
                        Emp_Address1: Emp_Address1,
                        Emp_Address2: Emp_Address2,
                        Emp_Address3: Emp_Address3,
                        Emp_Address4: Emp_Address4,
                        Emp_District: Emp_District,
                        Emp_Country: Emp_Country,
                        Emp_City: Emp_City,
                        Emp_County: Emp_County,
                        Emp_ZipCode: Emp_ZipCode,
                        Emp_Phone: Emp_Phone,
                        Emp_Bank: Emp_Bank,
                        Emp_BankBranch: Emp_BankBranch,
                        Emp_BankAccount: Emp_BankAccount,
                        Emp_Emergency_Contact: Emp_Emergency_Contact,
                        Emp_Emergency_Phone: Emp_Emergency_Phone,
                        Emp_Status: Emp_Status,
                        Emp_Position: Emp_Position,
                        Emp_NickName: Emp_NickName,
                        Emp_ManagerID: Emp_ManagerID,
                        Emp_ManagerName: Emp_ManagerName,
                        Emp_StartLongevity: Emp_StartLongevity,
                        PayFreq: PayFreq,
                        FirstTripAbroad: FirstTripAirbroad,
                        Department: Department,
                        Main_Company: Main_Company,
                        Bef_Shift: Bef_Shift,
                        Bef_HRProvince: Bef_HRProvince,
                        Bef_HRCountry: Bef_HRCountry,
                        Bef_ZoneID: Bef_ZoneID,
                        Bef_OTLocation: Bef_OTLocation,
                        Bef_EmpGroup: Bef_EmpGroup,
                        Bef_EmpScrub: Bef_EmpScrub,
                        Bef_EmpSpray: Bef_EmpSpray,
                        Bef_EmpCarrate: Bef_EmpCarrate,
                        Emp_WeddingBenefit: Emp_WeddingBenefit,
                        Emp_Current: '',
                        Action: 'Insert'
                    }),

                    success: function (response) {
                        //insertFile($("#IEmp_Profile")[0].files[0], "", $("#Emp_Num").val());
                        //alert("insert complete");
                        //console.log(response.d);
                        alert(response.d);
                        if (response.d == "Complete") {
                            window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + Emp_Num;
                        }
                        //getid = parseInt(response.d);
                    }
                });
                //}
            });

            $("#btnupdate").on('click', function () {
                //if ($('#Emp_Company').val() == '' || $('#PayFreq').val() == '' || $('#Emp_HR_Shift_ID').val() == '' || $('#Emp_Type').val() == '' || $('#Bef_Shift').val() == '') {
                //    alert("Please fill all input boxes.");
                //} else {
                //console.log(getemp);
                var Emp_Num = $("#Emp_Num").val();
                var Language = $("#Language").val();
                var Emp_Prefix = $("input[name=Prefix]:Checked").val();
                //var Emp_Profile = $('#Emp_Profile .img-preview').attr("src").replace("http:", "");
                //var Emp_Profile = "\\\\PORTALAPP01\\ImageHRDatabase\\" + Emp_Num + "." + (($('#IEmp_Profile').val()).replace(/^.*\./, '')).toLowerCase();
                //var Emp_Profile = "\\\\pkflow01\\ImageEmployee\\" + Emp_Num ;
                var Emp_Profile = '';
                var Emp_FirstName = $("#Emp_FirstName").val();
                var Emp_LastName = $("#Emp_LastName").val();
                var Emp_MidderName = $("#Emp_MiddelName").val();
                var Emp_Level = $("#Emp_Level").val();
                var Emp_Level = $("#Emp_Level").val();
                var Emp_JobTitle = '';
                var Emp_Location = $("#Emp_Location").val();
                var Emp_Email = $("#Emp_Email").val();
                var Emp_Extension = $("#Emp_Extension").val();
                var Emp_Comp_Phone = $("#Emp_BizPhone").val();
                var Emp_StartDate = $("#Emp_StartDate").val() == null ? '' : $("#Emp_StartDate").val();
                var Emp_EndDate = $("#Emp_EndDate").val() == null ? '' : $("#Emp_EndDate").val();
                var Emp_HireDate = $("#Emp_HireDate").val() == null ? '' : $("#Emp_HireDate").val();
                var Emp_HR_Shift_ID = $("#Emp_HR_Shift_ID").val();
                var Emp_Type = $("#Emp_Type").val();
                var Emp_ID_Card = $("#Emp_ID_Card").val();
                var Emp_ID_Card_Expired_Date = $("#Emp_ID_Card_Expired_Date").val();
                var Emp_Birth_Date = $("#Emp_Birth_Date").val();
                var Emp_Gender = $("#Emp_Gender").val();
                var Emp_Nationality = $("#Emp_Nationality").val();
                var Emp_Religion = $("#Emp_Religion").val();
                var Emp_Marital_Status = $("#Emp_Marital_Status").val();
                var Emp_Children = $("#Emp_Children").val();
                var Emp_Address1 = $("#Emp_Address1").val();
                var Emp_Address2 = $("#Emp_Address2").val();
                var Emp_Address3 = $("#Emp_Address3").val();
                var Emp_Address4 = $("#Emp_Address4").val();
                var Emp_District = $("#Emp_District").val();
                var Emp_Country = sessionStorage.getItem('Emp_Country');
                var Emp_City = $("#Emp_City").val();
                var Emp_County = $("#Emp_County").val();
                var Emp_ZipCode = $("#Emp_ZipCode").val();
                var Emp_Phone = $("#Emp_Phone").val();
                var Emp_Bank = sessionStorage.getItem('Bank_ID');
                var Emp_BankBranch = sessionStorage.getItem('Bank_Branch');
                var Emp_BankAccount = $("#Emp_BankAccount").val();
                var Emp_Emergency_Contact = $("#Emp_Contact").val();
                var Emp_Emergency_Phone = $("#Emp_Emergency_Phone").val();
                var Emp_Status = $("#Emp_Status").val();
                var Emp_Position = $("#Emp_position").val();
                var Emp_NickName = $("#Emp_NickName").val();
                var Emp_ManagerID = $("#Emp_ManagerID").val();
                var Emp_ManagerName = $("#Emp_ManagerName").val();
                var Emp_StartLongevity = $("#Emp_StartLongevity").val();
                var PayFreq = $("#PayFreq").val();
                var FirstTripAirbroad = ($("#FTA").is(':checked') ? 1 : 0);
                var Bef_Shift = $("#Bef_Shift").val()
                var Bef_HRProvince = $("#HRProvince").val();
                var Bef_HRCountry = $("#HRCountry").val();
                var Bef_ZoneID = $("#ZoneID").val();
                var Bef_OTLocation = $("#OTLocation").val();
                var Bef_EmpGroup = $("#Emp_group").val();
                var Bef_EmpScrub = parseInt($("#Emp_scrub").val());
                var Bef_EmpSpray = parseInt($("#Emp_spray").val());
                var Bef_EmpCarrate = $("#Emp_carrate").val();
                var Department = $("#Emp_CostCenter").val();
                var Main_Company = $("#Emp_Company").val();
                var Emp_WeddingBenefit = $("#Emp_WeddingBenefit").is(':checked') ? 1 : 0;


                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Draft") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: Emp_Num,
                        Language: localStorage.getItem("type"),
                        Emp_Prefix: Emp_Prefix,
                        Emp_Profile: Emp_Profile,
                        Emp_FirstName: Emp_FirstName,
                        Emp_LastName: Emp_LastName,
                        Emp_MidderName: Emp_MidderName,
                        Emp_Level: Emp_Level,
                        Emp_JobTitle: Emp_JobTitle,
                        Emp_Location: Emp_Location,
                        Emp_Email: Emp_Email,
                        Emp_Extension: Emp_Extension,
                        Emp_Comp_Phone: Emp_Comp_Phone,
                        Emp_StartDate: Emp_StartDate,
                        Emp_EndDate: Emp_EndDate,
                        Emp_HireDate: Emp_HireDate,
                        Emp_HR_Shift_ID: Emp_HR_Shift_ID,
                        Emp_Type: Emp_Type,
                        Emp_ID_Card: Emp_ID_Card,
                        Emp_ID_Card_Expired_Date: Emp_ID_Card_Expired_Date,
                        Emp_Birth_Date: Emp_Birth_Date,
                        Emp_Gender: Emp_Gender,
                        Emp_Nationality: Emp_Nationality,
                        Emp_Religion: Emp_Religion,
                        Emp_Marital_Status: Emp_Marital_Status,
                        Emp_Children: Emp_Children,
                        Emp_Address1: Emp_Address1,
                        Emp_Address2: Emp_Address2,
                        Emp_Address3: Emp_Address3,
                        Emp_Address4: Emp_Address4,
                        Emp_District: Emp_District,
                        Emp_Country: Emp_Country,
                        Emp_City: Emp_City,
                        Emp_County: Emp_County,
                        Emp_ZipCode: Emp_ZipCode,
                        Emp_Phone: Emp_Phone,
                        Emp_Bank: Emp_Bank,
                        Emp_BankBranch: Emp_BankBranch,
                        Emp_BankAccount: Emp_BankAccount,
                        Emp_Emergency_Contact: Emp_Emergency_Contact,
                        Emp_Emergency_Phone: Emp_Emergency_Phone,
                        Emp_Status: Emp_Status,
                        Emp_Position: Emp_Position,
                        Emp_NickName: Emp_NickName,
                        Emp_ManagerID: Emp_ManagerID,
                        Emp_ManagerName: Emp_ManagerName,
                        Emp_StartLongevity: Emp_StartLongevity,
                        PayFreq: PayFreq,
                        FirstTripAbroad: FirstTripAirbroad,
                        Department: Department,
                        Main_Company: Main_Company,
                        Bef_Shift: Bef_Shift,
                        Bef_HRProvince: Bef_HRProvince,
                        Bef_HRCountry: Bef_HRCountry,
                        Bef_ZoneID: Bef_ZoneID,
                        Bef_OTLocation: Bef_OTLocation,
                        Bef_EmpGroup: Bef_EmpGroup,
                        Bef_EmpScrub: Bef_EmpScrub,
                        Bef_EmpSpray: Bef_EmpSpray,
                        Bef_EmpCarrate: Bef_EmpCarrate,
                        Emp_WeddingBenefit: Emp_WeddingBenefit,
                        Emp_Current: '',
                        Action: 'Update'
                    }),

                    success: function (response) {
                        //insertFile($("#IEmp_Profile")[0].files[0], "", $("#Emp_Num").val());
                        //alert("Update Complete");
                        //console.log(response.d);
                        alert(response.d);
                        if (response.d == "Complete") {
                            window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + Emp_Num;
                        }
                        //getid = parseInt(response.d);
                    }
                });

                //}
            });

            //-------------------------End Update-----------------------

            $("#transfer").on('click', function () {
                if ($("#transInput").val() == '') {
                    alert('Please Fill a Employee Num.');
                }
                else if ($("#Emp_StartDate").val() == ''){
                    alert('Please Fill Hire Date.');
                     $('#Emp_StartDate').css({ "border": "2px solid red" });
                }
                else {
                    
                     $('#Emp_StartDate').css({ "border": "1px solid #ccc" });
                    var Emp_Num = $('#Emp_Num').val();
                    var Language = $("#Language").val();
                    var Emp_Prefix = $("input[name=Prefix]:Checked").val();
                    var Emp_Profile = '';
                    var Emp_FirstName = $("#Emp_FirstName").val();
                    var Emp_LastName = $("#Emp_LastName").val();
                    var Emp_MidderName = $("#Emp_MiddelName").val();
                    var Emp_Level = $("#Emp_Level").val();
                    var Emp_Level = $("#Emp_Level").val();
                    var Emp_JobTitle = '';
                    var Emp_Location = $("#Emp_Location").val();
                    var Emp_Email = $("#Emp_Email").val();
                    var Emp_Extension = $("#Emp_Extension").val();
                    var Emp_Comp_Phone = $("#Emp_BizPhone").val();
                    var Emp_StartDate = $("#Emp_StartDate").val() == null ? '' : $("#Emp_StartDate").val();
                    var Emp_EndDate = $("#Emp_EndDate").val() == null ? '' : $("#Emp_EndDate").val();
                    var Emp_HireDate = $("#Emp_HireDate").val() == null ? '' : $("#Emp_HireDate").val();
                    var Emp_HR_Shift_ID = $("#Emp_HR_Shift_ID").val();
                    var Emp_Type = $("#Emp_Type").val();
                    var Emp_ID_Card = $("#Emp_ID_Card").val();
                    var Emp_ID_Card_Expired_Date = $("#Emp_ID_Card_Expired_Date").val();
                    var Emp_Birth_Date = $("#Emp_Birth_Date").val();
                    var Emp_Gender = $("#Emp_Gender").val();
                    var Emp_Nationality = $("#Emp_Nationality").val();
                    var Emp_Religion = $("#Emp_Religion").val();
                    var Emp_Marital_Status = $("#Emp_Marital_Status").val();
                    var Emp_Children = $("#Emp_Children").val();
                    var Emp_Address1 = $("#Emp_Address1").val();
                    var Emp_Address2 = $("#Emp_Address2").val();
                    var Emp_Address3 = $("#Emp_Address3").val();
                    var Emp_Address4 = $("#Emp_Address4").val();
                    var Emp_District = $("#Emp_District").val();
                    var Emp_Country = sessionStorage.getItem('Emp_Country');
                    var Emp_City = $("#Emp_City").val();
                    var Emp_County = $("#Emp_County").val();
                    var Emp_ZipCode = $("#Emp_ZipCode").val();
                    var Emp_Phone = $("#Emp_Phone").val();
                    var Emp_Bank = sessionStorage.getItem('Bank_ID');
                    var Emp_BankBranch = sessionStorage.getItem('Bank_Branch');
                    var Emp_BankAccount = $("#Emp_BankAccount").val();
                    var Emp_Emergency_Contact = $("#Emp_Contact").val();
                    var Emp_Emergency_Phone = $("#Emp_Emergency_Phone").val();
                    var Emp_Status = $("#Emp_Status").val();
                    var Emp_Position = $("#Emp_position").val();
                    var Emp_NickName = $("#Emp_NickName").val();
                    var Emp_ManagerID = $("#Emp_ManagerID").val();
                    var Emp_ManagerName = $("#Emp_ManagerName").val();
                    var Emp_StartLongevity = $("#Emp_StartLongevity").val();
                    var PayFreq = $("#PayFreq").val();
                    var FirstTripAirbroad = ($("#FTA").is(':checked') ? 1 : 0);
                    var Bef_Shift = $("#Bef_Shift").val()
                    var Bef_HRProvince = $("#HRProvince").val();
                    var Bef_HRCountry = $("#HRCountry").val();
                    var Bef_ZoneID = $("#ZoneID").val();
                    var Bef_OTLocation = $("#OTLocation").val();
                    var Bef_EmpGroup = $("#Emp_group").val();
                    var Bef_EmpScrub = parseInt($("#Emp_scrub").val());
                    var Bef_EmpSpray = parseInt($("#Emp_spray").val());
                    var Bef_EmpCarrate = $("#Emp_carrate").val();
                    var Department = $("#Emp_CostCenter").val();
                    var Main_Company = $("#Emp_Company").val();
                    var Emp_WeddingBenefit = $("#Emp_WeddingBenefit").is(':checked') ? 1 : 0;
                    var Draft_Emp = $("#transInput").val();
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Draft") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            Emp_Num: Emp_Num,
                            Language: localStorage.getItem("type"),
                            Emp_Prefix: Emp_Prefix,
                            Emp_Profile: Emp_Profile,
                            Emp_FirstName: Emp_FirstName,
                            Emp_LastName: Emp_LastName,
                            Emp_MidderName: Emp_MidderName,
                            Emp_Level: Emp_Level,
                            Emp_JobTitle: Emp_JobTitle,
                            Emp_Location: Emp_Location,
                            Emp_Email: Emp_Email,
                            Emp_Extension: Emp_Extension,
                            Emp_Comp_Phone: Emp_Comp_Phone,
                            Emp_StartDate: Emp_StartDate,
                            Emp_EndDate: Emp_EndDate,
                            Emp_HireDate: Emp_HireDate,
                            Emp_HR_Shift_ID: Emp_HR_Shift_ID,
                            Emp_Type: Emp_Type,
                            Emp_ID_Card: Emp_ID_Card,
                            Emp_ID_Card_Expired_Date: Emp_ID_Card_Expired_Date,
                            Emp_Birth_Date: Emp_Birth_Date,
                            Emp_Gender: Emp_Gender,
                            Emp_Nationality: Emp_Nationality,
                            Emp_Religion: Emp_Religion,
                            Emp_Marital_Status: Emp_Marital_Status,
                            Emp_Children: Emp_Children,
                            Emp_Address1: Emp_Address1,
                            Emp_Address2: Emp_Address2,
                            Emp_Address3: Emp_Address3,
                            Emp_Address4: Emp_Address4,
                            Emp_District: Emp_District,
                            Emp_Country: Emp_Country,
                            Emp_City: Emp_City,
                            Emp_County: Emp_County,
                            Emp_ZipCode: Emp_ZipCode,
                            Emp_Phone: Emp_Phone,
                            Emp_Bank: Emp_Bank,
                            Emp_BankBranch: Emp_BankBranch,
                            Emp_BankAccount: Emp_BankAccount,
                            Emp_Emergency_Contact: Emp_Emergency_Contact,
                            Emp_Emergency_Phone: Emp_Emergency_Phone,
                            Emp_Status: Emp_Status,
                            Emp_Position: Emp_Position,
                            Emp_NickName: Emp_NickName,
                            Emp_ManagerID: Emp_ManagerID,
                            Emp_ManagerName: Emp_ManagerName,
                            Emp_StartLongevity : Emp_StartLongevity,
                            PayFreq: PayFreq,
                            FirstTripAbroad: FirstTripAirbroad,
                            Department: Department,
                            Main_Company: Main_Company,
                            Bef_Shift: Bef_Shift,
                            Bef_HRProvince: Bef_HRProvince,
                            Bef_HRCountry: Bef_HRCountry,
                            Bef_ZoneID: Bef_ZoneID,
                            Bef_OTLocation: Bef_OTLocation,
                            Bef_EmpGroup: Bef_EmpGroup,
                            Bef_EmpScrub: Bef_EmpScrub,
                            Bef_EmpSpray: Bef_EmpSpray,
                            Bef_EmpCarrate: Bef_EmpCarrate,
                            Emp_WeddingBenefit: Emp_WeddingBenefit,
                            Emp_Current: Draft_Emp,
                            Action: 'Update'
                        }),
                        success: function (response) {
                            //alert(response.d);
                            //window.location.href = "MaintainEmployee.aspx?Emp_Num=" + Emp_Num;
                        }
                    });

                      $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Tranfer") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            Emp_Num : Emp_Num,
                            Emp_Current: Draft_Emp,
                            Emp_StartLongevity: Emp_StartLongevity,
                            Emp_HireDate : Emp_HireDate

                        }),
                          success: function (response) {
                              alert(response.d);
                              if (response.d == "Complete") {
                                  window.location.href = "MaintainEmployee.aspx?Emp_Num=" + $("#transInput").val();
                              }
                          }
                      });
                }

            });
            //------------------------End Transfer---------------------------------
         
            $("#transmodal").on('click', function () {
                $('#modalTransfer').modal('show');
            });

            //----------------------------End SiteRef----------------------------

            //---------------------------------------------------------------------------------------------------------------------------------------//

            //////////////////////// Leave    //////////////////////////
            <%--$("#btnLeave").on('click', function () {
                if ($("#StartDate").val() == '' || $("#Redirect").val() == '') {
                    alert('Plaese Fill data.');
                } else {

                    var Emp_Num = $("#Emp_Num").val();
                    var username = $("#UserName").val();
                    var type = $("#EmpLeave").val();
                    var start = $("#StartDate").val();
                    var end = $("#EndDate").val();
                    var redirect = $("#Redirect").val();

                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_HR_Employee_Leave") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: '0',
                            Emp_Num: Emp_Num,
                            Emp_UserName: username,
                            Emp_Type: type,
                            Leave_StartDate: start,
                            Leave_EndDate: end,
                            Redirect: redirect,
                            Action: 'Insert'

                        }),
                        success: function (response) {
                            alert("insert complete");
                            //console.log(response.d);
                            window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + $("#Emp_Num").val();
                        }
                    });
                }
            });

            $(".btndeleteleave").on("click", function () {
                var r = confirm("Confirm Delete");
                if (r === true) {
                    var tr = $(this).closest("tr");
                    var ID_leave = tr.attr("data-id");
                    var Emp_Num = tr.find("td:nth-child(1)").val();
                    var UserName = tr.find("td:nth-child(2)").val();
                    var Leave = tr.find("td:nth-child(3)").val();
                    var StartDate = tr.find("td:nth-child(4)").val();
                    var EndDate = tr.find("td:nth-child(4)").val();
                    var Redirect = tr.find("td:nth-child(4)").val();

                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_HR_Employee_Leave") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID_leave,
                            Emp_Num: Emp_Num,
                            Emp_UserName: UserName,
                            Emp_Type: Leave,
                            Leave_StartDate: StartDate,
                            Leave_EndDate: EndDate,
                            Redirect: Redirect,
                            Action: 'Delete'
                        }),
                        success: function (response) {
                            alert("Delete complete");
                            //console.log(response.d);
                            window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + $("#Emp_Num").val();
                        }
                    });
                } else { }

            });

            ////////////// Tab Pyramid //////////////////
            $("#clickpyramid").on('click', function () {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListCompanyMain") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EmpcompMain: getemp, Main: '1' }),
                    success: getlistPyramid
                });
            });


            /////////////////////// Job Experience  /////////////////////////
            $("#btnAddJob").on("click", function () {
                //console.log(getid);
                var ID_Job = parseInt($(this).closest("tr").attr("data-id")) || 0;
                var Emp_Num = $("#Emp_Num").val();
                var Company = $("#JobExpComp").val();
                var JobExperience = $("#JobExpTitle").val();
                var EndDate = $("#JobExpEnd").val();

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_HR_Employee_JobExp") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: 0,
                        Company: Company,
                        JobExperience: JobExperience,
                        EndDate: EndDate,
                        Emp_Num: Emp_Num,
                        Action: 'Insert'
                    }),
                    success: function (response) {
                        alert("insert complete");
                        window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + $("#Emp_Num").val();
                        //console.log(response.d);

                    }
                });
            });

            $(".btnupdatejob").on("click", function () {
                var tr = $(this).closest("tr");
                var ID_job = tr.attr("data-id");
                var Emp_Num = $("#Emp_Num").val();
                var Company = tr.find("td:nth-child(1)").parent().find("input[name=Empcom]").val();
                var JobExperience = tr.find("td:nth-child(2)").parent().find("input[name=Empjobexp]").val();
                var EndDate = tr.find("td:nth-child(3)").parent().find("input[name=Empenddate]").val();
                console.log(Company);
                console.log(JobExperience);
                console.log(EndDate);
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_HR_Employee_JobExp") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID_job,
                        Emp_Num: Emp_Num,
                        Company: Company,
                        JobExperience: JobExperience,
                        EndDate: EndDate,
                        Action: 'Update'
                    }),
                    success: function (response) {
                        alert("Update complete");
                        window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + $("#Emp_Num").val();
                        //console.log(response.d);

                    }
                });

            });

            $(".btndeletejob").on("click", function () {
                var r = confirm("Confirm Delete");
                if (r === true) {
                    var tr = $(this).closest("tr");
                    var ID_job = tr.attr("data-id");
                    var Emp_Num = $("#Emp_Num").val();
                    var Company = tr.find("td:nth-child(1)").parent().find("input[name=Empcom]").val();
                    var JobExperience = tr.find("td:nth-child(2)").parent().find("input[name=Empjobexp]").val();
                    var EndDate = tr.find("td:nth-child(3)").parent().find("input[name=Empenddate]").val();
                    console.log(Company);
                    console.log(JobExperience);
                    console.log(EndDate);
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_HR_Employee_JobExp") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID_job,
                            Emp_Num: Emp_Num,
                            Company: Company,
                            JobExperience: JobExperience,
                            EndDate: EndDate,
                            Action: 'Delete'
                        }),
                        success: function (response) {
                            alert("Delete complete");
                            window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + $("#Emp_Num").val();
                            //console.log(response.d);

                        }
                    });
                } else { }
            });

            /////////////////////// Education  /////////////////////////
            $("#btnAddEdu").on("click", function () {
                var ID_Tr_Edu = parseInt($(this).closest("tr").attr("data-id")) || 0;
                var Emp_Num = $("#Emp_Num").val();
                var Level = $("#Level").val();
                var Institution = $("#Institution").val();
                var Faculty = $("#Faculty").val();
                var Major = $("#Major").val();
                var Graduate = $("#Graduate").val();

                //console.log(ID_Tr_Edu + ':' + Emp_Num + ':' + Level + ':' + Institution + ':' + Faculty + ':' + Major + ':' + Graduate);

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Education") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID_Tr_Edu,
                        RefId: getid,
                        Emp_Num: Emp_Num,
                        Level: Level,
                        Institution: Institution,
                        Faculty: Faculty,
                        Major: Major,
                        Graduate: Graduate,
                        Action: ''
                    }),
                    success: function (response) {
                        alert("insert complete");
                        //console.log(response);
                    }
                });
            });

            $(".btnupdateEdu").on("click", function () {
                var tr = $(this).closest("tr");
                var ID_Tr_Edu = tr.attr("data-id");
                var Emp_Num = tr.find("td:nth-child(1)").parent().find("input[name=EduEmpNum]").val();
                var Level = tr.find("td:nth-child(2)").parent().find("input[name=Edulevel]").val();
                var Institution = tr.find("td:nth-child(3)").parent().find("input[name=EduInsi]").val();
                var Faculty = tr.find("td:nth-child(4)").parent().find("input[name=EduFacu]").val();
                var Major = tr.find("td:nth-child(5)").parent().find("input[name=EduMajor]").val();
                var Graduate = tr.find("td:nth-child(6)").parent().find("input[name=EduGraduate]").val();

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Education") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID_Tr_Edu,
                        RefId: getid,
                        Emp_Num: Emp_Num,
                        Level: Level,
                        Institution: Institution,
                        Faculty: Faculty,
                        Major: Major,
                        Graduate: Graduate,
                        Action: 'Update'
                    }),
                    success: function (response) {
                        alert("Update complete");
                        //console.log(response);
                    }
                });
            });

            $(".btndeleteEdu").on("click", function () {
                var r = confirm("Confirm Delete");
                if (r === true) {
                    var tr = $(this).closest("tr");
                    var ID_Tr_Edu = tr.attr("data-id");
                    var Emp_Num = tr.find("td:nth-child(1)").parent().find("input[name=EduEmpNum]").val();
                    var Level = tr.find("td:nth-child(2)").parent().find("input[name=Edulevel]").val();
                    var Institution = tr.find("td:nth-child(3)").parent().find("input[name=EduInsi]").val();
                    var Faculty = tr.find("td:nth-child(4)").parent().find("input[name=EduFacu]").val();
                    var Major = tr.find("td:nth-child(5)").parent().find("input[name=EduMajor]").val();
                    var Graduate = tr.find("td:nth-child(6)").parent().find("input[name=EduGraduate]").val();

                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Education") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID_Tr_Edu,
                            RefId: getid,
                            Emp_Num: Emp_Num,
                            Level: Level,
                            Institution: Institution,
                            Faculty: Faculty,
                            Major: Major,
                            Graduate: Graduate,
                            Action: 'Delete'
                        }),
                        success: function (response) {
                            tr.remove();
                            alert("Delete Complete");
                        }
                    });
                    //alert(ID);
                } else { }
            });

            /////////////////////// Certificate  /////////////////////////
            $("#btnAddCer").on('click', function () {
                //console.log(getid);
                var ID_tr_cer = parseInt($(this).closest("tr").attr("data-id")) || 0;
                var Emp_Num = $("#Emp_Num").val();
                var Certificate = $("#AddCer").val();
                var Description = $("#CerDesc").val();

                //console.log(ID_tr_cer + ":" + Emp_Num + ":" + Certificate + ":" + Description);

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Certificate") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID_tr_cer,
                        RefId: getid,
                        Emp_Num: Emp_Num,
                        Emp_Certificate: '',
                        Description: Description,
                        Action: ''
                    }),

                    success: function (response) {
                        alert("insert complete");
                        //console.log(response.d);

                        //f += "<tr data-id='" + response.d + "'>"

                        //window.location.href = "MaintainEmployee_Draft.aspx?ID=" + getid;
                    }

                });

            });

            $(".btnupdateCer").on("click", function () {
                var tr = $(this).closest("tr");
                var ID_tr_cer = tr.attr("data-id");
                var Emp_Num = tr.find("td:nth-child(1)").parent().find("input[name=EmpnumCer]").val();
                var Emp_Certificate = tr.find("td:nth-child(2)").parent().find("input[name=EmpCer]").val();
                var Description = tr.find("td:nth-child(3)").parent().find("input[name=EmpDesc]").val();

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Certificate") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID_tr_cer,
                        RefId: getid,
                        Emp_Num: Emp_Num,
                        Emp_Certificate: '',
                        Description: Description,
                        Action: 'Update'
                    }),
                    success: function (response) {
                        alert("Update complete");
                        //console.log(response);
                    }
                });
            });

            $(".btndeleteCer").on("click", function () {
                var r = confirm("Confirm Delete");
                if (r === true) {
                    var tr = $(this).closest("tr");
                    var ID_tr_cer = tr.attr("data-id");
                    var Emp_Num = tr.find("td:nth-child(1)").parent().find("input[name=EmpnumCer]").val();
                    var Emp_Certificate = tr.find("td:nth-child(2)").parent().find("input[name=EmpCer]").val();
                    var Description = tr.find("td:nth-child(3)").parent().find("input[name=EmpDesc]").val();

                    //console.log(ID_tr_cer +':'+ Emp_Num + ':' +Emp_Certificate + ':' + Description);
                    //alert(ID_tr_cer);
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Certificate") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID_tr_cer,
                            RefId: getid,
                            Emp_Num: Emp_Num,
                            Emp_Certificate: '',
                            Description: Description,
                            Action: 'Delete'
                        }),
                        success: function (response) {
                            tr.remove();
                            alert("Delete Complete");
                        }
                    });
                    //alert(ID);
                } else { }
            });

            /////////////////////// Permission  /////////////////////////
            $("#btnAddPer").on('click', function () {
                //console.log(getid);
                //var ID_tr_per = parseInt($(this).closest("tr").attr("data-id")) || 0;
                var Emp_Num = $("#Emp_Num").val();
                var Username = $("#peruser").val();
                var Permission = $("#pertype").val();
                //console.log(ID_tr_per + ":" + Emp_Num + ":" + Username + ":" + Permission);

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Authen") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: Emp_Num,
                        Username: Username,
                        Permission: Permission,
                        Action: 'Insert'
                    }),
                    success: function (response) {
                        alert("insert complete");
                        /*console.log(response.d);*/
                        //f += "<tr data-id='" + response.d + "'>"
                        //window.location.href = "MaintainEmployee_Draft.aspx?ID=" + getid;
                        window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + $("#Emp_Num").val();
                    }
                });
            });

            $(".btnupdatePer").on("click", function () {
                var tr = $(this).closest("tr");
                //var ID_tr_per = tr.attr("data-id");
                var Emp_Num = tr.find("td:nth-child(1)").parent().find("input[name=EmpnumPer]").val();
                var Username = tr.find("td:nth-child(2)").parent().find("input[name=EmpUser]").val();
                var Permission = tr.find("td:nth-child(3)").parent().find("input[name=Emptype]").val();

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Authen") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: Emp_Num,
                        Username: Username,
                        Permission: Permission,
                        Action: 'Update'
                    }),
                    success: function (response) {
                        alert("Update complete");
                        //console.log(response);
                    }
                });
            });

            $(".btndeletePer").on("click", function () {
                var r = confirm("Confirm Delete");
                if (r === true) {
                    var tr = $(this).closest("tr");
                    //var ID_tr_per = tr.attr("data-id");
                    var Emp_Num = tr.find("td:nth-child(1)").parent().find("input[name=EmpnumPer]").val();
                    var Username = tr.find("td:nth-child(2)").parent().find("input[name=EmpUser]").val();
                    var Permission = tr.find("td:nth-child(3)").parent().find("input[name=Emptype]").val();

                    //console.log(ID_tr_cer +':'+ Emp_Num + ':' +Emp_Certificate + ':' + Description);
                    //alert(ID_tr_cer);

                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee_Draft.aspx/SP_HR_Employee_Authen") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            Emp_Num: Emp_Num,
                            Username: Username,
                            Permission: Permission,
                            Action: 'Delete'
                        }),
                        success: function (response) {
                            tr.remove();
                            alert("Delete Complete");
                        }
                    });
                    //alert(ID);
                } else { }
            });--%>

                 ////////////// Tab Redirect //////////////////
            $("#clickpyramid").on('click', function () {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListCompanyMain") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ EmpcompMain: getemp, Main: '1' }),
                    success: getlistPyramid
                });
            });

            //// DatePicker
            $("#Emp_StartDate").datepicker({ dateFormat: "dd/mm/yy" });
            $('#Emp_HireDate').datepicker({ dateFormat: "dd/mm/yy" });
            $('#Emp_ID_Card_Expired_Date').datepicker({ dateFormat: "dd/mm/yy" });
            $('#Emp_Birth_Date').datepicker({ dateFormat: "dd/mm/yy" });
            $('#Emp_EndDate').datepicker({ dateFormat: "dd/mm/yy" });
            $('#StartDate').datepicker({ dateFormat: "dd/mm/yy" });
            $('#EndDate').datepicker({ dateFormat: "dd/mm/yy" });
            $('#JobExpEnd').datepicker({ dateFormat: "dd/mm/yy" });


            //// Btn newemp
            $("#newemp").on("click", function () {
                //alert("New emp");
                //sessionStorage.setItem('newEmp', true);
                //window.location.href = "MaintainEmployee_Draft.aspx"
                sessionStorage.clear();
                $('#modalDraftEmp').modal('show');
            });

            //// Btn ModalExport
            $("#btnModalExport").on("click", function () {
                //alert("New emp");
                $("#modalExport").modal("show");
                if ($("#Emp_CompanyExport").val() == "") {
                    $("#MainContent_exportTableC").attr("disabled", "disabled");
                } else {
                    $("#MainContent_exportTableC").removeAttr("disabled");
                }
            });

            //// Btn exportClose
            $("#exportClose").on("click", function () {
             document.getElementById("MainContent_exportTableC").disabled=true;
            });




            //// Modal emp
            $("#btnmodal").on("click", function () {
               $("#modalEmp").modal("show");
                $("#TBbodyemp").empty();
                var fragment = '';
                var Search = new Array();
                var fillter = new Array();
                var type = '';
                var fragment = '';
                $(".fillterSearch").val("");
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_GetListEmployee") %>",//new
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: Search,
                        fillter: fillter,
                        type: type
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empnum = val[0];
                                var name = val[4];
                                var lastname = val[5];
                                var dataType = val[60];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + empnum + '</a></td>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + name + " " + lastname + '</a></td>';
                                fragment += '<td style="display:none"><a class="clickselectemp" href="javascript:void(0)" >' + dataType + '</a></td>';
                                //fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + lastname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyemp").append(fragment);
                    }
                });
            });
            //////End Modal Emp

            //// Search in modal
            $(document).on("change", ".myInputEmp", function () {
                var fragment = "";
                $("#TBbodyemp").empty();
                var type = localStorage.getItem("type");
                var Search = new Array();
                var fillter = new Array();
                $(document).find(".DispalySearchArea").each(function (index, val) {
                    var text = $(this).find("input[type=text]").val();
                    var column = $(this).find("Select option:selected").val();
                    Search.push(text.trim());
                    fillter.push(column);
                });

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_GetListEmployee") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: Search,
                        fillter: fillter,
                        type: type
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empnum = val[0];
                                var name = val[4];
                                var lastname = val[5];
                                var dataType = val[60];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + empnum + '</a></td>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + name + " " + lastname + '</a></td>';
                                fragment += '<td style="display:none"><a class="clickselectemp" href="javascript:void(0)" >' + dataType + '</a></td>';
                                //fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + lastname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyemp").append(fragment);
                    }
                });
            });

             $(document).on("change",".fillterSearch",  function () {
                var fragment = "";
                $("#TBbodyemp").empty();
                var type = localStorage.getItem("type");
                var Search = new Array();
                var fillter = new Array();
                $(document).find(".DispalySearchArea").each(function (index, val) {
                    var text = $(this).find("input[type=text]").val();
                    var column = $(this).find("Select option:selected").val();
                    Search.push(text);
                    fillter.push(column);
                });

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_GetListEmployee") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: Search,
                        fillter: fillter,
                        type: type
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empnum = val[0];
                                var name = val[4];
                                var lastname = val[5];
                                var dataType = val[60];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + empnum + '</a></td>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + name + " " + lastname + '</a></td>';
                                fragment += '<td style="display:none"><a class="clickselectemp" href="javascript:void(0)" >' + dataType + '</a></td>';
                                //fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + lastname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyemp").append(fragment);
                    }
                });
            });

            
            //// Search in modal
            $("#InputUserRedirect").on("change", function () {
                $("#TBbodyUserRedirect").empty();
                var fragment = '';
                var values = $(this).val().trim();
                var type = localStorage.getItem("type");

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListUserRedirect") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: values,
                        type: type,
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var username = val[0];
                                var fullname = val[1];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectempuserRedirect" href="javascript:void(0)" >' + username + '</a></td>';
                                fragment += '<td><a class="clickselectempuserRedirect" href="javascript:void(0)" >' + fullname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyUserRedirect").append(fragment);
                    }
                });
            });

            //// Modal UserAD
            $("#btnbrowseuser").on("click", function () {
                $("#ModalUserAd").modal("show");
                $("#TBbodyUserAd").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUserAD") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ user: "", search: "" }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empnum = val[1];
                                var name = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectempuser" href="javascript:void(0)" >' + empnum + '</a></td>';
                                fragment += '<td><a class="clickselectempuser" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyUserAd").append(fragment);
                    }
                });
            });
            //// End Modal UserAD

            
            //// Modal UserRedirect
            $(".btnbrowseuserRedirect").on("click", function () {
                $("#ModalUserRedirect").modal("show");
                $("#TBbodyUserRedirect").empty();
                browse_type = $(this).attr("data-type");
                $("#K2Redirect").val($(this).attr("data-K2"));
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                       url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListUserRedirect") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: "", type: localStorage.getItem("type") }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var username = val[0];
                                var fullname = val[1];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectempuserRedirect" href="javascript:void(0)" >' + username + '</a></td>';
                                fragment += '<td><a class="clickselectempuserRedirect" href="javascript:void(0)" >' + fullname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyUserRedirect").append(fragment);
                    }
                });
            });
            //// End Modal UserRedirect

            //// Search in modal userAD
            $("#InputUserAD").on("change", function () {
                $("#TBbodyUserAd").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUserAD") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ user: "", search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empnum = val[1];
                                var name = val[0];


                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectempuser" href="javascript:void(0)" >' + empnum + '</a></td>';
                                fragment += '<td><a class="clickselectempuser" href="javascript:void(0)" >' + name + '</a></td>';
                                //fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + lastname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyUserAd").append(fragment);
                    }
                });
            });

            //// Modal position
            $(".Browse_modal").on("click", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                browse_type = $(this).attr("data-type");

                $("#search_box").empty();
                $('<input>').attr({
                    type: 'text',
                    id: 'SearchBrowse',
                    placeholder: "Search..",
                    class: "form-control max-wide",
                    autocomplete: "off"
                }).appendTo('#search_box');

                if (browse_type == 'position') {
                    $("#browseHeader").text('Position');
                    $('#SearchBrowse').attr('id', 'search_position');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetPosition") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var title = localStorage.getItem("type") == 'TH' ? val[1] : val[2];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectposition" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectposition" href="javascript:void(0)" >' + title + '</a></td>';
                                    fragment += '<td></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'province') {
                    $("#browseHeader").text('Province');
                    $('#SearchBrowse').attr("id", 'search_province');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetProvince") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var province_name = val[1];
                                    var province_id = val[0];
                                    var cty_id = val[2];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectprovince" href="javascript:void(0)" >' + province_id + '</a></td>';
                                    fragment += '<td><a class="clickselectprovince" href="javascript:void(0)" >' + province_name + '</a></td>';
                                    fragment += '<td><a class="clickselectprovince" href="javascript:void(0)" style="display:none" >' + cty_id + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'country') {
                    $("#browseHeader").text('Country');
                    $('#SearchBrowse').attr("id", 'search_country');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetCountries") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectcountry" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectcountry" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'zoneid') {
                    $("#browseHeader").text('Zone ID');
                    $('#SearchBrowse').attr("id", 'search_zoneid');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'empgroup') {
                    $("#browseHeader").text('Employee Group');
                    $('#SearchBrowse').attr("id", 'search_empgroup');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEmpGroup") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectempgroup" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectempgroup" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'costCenter') {
                    $("#browseHeader").text('Department');
                    $('#SearchBrowse').attr("id", 'search_empCompany');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Company") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];
                                    var group = val[4];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectcompany" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectcompany" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '<td><a class="clickselectcompany" href="javascript:void(0)" >' + group + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'costCenterStartExport') {
                    $("#browseHeader").text('Department Start');
                    $('#SearchBrowse').attr("id", 'search_costCenterStartExport');
                    var company = ($("#Emp_CompanyExport").val() == "") ? '' : $("#Emp_CompanyExport").val();
                    var buGroup = ($("#Emp_GroupIDExport").val() == "") ? '' : $("#Emp_GroupIDExport").val();
                    var step = "Department";
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_CompanyExport") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "", company: company, buGroup: buGroup, step: step }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];
                                    var group = val[2];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectcompanyStartExport" href="javascript:void(0)" >' + group + '</a></td>';
                                    fragment += '<td><a class="clickselectcompanyStartExport" href="javascript:void(0)" >' + name + '</a></td>';

                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'costCenterEndExport') {
                    $("#browseHeader").text('Department End');
                    $('#SearchBrowse').attr("id", 'search_costCenterEndExport');
                    var company = ($("#Emp_CompanyExport").val() == "") ? '' : $("#Emp_CompanyExport").val();
                    var buGroup = ($("#Emp_GroupIDExport").val() == "") ? '' : $("#Emp_GroupIDExport").val();
                    var step = "Department";
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_CompanyExport") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "", company: company, buGroup: buGroup, step: step }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];
                                    var group = val[2];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectcompanyEndExport" href="javascript:void(0)" >' + group + '</a></td>';
                                    fragment += '<td><a class="clickselectcompanyEndExport" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'Emp_Bank') {
                    $("#browseHeader").text('Bank Name');
                    $('#SearchBrowse').attr("id", 'search_Emp_Bank');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetBank") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ TypeName: 'Vendor Bank', search: '' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {

                                    var ID = val[0];
                                    var Bank_name = val[1];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectEmp_Bank" href="javascript:void(0)" >' + ID + '</a></td>';
                                    fragment += '<td><a class="clickselectEmp_Bank" href="javascript:void(0)" >' + Bank_name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'Emp_BankBranch') {
                    $("#browseHeader").text('Bank Branch');
                    $('#SearchBrowse').attr("id", 'search_Emp_BankBranch');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetBank") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ TypeName: 'Vendor Branch', search: '' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {

                                    var ID = val[0];
                                    var Branch_name = val[1];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectEmp_BankBranch" href="javascript:void(0)" >' + ID + '</a></td>';
                                    fragment += '<td><a class="clickselectEmp_BankBranch" href="javascript:void(0)" >' + Branch_name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'Emp_Country') {
                    $("#browseHeader").text('Country');
                    $('#SearchBrowse').attr("id", 'search_Emp_Country');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetCountry") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: '' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var code = val[0];
                                    var country = val[1];
                                    var Uf_CountryTH = val[2];
                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectEmp_Country" href="javascript:void(0)" >' + code + '</a></td>';
                                    if (localStorage.getItem("type") == "EN") {
                                        fragment += '<td><a class="clickselectEmp_Country" href="javascript:void(0)" >' + country + '</a></td>';
                                    }
                                    else {
                                        fragment += '<td><a class="clickselectEmp_Country" href="javascript:void(0)" >' + Uf_CountryTH + '</a></td>';
                                    }
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'GroupExport') {
                    $("#browseHeader").text('Group');
                    $('#SearchBrowse').attr("id", 'search_GroupExport');
                    var company = ($("#Emp_CompanyExport").val() == "") ? '' : $("#Emp_CompanyExport").val();
                    var step = "group";
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_CompanyExport") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "", company: company, buGroup: "", step: step }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var id = val[0];
                                    var group = val[1];
                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectGroupExport" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectGroupExport" href="javascript:void(0)" >' + group + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }



            });//End browse modal

            $("#Browse_Emp_ManagerID").on("click", function () {
                $("#modalEmpManager").modal('show');
                $("#TBbodyempManager").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListEmployee") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Emp_Num: "", search: "", type: localStorage.getItem("type"), fillter: "" }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empnum = val[0];
                                var name = val[4];
                                var lastname = val[5];
                                var emp_extension = val[11];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectempmanager" href="javascript:void(0)" >' + empnum + '</a></td>';
                                fragment += '<td><a class="clickselectempmanager" href="javascript:void(0)" >' + name + " " + lastname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyempManager").append(fragment);
                    }
                });

            });

            //// Search in modal position
            $(document).on("change", "#search_position", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetPosition") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: values
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var title = val[1];
                                var id = val[0];


                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectposition" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectposition" href="javascript:void(0)" >' + title + '</a></td>';
                                fragment += '<td></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });


            //// Search in modal province
            $(document).on("change", "#search_province", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetProvince") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: values
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var province_name = val[1];
                                var province_id = val[0];
                                var cty_id = val[2];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectprovince" href="javascript:void(0)" >' + province_id + '</a></td>';
                                fragment += '<td><a class="clickselectprovince" href="javascript:void(0)" >' + province_name + '</a></td>';
                                fragment += '<td><a class="clickselectprovince" href="javascript:void(0)" style="display:none">' + cty_id + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });

            //// Search in modal country
            $(document).on("change", "#search_country", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetCountries")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectcountry" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectcountry" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });

            //// Search in modal zoneid
            $(document).on("change", "#search_zoneid", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });

            //// Search in modal emp_group
            $(document).on("change", "#search_empgroup", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEmpGroup")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectempgroup" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectempgroup" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            //---------Check user's permission----------
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetUser")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                data: JSON.stringify({ para: null }),
                success: function (response) {
                    var user = (response.d).toUpperCase();
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%=ResolveUrl("MaintainEmployee.aspx/GetPermission")%>",
                        contentType: "application/json; charset = utf-8",
                        dataType: "json",
                        data: JSON.stringify({ user : user, page : 'Draft' }),
                        success: function (response) {
                            if (response.d.length > 0 && response.d[0][4] == 'True') {
                                $('#btnupdate').prop('disabled', false);
                                $('#syncmodal').prop('disabled', false);
                                $('#btnsave').prop('disabled', false);
                            } else {
                                $('#btnupdate').prop('disabled', true);
                                $('#syncmodal').prop('disabled', true);
                                $('#btnsave').prop('disabled', true);
                                $("#btnmodal").prop('disabled', true);
                                $("#newemp").hide();
                                $("#modalEmp").modal('hide');
                                alert("You don't have permission to access this page.");
                            }
                        }
                    });
                }
            });
            //---------END Check user's permission----------
        });//----------END document ready--------------

        //// Search in modal emp_Manager
        $(document).on("change", "#myInputEmpManager", function () {
            $("#TBbodyempManager").empty();
            var fragment = '';
            var values = $(this).val().trim();
            var type = localStorage.getItem("type");

            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListEmployee") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    Emp_Num: "",
                    search: values,
                    type: type,
                    fillter: ""
                }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var empnum = val[0];
                            var name = val[4];
                            var lastname = val[5];

                            fragment += '<tr>';
                            fragment += '<td><a class="clickselectempmanager" href="javascript:void(0)" >' + empnum + '</a></td>';
                            fragment += '<td><a class="clickselectempmanager" href="javascript:void(0)" >' + name + " " + lastname + '</a></td>';
                            fragment += '</tr>';
                        });
                    } else { }
                    $("#TBbodyempManager").append(fragment);
                }
            });
        });

        //// Search in modal emp_company
        $(document).on("change", "#search_empCompany", function () {
            $("#TBbodyBrowse").empty();
            var fragment = '';
            var values = $(this).val().trim();

            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Company") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: values }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var name = val[1];
                            var id = val[0];
                            var group = val[4];

                            fragment += '<tr>';
                            fragment += '<td><a class="clickselectcompany" href="javascript:void(0)" >' + id + '</a></td>';
                            fragment += '<td><a class="clickselectcompany" href="javascript:void(0)" >' + name + '</a></td>';
                            fragment += '<td><a class="clickselectcompany" href="javascript:void(0)" >' + group + '</a></td>';
                            fragment += '</tr>';
                        });
                    } else { }
                    $("#TBbodyBrowse").append(fragment);
                }
            });
        });
        //// Search in modal Emp_Bank
        $(document).on("change", "#search_Emp_Bank", function () {
            $("#TBbodyBrowse").empty();
            var fragment = '';
            var values = $(this).val().trim();

            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetBank") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ TypeName: 'Vendor Bank', search: values }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var ID = val[0];
                            var Bnak_name = val[1];

                            fragment += '<tr>';
                            fragment += '<td><a class="clickselectEmp_Bank" href="javascript:void(0)" >' + ID + '</a></td>';
                            fragment += '<td><a class="clickselectEmp_Bank" href="javascript:void(0)" >' + Bnak_name + '</a></td>';
                            fragment += '</tr>';
                        });
                    } else { }
                    $("#TBbodyBrowse").append(fragment);
                }
            });
        });
        //// Search in modal Emp_Branch
        $(document).on("change", "#search_Emp_Country", function () {
            $("#TBbodyBrowse").empty();
            var fragment = '';
            var values = $(this).val().trim();

            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetCountry") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: values }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var code = val[0];
                            var country = val[1];
                            var Uf_CountryTH = val[2];
                            fragment += '<tr>';
                            fragment += '<td><a class="clickselectEmp_Country" href="javascript:void(0)" >' + code + '</a></td>';
                            if (localStorage.getItem("type") == "EN") {
                                fragment += '<td><a class="clickselectEmp_Country" href="javascript:void(0)" >' + country + '</a></td>';
                            }
                            else {
                                fragment += '<td><a class="clickselectEmp_Country" href="javascript:void(0)" >' + Uf_CountryTH + '</a></td>';
                            }
                            fragment += '</tr>';
                        });
                    } else { }
                    $("#TBbodyBrowse").append(fragment);
                }
            });
        });

        //// Search in modal search_Emp_Country
        $(document).on("change", "#search_Emp_BankBranch", function () {
            $("#TBbodyBrowse").empty();
            var fragment = '';
            var values = $(this).val().trim();

            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetBank") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ TypeName: 'Vendor Branch', search: values }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var ID = val[0];
                            var Bnak_name = val[1];

                            fragment += '<tr>';
                            fragment += '<td><a class="clickselectEmp_BankBranch" href="javascript:void(0)" >' + ID + '</a></td>';
                            fragment += '<td><a class="clickselectEmp_BankBranch" href="javascript:void(0)" >' + Bnak_name + '</a></td>';
                            fragment += '</tr>';
                        });
                    } else { }
                    $("#TBbodyBrowse").append(fragment);
                }
            });
        });

        //// Search in modal Emp_Branch
        $(document).on("change", "#search_GroupExport", function () {
            $("#TBbodyBrowse").empty();
            var fragment = '';
            var company = ($("#Emp_CompanyExport").val() == "") ? '' : $("#Emp_CompanyExport").val();
            var values = $(this).val().trim();
            var step = "group";
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_CompanyExport") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: values, company: company, buGroup: "", step: step }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var id = val[0];
                            var group = val[1];
                            fragment += '<tr>';
                            fragment += '<td><a class="clickselectGroupExport" href="javascript:void(0)" >' + id + '</a></td>';
                            fragment += '<td><a class="clickselectGroupExport" href="javascript:void(0)" >' + group + '</a></td>';
                            fragment += '</tr>';
                        });
                    } else { }
                    $("#TBbodyBrowse").append(fragment);
                    $("#modalBrowse").modal("show");
                }
            });
        });
        //// Search in modal GroupExport

        $(document).on("change", "#search_costCenterStartExport", function () {
            $("#TBbodyBrowse").empty();
            var fragment = '';
            var company = ($("#Emp_CompanyExport").val() == "") ? '' : $("#Emp_CompanyExport").val();
            var buGroup = ($("#Emp_GroupIDExport").val() == "") ? '' : $("#Emp_GroupIDExport").val();
            var step = "Department";
            var values = $(this).val().trim();
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_CompanyExport") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: values, company: company, buGroup: buGroup, step: step }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var name = val[1];
                            var id = val[0];
                            var group = val[2];

                            fragment += '<tr>';
                            fragment += '<td><a class="clickselectcompanyStartExport" href="javascript:void(0)" >' + group + '</a></td>';
                            fragment += '<td><a class="clickselectcompanyStartExport" href="javascript:void(0)" >' + name + '</a></td>';
                            fragment += '</tr>';
                        });
                    } else { }
                    $("#TBbodyBrowse").append(fragment);
                    $("#modalBrowse").modal("show");
                }
            });
        });
        //// Search in modal costCenterStartExport

        $(document).on("change", "#search_costCenterEndExport", function () {
            $("#TBbodyBrowse").empty();
            var fragment = '';
            var company = ($("#Emp_CompanyExport").val() == "") ? '' : $("#Emp_CompanyExport").val();
            var buGroup = ($("#Emp_GroupIDExport").val() == "") ? '' : $("#Emp_GroupIDExport").val();
            var step = "Department";
            var values = $(this).val().trim();
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_CompanyExport") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: values, company: company, buGroup: buGroup, step: step }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var name = val[1];
                            var id = val[0];
                            var group = val[2];

                            fragment += '<tr>';
                            fragment += '<td><a class="clickselectcompanyEndExport" href="javascript:void(0)" >' + group + '</a></td>';
                            fragment += '<td><a class="clickselectcompanyEndExport" href="javascript:void(0)" >' + name + '</a></td>';

                            fragment += '</tr>';
                        });
                    } else { }
                    $("#TBbodyBrowse").append(fragment);
                    $("#modalBrowse").modal("show");
                }
            });
        });
        //// Search in modal costCenterEndExport

        $(document).on("change", "#Emp_CompanyExport", function () {
            if ($("#Emp_CompanyExport").val() != "") {
                $("#Emp_GroupExport").val("");
                $("#Emp_GroupIDExport").val("")
                $("#Emp_CostCenterStartExport").val("");
                $("#Emp_CostCenterEndExport").val("");
                $("#MainContent_exportTableC").removeAttr("disabled");
                $("#ExportActive").prop('checked', true)
                $("#ExportInActive").prop('checked', false)
            }
            else {
                document.getElementById("MainContent_exportTableC").disabled = true;
              
            }
     
        });

        //-----------------END Document Ready


        $(document).on("click", ".clickselectemp", function () {
            var EmpNum = $(this).closest("tr").find("td:nth-child(1)").text();
            sessionStorage.setItem('fillter', $("#fillterSearch").val());
            sessionStorage.setItem('search', $("#myInputEmp").val());
            var dataType = $(this).closest("tr").find("td:nth-child(3)").text();
            if (dataType == 'Current') {
                window.location.href = "MaintainEmployee.aspx?Emp_Num=" + EmpNum;
            } else {
                window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + EmpNum;
            }
        });

        //click selectempuser
        $(document).on("click", ".clickselectempuser", function () {
            var User = $(this).closest("tr").find("td:nth-child(2)").text();
            $("#Redirect").val(User);
            $("#ModalUserAd").modal("hide");
        });


        //-------select position------
        $(document).on("click", ".clickselectposition", function () {
            var Emp_position = $(this).closest("tr").find("td:nth-child(1)").text();
            var title = $(this).closest("tr").find("td:nth-child(2)").text();
            $("#Emp_position").val(Emp_position);
            $("#JobTitle").val(title);
            $("#modalBrowse").modal("hide");
        });

        //-------select emp Manager------
        $(document).on("click", ".clickselectempmanager", function () {
            var Emp_ManagerID = $(this).closest("tr").find("td:nth-child(1)").text();
            var Emp_ManagerName = $(this).closest("tr").find("td:nth-child(2)").text();
            $("#Emp_ManagerID").val(Emp_ManagerID);
            $("#Emp_ManagerName").val(Emp_ManagerName);
            $("#modalEmpManager").modal("hide");
        });

        //-------select province------
        $(document).on("click", ".clickselectprovince", function () {
            var HRProvince = $(this).closest("tr").find("td:nth-child(1)").text();
            var OTLocation = $(this).closest("tr").find("td:nth-child(3)").text();
            $("#HRProvince").val(HRProvince);
            //$("#OTLocation").empty();
            //$('<label>').text(OTLocation).appendTo('#OTLocation');
            $("#OTLocation").val(OTLocation);
            $("#modalBrowse").modal("hide");
        });

        //-------select country------
        $(document).on("click", ".clickselectcountry", function () {
            var HRCountry = $(this).closest("tr").find("td:nth-child(1)").text();
            $("#HRCountry").val(HRCountry);
            $("#modalBrowse").modal("hide");
        });

        //-------select zoneid------
        $(document).on("click", ".clickselectzoneid", function () {
            var HRZoneID = $(this).closest("tr").find("td:nth-child(1)").text();
            $("#ZoneID").val(HRZoneID);
            $("#modalBrowse").modal("hide");
        });

        //-------select empgroup------
        $(document).on("click", ".clickselectempgroup", function () {
            var Emp_group = $(this).closest("tr").find("td:nth-child(1)").text();
            $("#Emp_group").val(Emp_group);
            $("#modalBrowse").modal("hide");
        });

        //-------select empcompany------
        $(document).on("click", ".clickselectcompany", function () {
            var costCenter = $(this).closest("tr").find("td:nth-child(1)").text();
            var BUGroup = $(this).closest("tr").find("td:nth-child(3)").text();
            $("#Emp_CostCenter").val(costCenter);
            $("#Emp_Division").val(BUGroup);
            $("#modalBrowse").modal("hide");
        });

        //select Department Start
        $(document).on("click", ".clickselectcompanyStartExport", function () {
            var BUGroup = $(this).closest("tr").find("td:nth-child(3)").text();
            var CostcenterDesc = $(this).closest("tr").find("td:nth-child(2)").text();
            var costCenter = $(this).closest("tr").find("td:nth-child(1)").text();
            $("#Emp_CostCenterStartExport").val(costCenter);
            $("#Emp_CostCenterEndExport").val(costCenter);
            $("#ExportActive").prop('checked', true)
            $("#modalBrowse").modal("hide");
        });

        //-------select Department End------
        $(document).on("click", ".clickselectcompanyEndExport", function () {
            var BUGroup = $(this).closest("tr").find("td:nth-child(3)").text();
            var CostcenterDesc = $(this).closest("tr").find("td:nth-child(2)").text();
            var costCenter = $(this).closest("tr").find("td:nth-child(1)").text();
            $("#Emp_CostCenterEndExport").val(costCenter);
            $("#modalBrowse").modal("hide");
        });

        //-------select GroupExport------
        $(document).on("click", ".clickselectGroupExport", function () {
            var costCenter = $(this).closest("tr").find("td:nth-child(1)").text();
            var BUGroup = $(this).closest("tr").find("td:nth-child(2)").text();
            $("#Emp_GroupExport").val(BUGroup);
            $("#Emp_GroupIDExport").val(costCenter);
            $("#Emp_CostCenterStartExport").val("");
            $("#Emp_CostCenterEndExport").val("");
            $("#modalBrowse").modal("hide");
        });

        //-------select Emp_Bank------
        $(document).on("click", ".clickselectEmp_Bank", function () {
            var id = $(this).closest("tr").find("td:nth-child(1)").text();
            var Bank = $(this).closest("tr").find("td:nth-child(2)").text();
            sessionStorage.setItem('Bank_ID', id);
            $("#Emp_Bank").val(Bank);
            $("#modalBrowse").modal("hide");
        });

        //-------select Emp_Bank------
        $(document).on("click", ".clickselectEmp_BankBranch", function () {
            var id = $(this).closest("tr").find("td:nth-child(1)").text();
            var Bank = $(this).closest("tr").find("td:nth-child(2)").text();
            sessionStorage.setItem('Bank_Branch', id);
            $("#Emp_BankBranch").val(Bank);
            $("#modalBrowse").modal("hide");
        });

        //-------select Emp_Country------
        $(document).on("click", ".clickselectEmp_Country", function () {
            var code = $(this).closest("tr").find("td:nth-child(1)").text();
            var country = $(this).closest("tr").find("td:nth-child(2)").text();
            sessionStorage.setItem('Emp_Country', code);
            $("#Emp_Country").val(country);
            $("#modalBrowse").modal("hide");
        });
        //------Add Search---------
          var searctCount = 1;
        $(document).on("click", "#addSearch", function () {
            //alert("addSearch");
            searctCount++;
            var area = $("#search-area1").clone();
            area.attr("id", "search-area" + searctCount);
            area.find("input[type=text]").val("");
            area.find("button").attr('class', 'btn btn-danger max-wide delSearch');
            area.find("button").attr('id', '');
            area.find("span").attr('class', 'glyphicon glyphicon-trash');
            $("#ModalHeaderSerach").append(area);
            
        });
        //-------del search----------
        $(document).on('click', '.delSearch', function () {
            var div = $(this).closest('div.DispalySearchArea');
            div.remove();
            
                var fragment = "";
                $("#TBbodyemp").empty();
                var type = localStorage.getItem("type");
                var Search = new Array();
                var fillter = new Array();
                $(document).find(".DispalySearchArea").each(function (index, val) {
                    var text = $(this).find("input[type=text]").val();
                    var column = $(this).find("Select option:selected").val();
                    Search.push(text);
                    fillter.push(column);
                });
                
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_GetListEmployee") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: Search,
                        fillter : fillter,
                        type: type
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empnum = val[0];
                                var name = val[4];
                                var lastname = val[5];
                                var dataType = val[60];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + empnum + '</a></td>';
                                fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + name + " " + lastname + '</a></td>';
                                fragment += '<td style="display:none"><a class="clickselectemp" href="javascript:void(0)" >' + dataType + '</a></td>';
                                //fragment += '<td><a class="clickselectemp" href="javascript:void(0)" >' + lastname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyemp").append(fragment);
                    }
                });
        });

        $("#Emp_Profile").on('click', function () {
            $("#IEmp_Profile").click();
        });

        $("#IEmp_Profile").change(function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) { $('#Emp_Profile .img-preview').attr('src', e.target.result); };
                reader.readAsDataURL(this.files[0]);
            }
        });

        //-------Redirect------
        $(document).on("click", ".clickselectempuserRedirect", function () {
            var RedirectFrom = $("#UserName").val();
            var RedirectTO = $(this).closest("tr").find("td:nth-child(1)").text();
            var K2Redirect = $("#K2Redirect").val();
            var SNvalue = "";
            //Get SNvalue for redirect
            var button = confirm("Redirect K2: "+K2Redirect+" \n"+RedirectFrom+" => "+RedirectTO);
            if (button == true) {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetSNvalueRedirect") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        RedirectFrom: RedirectFrom,
                        K2Redirect: K2Redirect

                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                SNvalue = val[0];
                            })
                        }
                    }
                });
                //search Redirect
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/btnRedirect") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        RedirectFrom: RedirectFrom,
                        RedirectTO: RedirectTO,
                        SNvalue: SNvalue

                    }),
                    success: function (response) {
                        //console.log(response.d);
                        $("#ModalUserAd").modal("hide");
                    }
                });
                alert("Susssuccess : "+K2Redirect);
                 window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + $("#Emp_Num").val();
            }
        
        });




        ///////////////// Function /////////////////
        function getAllUrlParams(sParam) {

            var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1];
                } else {

                }
            }
        }

        function getHrShiftID(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ShiftID = val[0];
                    var desc = val[1];
                    fragment += '<option value="' + ShiftID + '">' + ShiftID + ":" + desc + '</option>';
                });
            }
            $("#Emp_HR_Shift_ID").append(fragment);
        }

        function GetLocation(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var location = val[0];
                    var desc = val[1];
                    fragment += '<option value="' + location + '">' + location + '</option>';
                    //console.log(response);
                });
            }
            $("#Emp_Location").append(fragment);
        }

         function GetMainCompany(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[0];
                    var company = localStorage.getItem("type") == 'EN' ? val[1] : val[2];
                    if (localStorage.getItem("type") == 'TH') {
                        company = company == '' ? val[1] : val[2];
                    }
                    fragment += '<option value="' + ID + '">' + company + '</option>';
                });
            }
            $("#Emp_Company").append(fragment);
        }

        function GetSiteRef(response) {
            var siteRef = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[0];
                    var company = localStorage.getItem("type") == 'EN' ? val[1] : val[2];
                    if (localStorage.getItem("type") == 'TH') {
                        company = company == '' ? val[1] : val[2];
                    }
                    siteRef += '<option value="' + ID + '">' + company + '</option>';
                });
            }
            $("#siteRefDorpdown").append(siteRef);
        }

        function GetMainCompanyExport(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[0];
                    var company = localStorage.getItem("type") == 'EN' ? val[1] : val[2];
                    if (localStorage.getItem("type") == 'TH') {
                        company = company == '' ? val[1] : val[2];
                    }
                    fragment += '<option value="' + ID + '">' + company + '</option>';
                });
            }
            $("#Emp_CompanyExport").append(fragment);
        }
        //if (localStorage.getItem("type") == "TH") {
        //    function setcountry(response) {
        //        var fragment = '';
        //        if (response.d.length > 0) {
        //            $.each(response.d, function (index, val) {
        //                var country = val[0];
        //                var desc = val[2];

        //                fragment += '<option value="' + country + '">' + country + ":        " + desc + '</option>';
        //            });
        //        }
        //        $("#Emp_Country").append(fragment);
        //    }
        //} else {
        //    function setcountry(response) {
        //        var fragment = '';
        //        if (response.d.length > 0) {
        //            $.each(response.d, function (index, val) {
        //                var country = val[0];
        //                var desc = val[1];

        //                fragment += '<option value="' + country + '">' + country + ":        " + desc + '</option>';
        //            });
        //        }
        //        $("#Emp_Country").append(fragment);
        //    }
        //}

        //function GetBank(response) {
        //    var fragment = '';
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var Bank = val[0];
        //            var desc = val[1];

        //            fragment += '<option value="' + Bank + '">' + desc + '</option>';
        //        });
        //    }
        //    $("#Emp_Bank").append(fragment);
        //}

        //function GetBranch(response) {
        //    var fragment = '';
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var Bank = val[0];
        //            var desc = val[1];

        //            fragment += '<option value="' + Bank + '">' + desc + '</option>';
        //        });
        //    }
        //    $("#Emp_BankBranch").append(fragment);
        //}

        function GetUsername(response) {
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var user = val[0]
                    $("#UserName").val(user);
                });
            }
        }

        function GetTypeLeave(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var Name = val[0];
                    var TH_Name = val[1];
                    fragment += '<option value="' + TH_Name + '">' + TH_Name + '</option>';
                    //console.log(TH_Name);
                });
            }
            $("#EmpLeave").append(fragment)
        }

        function Getleave(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[0];
                    var EmpNum = val[1];
                    var UserName = val[6];
                    var type = val[2];
                    var startdate = val[3];
                    var enddate = val[4];
                    var redirect = val[5];

                    fragment += '<tr data-id="' + ID + '">';
                    fragment += '<td style="display:none;">' + EmpNum + '</td>';
                    fragment += '<td>' + UserName + '</td>';
                    fragment += '<td>' + type + '</td>';
                    fragment += '<td>' + startdate + '</td>';
                    fragment += '<td>' + enddate + '</td>';
                    fragment += '<td>' + redirect + '</td>';
                    fragment += '<td><button type="button" class="btn btn-danger btndeleteleave">Delete</button></td>';
                    fragment += '</tr>';
                });
            } else { }
            $("#ListLeave").before(fragment);
        }

        //function getshowcomp(response) {
        //    //console.log(response.d);
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var Division = val[4];
        //            var Company = val[3];
        //            var Costcenter = val[5];
        //            //console.log(Division + ":" + Company + ":" + Costcenter)
        //            //if (Division != "") { }
        //            $("#Emp_Company").val(response.d[0][3]);
        //            $("#Emp_Division").val(response.d[0][4]);
        //            $("#Emp_CostCenter").val(response.d[0][5]);
        //        });
        //    }
        //}

        function getlistcomp(response) {
            //console.log(response.d);
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var Company = val[4];
                    var Group = val[3];
                    var CostCenter = val[2];
                    var position = val[1];

                    //alert("Hello")


                    fragment += '<tr>'
                    fragment += '<td>' + Company + '</td>'
                    fragment += '<td>' + position + '</td>'
                    fragment += '<td>' + Group + '</td>'
                    fragment += '<td>' + CostCenter + '</td>'
                    fragment += '</tr>'
                });
            } else {
                fragment += '<tr>'
                fragment += '<td></td>'
                fragment += '<td>ไม่มี Company ที่ Acting อยู่</td>'
                fragment += '<td></td>'
                fragment += '<td></td>'
                fragment += '</tr>'
            }
            $("#ListComp").append(fragment);
            //$("#ListComp").before(fragment);
        }

        //function getlistcompMain(response) {
        //    console.log(response.d);
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var Jobtitle = val[1]
        //            var Company = val[4];
        //            var Group = val[3];
        //            var CostCenter = val[2];
        //            var site_ref = val[6];
        //            var emp_num = val[0];

        //            $("#Emp_Company").val(Company);
        //            $("#Emp_Division").val(Group);
        //            $("#Emp_CostCenter").val(CostCenter);
        //            $("#JobTitle").val(Jobtitle);
        //            $("#Orgchart").attr("src", "http://portalapp01/PyramidSystem/Projects/MyTeam?site_ref=ERP_PK&EmpNum=" + emp_num)
        //        });
        //    } else { }
        //}

        //function getlistPyramid(response) {
        //    console.log(response.d);
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var emp_num = val[0];
        //            var Site_ref = val[6];
        //            $("#Orgchart").attr("src", "http://portalapp01/PyramidSystem/Projects/MyTeam?site_ref=ERP_PK&EmpNum=" + emp_num)
        //        });
        //    } else { }
        //}

        //function getlistjob(response) {
        //    //console.log(response.d);
        //    var fragment = '';
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var id = val[0];
        //            var Emp_Num = $("#Emp_Num").val();
        //            var Company = val[4];
        //            var JobExperience = val[2];
        //            var EndDate = val[3];

        //            fragment += '<tr data-id="' + id + '">'
        //            fragment += '<td><input type="text" name="Empcom" class="form-control max-wide"  value="' + Company + '"></td>'
        //            fragment += '<td><input type="text" name="Empjobexp" class="form-control max-wide"  value="' + JobExperience + '"></td>'
        //            fragment += '<td><input type="text" name="Empenddate" class="form-control max-wide"  value="' + EndDate + '"></td>'
        //            fragment += '<td><button class="btn btn-warning btnupdatejob" type="button">Update</button></td>'
        //            fragment += '<td><button type="button" class="btn btn-danger btndeletejob">Delete</button></td>';
        //            fragment += '</tr>'
        //        });
        //    } else { }
        //    $("#ListJobExp tr:first").before(fragment);
        //}

        //function getlistEdu(response) {
        //    //console.log(response.d)
        //    var fragment = '';
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var id = val[0];
        //            var Level = val[1];
        //            var Institution = val[2];
        //            var Faculty = val[3];
        //            var Major = val[4];
        //            var Graduate = val[5];
        //            var Emp_Num_Edu = $("#Emp_Num").val();
        //            //console.log(id + ':' + Level + ':' + Institution + ':' + Faculty + ':' + Major + ':' + Graduate + ':' + Emp_Num_Edu)

        //            fragment += '<tr data-id="' + id + '">'
        //            fragment += '<td><input type="text" name="EduEmpNum" class="form-control max-wide"  value="' + Emp_Num_Edu + '"></td>'
        //            fragment += '<td><input type="text" name="Edulevel" class="form-control max-wide"  value="' + Level + '"></td>'
        //            fragment += '<td><input type="text" name="EduInsi" class="form-control max-wide"  value="' + Institution + '"></td>'
        //            fragment += '<td><input type="text" name="EduFacu" class="form-control max-wide"  value="' + Faculty + '"></td>'
        //            fragment += '<td><input type="text" name="EduMajor" class="form-control max-wide"  value="' + Major + '"></td>'
        //            fragment += '<td><input type="text" name="EduGraduate" class="form-control max-wide"  value="' + Graduate + '"></td>'
        //            fragment += '<td><button class="btn btn-warning btnupdateEdu" type="button">Update</button></td>'
        //            fragment += '<td><button type="button" class="btn btn-danger btndeleteEdu">Delete</button></td>';
        //            fragment += '</tr>'
        //        });
        //    } else { }
        //    $("#ListEdu tr:first").before(fragment);
        //}

        //function GetListCetificate(response) {
        //    //console.log(response.d);
        //    var fragment = '';
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {
        //            var ID = val[0];
        //            var Emp_Num_cer = $("#Emp_Num").val();
        //            var Certificate = val[2];
        //            var Description = val[4];
        //            //console.log(ID + ":" + Emp_Num_cer + ":" + Certificate + ":" + Description)

        //            fragment += '<tr data-id = "' + ID + '">'
        //            fragment += '<td><input type="text" name="EmpnumCer" class="form-control max-wide" value="' + Emp_Num_cer + '"></td>';
        //            fragment += '<td><input type="text" name="EmpCer" class="form-control max-wide" value="' + Certificate + '"></td>';
        //            fragment += '<td><input type="text" name="EmpDesc" class="form-control max-wide" value="' + Description + '"></td>';
        //            fragment += '<td><button class="btn btn-warning btnupdateCer" type="button">Update</button></td>'
        //            fragment += '<td><button type="button" class="btn btn-danger btndeleteCer">Delete</button></td>';
        //            fragment += '</tr>'
        //        });
        //    } else { }
        //    $("#ListCer tr:first").before(fragment)
        //}

        //function GetListPermission(response) {
        //    //console.log(response.d);
        //    var fragment = '';
        //    if (response.d.length > 0) {
        //        $.each(response.d, function (index, val) {

        //            var Emp_Num_Per = $("#Emp_Num").val();
        //            var Username = val[1];
        //            var Permission = val[2];
        //            //console.log(ID + ":" + Emp_Num_Per + ":" + Username + ":" + Permission)

        //            fragment += '<tr data-id>';
        //            //fragment += '<td><input type="text" name="EmpnumPer"class="form-control max-wide" value="' + Emp_Num_Per + '"></td>';
        //            fragment += '<td><input type="text" name="EmpUser" class="form-control max-wide" value="' + Username + '"></td>';
        //            fragment += '<td><input type="text" name="Emptype" class="form-control max-wide" value="' + Permission + '"></td>';
        //            fragment += '</tr>'
        //        });
        //    } else { }
        //    $("#ListPer tr:first").before(fragment)
        //}

        function GetListBUGroup(response) {
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var BUname = val[4];
                    $('#Emp_Division').val(BUname);
                });
            }
            else {
                $('#Emp_Division').val('');
            }
            //if ($('#Emp_CostCenter').val() == '') {
            //}
        }

        function GetPosition(response) {
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var jobtitle = localStorage.getItem("type") == 'TH' ? val[1] : val[2];
                    $('#JobTitle').val(jobtitle);
                });
            }
            else {
                $('#JobTitle').val('');
            }
        }

        function GetBank_ID(response) {
            if (response.d.length > 0 && sessionStorage.getItem('Bank_ID')!="") {
                $.each(response.d, function (index, val) {
                    var bank = val[0];
                    var desc = val[1];
                    $('#Emp_Bank').val(desc);

                });
            }
            else {
                $('#Emp_Bank').val('');
            }
        }

        function GetBranch(response) {
            if (response.d.length > 0 && sessionStorage.getItem('Bank_Branch')!="") {
                $.each(response.d, function (index, val) {
                    var bank = val[0];
                    var desc = val[1];
                    $('#Emp_BankBranch').val(desc);

                });
            }
            else {
                $('#Emp_BankBranch').val('');
            }
        }

        function GetCountry(response) {
            if (response.d.length > 0 && sessionStorage.getItem('Emp_Country')!='') {
                $.each(response.d, function (index, val) {
                    var code = val[0];
                    var country = localStorage.getItem("type") == 'TH' ? val[2] : val[1];
                    $('#Emp_Country').val(country);
                    sessionStorage.setItem('Emp_Country', code);
                });
            }
            else {
                $('#Emp_Country').val('');
            }
            //if ($('#Emp_CostCenter').val() == '') {
            //}
        }
        function GetTbListRedirect(response) {
                var fragment = '';
                if (response.d.length > 0) {
                console.log(response);
                $.each(response.d, function (index, val) {
                    var K2ID = val[0];
                    var WFtype = val[1];
                    var WorkflowType = val[2];
                    var Subject = val[3];
                    var Requester = val[4];
                    var CreateDate = val[5];
                    var Activity = val[6];
                    var site_ref = val[7];
                    var status = val[8];
                    var user = val[9];
                    var ActDate = val[10];
                    var linkNew = val[11];
                    var TB_Name = val[12];
                    var Type = val[13];
                    var idmain = val[14];
                    var Flowtype = val[15];
                    var k2vers = val[16];
                    fragment += '<tr>';
                    fragment += '<td>' + '<a href="http://pk-flow/application_Software_Space' + linkNew + '&Site_ref=' + site_ref + '&ID=' + idmain + '&K2=' + K2ID + '&TypeK2=' + Type + '&FlowType=' + Flowtype + '" '+ ' >' + K2ID + '</a> ' + '</td> ';
                    fragment += '<td>' + WorkflowType + '</td>';
                    fragment += '<td>' + Subject + '</td>';
                    fragment += '<td>' + CreateDate + '</td>';
                    fragment += '<td>' + '<a href="http://portalapp01/PersonalWorkspace/HistoryViewFlow.aspx?site_ref='+site_ref+'&K2='+K2ID+'&K2Vers='+k2vers+'Type='+WFtype+'"  >' +' view flow '+ '</a> ' + '</td>';
                    fragment += '<td>' +'<button type="button" class="btn btn-primary btnbrowseuserRedirect" data-K2="'+K2ID+'"> <i class="glyphicon glyphicon-search"></i> </button> '+ '</td>';
                    fragment += '<tr/>';

                    });
                    
                   $("#ListRediRedirectrect").append(fragment);
            }
        }

        function InputNumber(evt) {
            var ch = String.fromCharCode(evt.which)
            if (!(/[0-9]/.test(ch))) {
                evt.preventDefault();
            }
        }

        function dateValidation(id) {
            $('#' + id).css({ "border": "2px solid red" });
            $('#btnupdate').prop('disabled', true);
        }
        function datesuccess(id) {
            $('#' + id).css({ "border": " 1px solid #ccc" });
            $('#btnupdate').prop('disabled', false);
        }

        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) 
                month = '0' + month;
            if (day.length < 2) 
                day = '0' + day;

            return [day.toString(), month.toString(), year.toString()].join('/');
        }

        //------------------------Start Export---------------------------------
        function GetExport() {
            var Emp_Company = $("#Emp_CompanyExport").val();
            var Emp_Group = $("#Emp_GroupExport").val();
            var CostCenterStart = $("#Emp_CostCenterStartExport").val();
            var CostCenterEnd = $("#Emp_CostCenterEndExport").val();
            var ExportActive = $("#ExportActive").is(':checked') ? "Active" : "";
            var ExportInActive = $("#ExportInActive").is(':checked') ? "InActive" : "";
            var type = localStorage.getItem("type");
            if (Emp_Company !== "") {
                if (ExportActive !== "" || ExportInActive !== "") {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetExportEmp") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            Emp_Company: Emp_Company,
                            Emp_Group: Emp_Group,
                            CostCenterStart: CostCenterStart,
                            CostCenterEnd: CostCenterEnd,
                            ExportActive: ExportActive,
                            ExportInActive: ExportInActive,
                            type: type
                        }),
                        success: function (response) {
                            var header = response.d[0];
                            var items = response.d[1];
                            var fragment = '';
                            var fragmentheader = '';
                            if (response.d.length > 0) {
                                var checkindex = 0;
                                fragment += '<tr>';
                                $.each(header, function (index, val) {
                                    fragment += '<th>' + val[0] + '</th>';
                                });
                                fragment += '</tr>';
                                $.each(items, function (index, val) {
                                    fragment += '<tr>';
                                    for (var i = 0; i < val.length; i++) {
                                        fragment += '<td>' + val[i] + '</td>';
                                    }
                                    fragment += '</tr>';
                                });
                                $("#tbodyEmpExport").empty();
                                $("#tbodyEmpExport").append(fragment);

                                var DataArray = new Array();
                                var table = document.getElementById("TableEmpExport");
                                for (var i = 1; i < table.rows.length; i++) {
                                    var row = table.rows[i];

                                    var obj = {};
                                    for (var j = 0; j < row.cells.length; j++) {
                                        var name = table.rows[0].cells[j].innerHTML;
                                        var value = row.cells[j].innerHTML;
                                        obj[name] = value;
                                    }
                                    DataArray.push(obj);
                                }
                                document.getElementsByName("CustomerJSON")[0].value = JSON.stringify(DataArray);

                            }
                            else {
                                alert("Not Deta.");
                            }
                        }, error: function () {
                            alert('error!');
                        }
                    });
                } else{ alert("Please Check Status")}
            }else { alert("Please Select Company")}
        }
            //------------------------End Export---------------------------------
        
    </script>
</asp:Content>
