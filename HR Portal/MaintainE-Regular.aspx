<%@ Page Title="E-Regular" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MaintainE-Regular.aspx.cs" Inherits="HR_Portal.MaintainE_Regular" %>
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
        .nav-tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }
        .ui-datepicker{
            z-index:1600  !important;
        }
        #modalBrowse{
            z-index:1560  !important;

        }
        .float-left{
            float:left;
        }
        .center{
            margin: 0 auto;
            float: none;
        }
        .nav-tab{
            background-color:#FFFFFF !important;
        }
    </style>
    <div class="page-header">
        <h2>Maintain E-Regular</h2>
         <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                <input type="text" style="display:none;" id="payIDUpdate" value="0" />
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <button id="btnSave" class="btn btn-info" type="button" data-toggle="modal"> Save </button>
                <button id="btnNew" class="btn btn-success" type="button" data-toggle="modal"> New </button>
                <button id="btnSearch" class="btn btn-default" type="button" data-toggle="modal"> Search </button>
                <button id="btnExport"class="btn btn-warning" type="button" data-toggle="modal" > Export </button>
            </div>
        </div>

    </div>
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Payment ID:</label>
                            </div>
                            <div class="col-md-7 col-sm-7 col-xs-12">
                                <div class="input-group">
                                    <input id="payment" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="payment">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <p id="payTypeName"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                    </div>
                </div>
                <div class="row form-group showDetails">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Regular Type:</label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="float-left">
                                    <label class="radio-inline">
                                        <input name="regType" id="radioCostcenter" value="Costcenter" type="radio" checked/><span>Costcenter</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input name="regType" id="radioEmployee" value="Employee" type="radio"  /><span>Employee</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        
                    </div>
                </div>

                <div class="row form-group showDetails">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="caseCostcenter" style="display:none;">
                            <div class="row form-group">
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Costcenter:</label>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <div class="input-group">
                                        <input id="costcenter" type="text" class="form-control max-wide" disabled>
                                        <div class="input-group-btn">
                                            <button class="btn btn-default Browse_modal" type="button" data-type="costcenter">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>

                        <div class="caseEmployee" >
                            <div class="row form-group">
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Emp Num:</label>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <div class="input-group">
                                        <input id="empNum" type="text" class="form-control max-wide" disabled>
                                        <div class="input-group-btn">
                                            <button class="btn btn-default Browse_modal" type="button" data-type="Employee">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Costcenter:</label>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <p id="empCostcenter"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group caseCostcenter">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Level:</label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="input-group">
                                    <input id="leavel" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="level">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="caseEmployee">
                            <div class="row form-group">
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Emp Name:</label>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <p id="empName"></p>
                                </div>
                            </div>
                            
                        </div>
                    </div>

                </div>

                <div class="row form-group showDetails">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Value:</label>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <input id="value" type="text" class="form-control max-wide">
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                            <label class="control-label" > Bath </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row form-group showDetails">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Effect Date:</label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12" data-provide="datepicker">
                                <div class="input-group">
                                    <input id="startDate" type="text" class="form-control max-wide" autocomplete="off" placeholder="dd/mm/yyyy" >
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    
                                </div>
                                <%--<input placeholder="dd/mm/yyyy" id="startDate" type="text" class="form-control max-wide" autocomplete="off">--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-1 col-sm-1 col-xs-12">
                                <label class="control-label" style="font-size: 20px;"> - </label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12" data-provide="datepicker">
                                <div class="input-group">
                                    <input id="endDate" type="text" class="form-control max-wide" autocomplete="off" placeholder="dd/mm/yyyy" >
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                                <%--<input placeholder="dd/mm/yyyy" id="endDate" type="text" class="form-control max-wide" autocomplete="off">--%>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="modalSiteRef" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <%--<div class="modal-header">
                </div>--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;text-align:center;height:500px;">
                    <div style="margin-top: 25%;">
                        <label style="font-size:20px;">Select a company</label>
                        <select class="form-control center" style="max-width:70%;margin-top:1rem;" id="siteRef">
                            <option value="">=======Please Select a company=======</option>
                        </select>
                    </div>
                    
                </div>

            </div>
        </div>
    </div>
    <%--modalSiteRef  --%>

    <div class="modal fade" id="modalPayment" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <button id="newPayment" type="button" class="btn btn-success" data-dismiss="modal">New</button>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 35em; max-width: 100%;">
                    <div class="row form-group">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-3 col-sm-3 col-xs-12" style="text-align:center;">
                                <label class="control-label">Payment ID:</label>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <div class="input-group">
                                    <input id="modalPaymentID" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="Paymentmodal">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-1 col-xs-12">
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top:1rem;">
                            <div class="col-md-3 col-sm-3 col-xs-12"style="text-align:center;">
                                <label class="control-label" >Ref:</label>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <input id="ref" type="text" class="form-control max-wide" >
                            </div>
                            <div class="col-md-1 col-sm-1 col-xs-12">
                            </div>
                        </div>
                    </div>
                    <div style="float:right;margin:1rem;">
                        <button id="searchPayment" type="button" class="btn btn-default" >Search</button>
                    </div>
                    <table id="TbListSearch" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header">
                                <th style="width: 20%">Pay ID</th>
                                <th>Payment Name</th>
                                <th>Costcenter</th>
                                <th>Ref.</th>
                            </tr>
                        </thead>
                        <tbody id='TBbodySearch'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--modalPayment  --%>

    

    <%--Export Modal--%>
    <div class="modal fade" id="modalExport" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" >
                        <div class="col-md-6 col-lg-6 col-sm-6">
                            <h4 class="modal-title">Export</h4>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6" >
                            <div style="float:right;">
                                <button type="button" id="clear" class="btn btn-default">Clear</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="panel nav-tab">
                            <div class="panel-heading">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item active">
                                        <a href="#tab1" class="nav-link" role="tab" data-toggle="tab" id="paymentsTabs">Data</a>
                                    </li>
                                    <li class="nav-item ">
                                        <a href="#tab2" class="nav-link " role="tab" data-toggle="tab" id="benefitsTabs">Employee</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="tab1">
                                    <div class="col-md-12 col-lg-12 col-sm-12">
                                        <div class="col-md-12 col-lg-12 col-sm-12" >
                                            <div class="row form-group ">
                                                <div class="col-md-2 col-sm-2 col-xs-12">
                                                    <label class="control-label" >Payment ID:</label>
                                                </div>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="paymentExport" type="text" class="form-control max-wide" disabled>
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="paymentExport">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-sm-12 col-xs-12" >
                                            <div class="row form-group ">
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="row form-group">
                                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label class="control-label">Costcenter:</label>
                                                        </div>
                                                        <div class="col-md-8 col-sm-8 col-xs-12" >
                                                            <div class="input-group">
                                                                <input id="costExport" type="text" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-default Browse_modal" type="button" data-type="costExport">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="row form-group">
                                                        <div class="col-md-1 col-sm-1 col-xs-12">
                                                            <label class="control-label" style="font-size: 20px;">- </label>
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-12" >
                                                            <div class="input-group">
                                                                <input id="costToExport" type="text" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-default Browse_modal" type="button" data-type="costToExport">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Emp_GroupExport--%>
                                        <div class="col-md-12 col-sm-12 col-xs-12" >
                                            <div class="row form-group ">
                                                <div class="col-md-2 col-sm-2 col-xs-12">
                                                    <label class="control-label">Level:</label>
                                                </div>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input type="text" id="levelExport" class="form-control max-wide" disabled />
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="levelExport">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12" >
                                        <div class="row form-group ">
                                            <div class="col-md-2 col-sm-2 col-xs-12">
                                                <label class="control-label" >EmpNum:</label>
                                            </div>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <div class="input-group">
                                                    <input type="text" id="empExport" class="form-control max-wide" disabled />
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default Browse_modal" type="button" data-type="empExport">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12" >
                                            <div class="row form-group ">
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="row form-group">
                                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label class="control-label">Effect Date:</label>
                                                        </div>
                                                        <div class="col-md-8 col-sm-8 col-xs-12" >
                                                            <div class="input-group">
                                                                <input id="effDateExport" type="text" class="form-control max-wide" autocomplete="off" placeholder="dd/mm/yyyy" readonly="readonly">
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="row form-group">
                                                        <div class="col-md-1 col-sm-1 col-xs-12">
                                                            <label class="control-label" style="font-size: 20px;">- </label>
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-12" >
                                                            <div class="input-group">
                                                                <input id="effDateToExport" type="text" class="form-control max-wide" autocomplete="off" placeholder="dd/mm/yyyy" readonly="readonly">
                                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab2">
                                    <div class="col-md-12 col-sm-12 col-xs-12" >
                                        <div class="col-md-12 col-sm-12 col-xs-12" >
                                            <div class="row form-group">
                                                <div class="col-md-2 col-sm-2 col-xs-12">
                                                    <label class="control-label" >EmpNum:</label>
                                                </div>
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input type="text" id="empExportBenefits" class="form-control max-wide" disabled />
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal" type="button" data-type="empExportBenefits">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-sm-12 col-xs-12" >
                                            <div class="row form-group ">
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="row form-group">
                                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label class="control-label">Costcenter:</label>
                                                        </div>
                                                        <div class="col-md-8 col-sm-8 col-xs-12" >
                                                            <div class="input-group">
                                                                <input id="costExportBenefits" type="text" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-default Browse_modal" type="button" data-type="costExportBenefits">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="row form-group">
                                                        <div class="col-md-1 col-sm-1 col-xs-12">
                                                            <label class="control-label" style="font-size: 20px;">- </label>
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-12" >
                                                            <div class="input-group">
                                                                <input id="costToExportBenefits" type="text" class="form-control max-wide" autocomplete="off" readonly="readonly">
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-default Browse_modal" type="button" data-type="costToExportBenefits">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--Start Table Export--%>
                    <div class="col-md-12 ExportTable" style="display:none;" >
                        <div class="table-responsive" style="max-height: 18em; overflow-y: scroll;">
                            <table id="TableExport" class="table table-striped table-bordered table-responsive">
                                <thead id="theaderExport">
                                    <tr class="header">
                                        <th>Code</th>
                                        <th>Name</th>
                                        <th>Type</th>
                                        <th>Costcenter</th>
                                        <th>EmpNum/Level</th>
                                        <th>Value</th>
                                        <th>Effect Start</th>
                                        <th>Effect End</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyExport">
                                </tbody>
                            </table>
                            <%--<input type="hidden" name="CustomerJSON" />--%>
                        </div>
                    </div>
                </div>
                <%--End Table Export--%>
                <div class="modal-footer">
                    <div style="float:left;">
                        <button type="button" class="btn btn-default" id="preview">Preview</button>
                    </div>
                    <asp:Button runat="server" Class="btn btn-warning" Text="Export" ID="exportTableC" OnClientClick="return GetExport();"  OnClick="exportTableC_onClick" />
                    <button type="button" class="btn btn-default" id="exportClose" data-dismiss="modal">Close</button>
                </div>
                
            </div>
        </div>
    </div>
    <div style="overflow: hidden; width: 0; height: 0;">
        <asp:TextBox runat="server" ID="snspayment" />
        <asp:TextBox runat="server" ID="snscost" />
        <asp:TextBox runat="server" ID="snscostTo" />
        <asp:TextBox runat="server" ID="snslevel" />
        <asp:TextBox runat="server" ID="snsemp" />
        <%--<asp:TextBox runat="server" ID="snseffDate" />--%>
        <asp:TextBox ID="snseffDate" runat="server"></asp:TextBox>
        <asp:TextBox ID="snsteffEnd" runat="server"></asp:TextBox>
        <asp:TextBox runat="server" ID="snssite_ref" />
        <asp:TextBox ID="snsCheck" runat="server"></asp:TextBox>
        <asp:TextBox ID="snsempBenefits" runat="server"></asp:TextBox>
        <asp:TextBox ID="snscostBenefit" runat="server"></asp:TextBox>
        <asp:TextBox ID="snscostToBenefit" runat="server"></asp:TextBox>
    </div>
    <%--End Export Modal--%>

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
    <%--modalBrowse --%>

    <script type="text/javascript">

        $(document).ready(function () {

            
            sessionStorage.removeItem("siteRef");
            sessionStorage.removeItem("checkdata");
            $(".showDetails").css("display", "none");
            sessionStorage.setItem('Page_type', 'E-Regular');
            sessionStorage.setItem("nav-tab", "payment");

            //// DatePicker
            $("#startDate").datepicker({ dateFormat: "dd/mm/yy"});
            $('#endDate').datepicker({ dateFormat: "dd/mm/yy" });
            $("#effDateExport").datepicker({ dateFormat: "dd/mm/yy"});
            $('#effDateToExport').datepicker({ dateFormat: "dd/mm/yy" });

            ////SiteRef Modal
            $("#modalSiteRef").modal("show");
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetSiteRef")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetSiteRef
            });
            $("#siteRef").on('change', function () {
                var siteRef = $("#siteRef").val();
                if (siteRef) {
                    $("#modalPayment").modal("show");
                    sessionStorage.setItem("siteRef", siteRef);
                    $("#modalSiteRef").modal("hide");
                }
            });

            //New Payment
            $("#newPayment").on("click", function () {
                $("#payIDUpdate").val(0);
                $("#payment").val('');
                $("#costcenter").val('');
                $("#leavel").val('');
                $("#value").val('');
                $("#empNum").val('');
                $("#empName").text('');
                $("#empCostcenter").text('');
                $("#startDate").val('');
                $("#endDate").val('');
                $("#payTypeName").text('');
                $("#radioCostcenter").prop("checked", true);
                $(".caseCostcenter").css('display', 'block');
                $(".caseEmployee").css('display', 'none');
                $(".showDetails").css("display","none");
                $("#modalSiteRef").modal("hide");
                $("#modalPayment").modal("hide");
            });

            //Regular Type Switch
            $(".caseCostcenter").css('display', 'block');
            $(".caseEmployee").css('display', 'none');
            $("input[name=regType]").on('change', function () {
                if ($("#radioCostcenter").is(':checked')) {
                    $(".caseCostcenter").css('display', 'block');
                    $(".caseEmployee").css('display', 'none');
                }
                else if ($("#radioEmployee").is(':checked')) {
                    $(".caseCostcenter").css('display', 'none');
                    $(".caseEmployee").css('display', 'block');
                }
            });

            //tabs select
            $("#paymentsTabs").on("click", function () {
                sessionStorage.setItem("nav-tab", "payment");
                $("#paymentExport").val('');
                $("#costExport").val('');
                $("#costToExport").val('');
                $("#levelExport").val('');
                $("#empExport").val('');
                $("#effDateExport").val('');
                $("#effDateToExport").val('');
                $("#empExportBenefits").val('');
                $("#costExportBenefits").val('');
                $("#costToExportBenefits").val('');
                $(".ExportTable").css("display","none");
            });
            $("#benefitsTabs").on("click", function () {
                sessionStorage.setItem("nav-tab", "benefit");
                $("#paymentExport").val('');
                $("#costExport").val('');
                $("#costToExport").val('');
                $("#levelExport").val('');
                $("#empExport").val('');
                $("#effDateExport").val('');
                $("#effDateToExport").val('');
                $("#empExportBenefits").val('');
                $("#costExportBenefits").val('');
                $("#costToExportBenefits").val('');
                $(".ExportTable").css("display","none");
            });
            $("#clear").on("click", function () {
                //sessionStorage.setItem("nav-tab", "benefit");
                $("#paymentExport").val('');
                $("#costExport").val('');
                $("#costToExport").val('');
                $("#levelExport").val('');
                $("#empExport").val('');
                $("#effDateExport").val('');
                $("#effDateToExport").val('');
                $("#empExportBenefits").val('');
                $("#costExportBenefits").val('');
                $("#costToExportBenefits").val('');
                $(".ExportTable").css("display","none");
            });
            //Buttons
            $("#btnSave").on("click", function () {
                var id = $("#payIDUpdate").val();
                var payID = $("#payment").val();
                var cost = $("#costcenter").val() == '' ? $("#empCostcenter").text() : $("#costcenter").val();
                var level = $("#leavel").val();
                var empNum = $("#empNum").val();
                var value = $("#value").val();
                var strDate = $("#startDate").val();
                var endDate = $("#endDate").val();
                var payName = $("#payTypeName").text();
                var type = $("input[name=regType]:Checked").val();
                //console.log("id", id); console.log("payID", payID); console.log("cost", cost); console.log("level", level); console.log("value", value);
                //console.log("empNum", empNum); console.log("strDate", strDate); console.log("endDate", endDate); console.log("payName", payName); console.log("type", type);
                if (!level) {
                    level = empNum;
                }
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_HR_ERegulars") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID : id,
                        Payment_ID:payID,
                        CostCenter: cost,
                        Level_OR_EmpNum: level,
                        Value: value,
                        Start_Date: strDate,
                        End_Date: endDate,
                        Type: type,
                        site_ref: sessionStorage.getItem("siteRef")
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            alert(response.d);
                        } else { }
                    }
                });
            });
            $("#btnSearch").on("click", function () {
                $("#modalPayment").modal("show");
            });
            $("#btnNew").on("click", function () {
                $("#payIDUpdate").val(0);
                $("#payment").val('');
                $("#costcenter").val('');
                $("#leavel").val('');
                $("#value").val('');
                $("#empNum").val('');
                $("#empName").text('');
                $("#empCostcenter").text('');
                $("#startDate").val('');
                $("#endDate").val('');
                $("#payTypeName").text('');
                $("#radioCostcenter").prop("checked", true);
                $(".caseCostcenter").css('display', 'block');
                $(".caseEmployee").css('display', 'none');
            });
            $("#btnExport").on("click", function () {
                $("#paymentExport").val('');
                $("#costExport").val('');
                $("#costToExport").val('');
                $("#levelExport").val('');
                $("#empExport").val('');
                $("#effDateExport").val('');
                $("#effDateToExport").val('');
                $("#empExportBenefits").val('');
                $("#costExportBenefits").val('');
                $("#costToExportBenefits").val('');
                $("#modalExport").modal("show");
            });

            //Preview Table
            $("#preview").on('click', function () {
                if (sessionStorage.getItem("nav-tab") == "payment") {
                    var paymentID = $("#paymentExport").val();
                    var costExport = $("#costExport").val();
                    var costToExport = $("#costToExport").val();
                    var levelExport = $("#levelExport").val();
                    var empExport = $("#empExport").val();
                    var effDateExport = $("#effDateExport").val();
                    var effDateToExport = $("#effDateToExport").val();
                    $("#tbodyExport").empty();
                    if ((costToExport != "" && costExport == "") || (effDateToExport != "" && effDateExport == "") || (effDateToExport == "" && effDateExport != "")) {
                        alert("Please Check Input");
                    } else {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/GetExportPreview") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({
                                paymentID: paymentID,
                                costExport: costExport,
                                costToExport: costToExport,
                                levelExport: levelExport,
                                empExport: empExport,
                                effDateExport: effDateExport,
                                effDateToExport: effDateToExport,
                                site_ref: sessionStorage.getItem("siteRef")
                            }),
                            success: function (response) {
                                var fragment = '';
                                var header = '';
                                if (response.d.length > 0) {
                                    $(".ExportTable").css("display", "block");
                                    $.each(response.d, function (index, val) {
                                        var code = val[0];
                                        var name = val[1];
                                        var type = val[2];
                                        var CostCenter = val[3];
                                        var EmpNum_Level = val[4];
                                        var Value = val[5];
                                        var Start_Date = val[6];
                                        var End_Date = val[7];

                                        fragment += '<tr>';
                                        fragment += '<td>' + code + '</td>';
                                        fragment += '<td>' + name + '</td>';
                                        fragment += '<td>' + type + '</td>';
                                        fragment += '<td>' + CostCenter + '</td>';
                                        fragment += '<td>' + EmpNum_Level + '</td>';
                                        fragment += '<td>' + Value + '</td>';
                                        fragment += '<td>' + Start_Date + '</td>';
                                        fragment += '<td>' + End_Date + '</td>';
                                        fragment += '</tr>';
                                    });
                                } else {
                                    alert("No Data");
                                }
                                header += '<tr class="header">';
                                header += '<th>Code</th>';
                                header += '<th>Name</th>';
                                header += '<th>Type</th>';
                                header += '<th>Costcenter</th>';
                                header += '<th>EmpNum/Level</th>';
                                header += '<th>Value</th>';
                                header += '<th>Effect Start</th>';
                                header += '<th>Effect End</th>';
                                header += '</tr>';
                                $("#theaderExport").empty();
                                $("#theaderExport").append(header);
                                $("#tbodyExport").append(fragment);
                            }
                        });
                    }
                }
                else if (sessionStorage.getItem("nav-tab") == "benefit") {
                    var empExport = $("#empExportBenefits").val();
                    var costExport = $("#costExportBenefits").val();
                    var costToExport = $("#costToExportBenefits").val();
                    $("#tbodyExport").empty();
                    if (costToExport != "" && costExport == "") {
                        alert("Please Check Input");
                    } else {
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/GetExportPreviewSearch") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({
                                empExport: empExport,
                                costExport: costExport,
                                costToExport: costToExport,
                                site_ref: sessionStorage.getItem("siteRef")
                            }),
                            success: function (response) {
                                var fragment = '';
                                var header = '';
                                if (response.d.length > 0) {
                                    $(".ExportTable").css("display", "block");
                                    $.each(response.d, function (index, val) {
                                        var code = val[0];
                                        var name = val[1];
                                        var EmpNum = val[2];
                                        var EmpName = val[3];
                                        var CostCenter = val[4];
                                        var EmpNum_Level = val[5];
                                        var Value = val[6];
                                        var Start_Date = val[7];
                                        var End_Date = val[8];

                                        fragment += '<tr>';
                                        fragment += '<td>' + code + '</td>';
                                        fragment += '<td>' + name + '</td>';
                                        fragment += '<td>' + EmpNum + '</td>';
                                        fragment += '<td>' + EmpName + '</td>';
                                        fragment += '<td>' + CostCenter + '</td>';
                                        fragment += '<td>' + EmpNum_Level + '</td>';
                                        fragment += '<td>' + Value + '</td>';
                                        fragment += '<td>' + Start_Date + '</td>';
                                        fragment += '<td>' + End_Date + '</td>';
                                        fragment += '</tr>';
                                    });
                                } else {
                                    alert("No Data");
                                }
                                header += '<tr class="header">';
                                header += '<th>Code</th>';
                                header += '<th>Name</th>';
                                header += '<th>EmpNum</th>';
                                header += '<th>EmpName</th>';
                                header += '<th>Costcenter</th>';
                                header += '<th>EmpNum/Level</th>';
                                header += '<th>Value</th>';
                                header += '<th>Effect Start</th>';
                                header += '<th>Effect End</th>';
                                header += '</tr>';
                                $("#theaderExport").empty();
                                $("#theaderExport").append(header);
                                $("#tbodyExport").append(fragment);
                            }
                        });
                    }
                }
            });

            //modal Browse
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
                

                if (browse_type == 'Paymentmodal') {
                    $("#browseHeader").text('Payment');
                    $("#search_box").empty();
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetPaymentID") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef") }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectpaymentID" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectpaymentID" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'Employee') {
                    $("#browseHeader").text('Employee');
                    $('#SearchBrowse').attr("id", 'search_Employee');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEemp") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:'' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var empNum = val[0];
                                    var name = val[1];
                                    var depart = val[2];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectemployee" href="javascript:void(0)" >' + empNum + '</a></td>';
                                    fragment += '<td><a class="clickselectemployee" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '<td><a class="clickselectemployee" href="javascript:void(0)" >' + depart + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'payment') {
                    $("#browseHeader").text('Payment');
                    $("#search_box").empty();
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetPaymentID") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef") }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectpayment" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectpayment" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'costcenter') {
                    $("#browseHeader").text('Costcenter');
                    $('#SearchBrowse').attr("id", 'search_Costcenter');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPCostcenter") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:''}),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectcostcenter" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectcostcenter" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'level') {
                    $("#browseHeader").text('Level');
                    $("#search_box").empty();
                    var num = 0;
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPLevel") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef") }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var empNum = val[0];
                                    num++;
                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectlevel" href="javascript:void(0)" >' + num + '</a></td>';
                                    fragment += '<td><a class="clickselectlevel" href="javascript:void(0)" >' + empNum + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'paymentExport') {
                    $("#browseHeader").text('Payment');
                    $("#search_box").empty();
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetPaymentID") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef") }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectpaymentexport" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectpaymentexport" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'costExport' || browse_type == 'costToExport' || browse_type == 'costExportBenefits' || browse_type == 'costToExportBenefits') {
                    $("#browseHeader").text('Costcenter');
                    $('#SearchBrowse').attr("id", 'search_'+browse_type);
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPCostcenter") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:''}),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselect'+browse_type+'" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselect'+browse_type+'" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'levelExport') {
                    $("#browseHeader").text('Level');
                    $("#search_box").empty();
                    var num = 0;
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPLevel") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef") }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var empNum = val[0];
                                    num++;
                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectlevelexport" href="javascript:void(0)" >' + num + '</a></td>';
                                    fragment += '<td><a class="clickselectlevelexport" href="javascript:void(0)" >' + empNum + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'empExport') {
                    $("#browseHeader").text('Employee');
                    $('#SearchBrowse').attr("id", 'search_EmployeeExport');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEemp") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:'' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var empNum = val[0];
                                    var name = val[1];
                                    var depart = val[2];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectemployeeexport" href="javascript:void(0)" >' + empNum + '</a></td>';
                                    fragment += '<td><a class="clickselectemployeeexport" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '<td><a class="clickselectemployeeexport" href="javascript:void(0)" >' + depart + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'empExportBenefits') {
                    $("#browseHeader").text('Employee');
                    $('#SearchBrowse').attr("id", 'search_empExportBenefits');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEemp") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:'' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var empNum = val[0];
                                    var name = val[1];
                                    var depart = val[2];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectempExportBenefits" href="javascript:void(0)" >' + empNum + '</a></td>';
                                    fragment += '<td><a class="clickselectempExportBenefits" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '<td><a class="clickselectempExportBenefits" href="javascript:void(0)" >' + depart + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
            });//End browse modal

            $("#searchPayment").on("click", function () {
                var payID = $("#modalPaymentID").val();
                var ref = $("#ref").val();
                var fragment = '';
                $("#TBbodySearch").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEERegular") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID:0,
                        paymentID : payID,
                        payTypeName : '',
                        costcenter : '',
                        Ref : ref,
                        site_ref : sessionStorage.getItem("siteRef")
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var id = val[0];
                                var pay_ID = val[1];
                                var payType = val[2];
                                var cost = val[3];
                                var ref = val[4];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectSearch" href="javascript:void(0)" data-id="'+id+'" >' + pay_ID + '</a></td>';
                                fragment += '<td><a class="clickselectSearch" href="javascript:void(0)" data-id="'+id+'" >' + payType + '</a></td>';
                                fragment += '<td><a class="clickselectSearch" href="javascript:void(0)" data-id="'+id+'" >' + cost + '</a></td>';
                                fragment += '<td><a class="clickselectSearch" href="javascript:void(0)" data-id="'+id+'" >' + ref + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodySearch").append(fragment);
                    }
                });
            });

            //Browse On change
            $(document).on('change',"#search_Employee", function () {
                var search = $("#search_Employee").val();
                $("#TBbodyBrowse").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEemp") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empNum = val[0];
                                var name = val[1];
                                var depart = val[2];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectemployee" href="javascript:void(0)" >' + empNum + '</a></td>';
                                fragment += '<td><a class="clickselectemployee" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '<td><a class="clickselectemployee" href="javascript:void(0)" >' + depart + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on('change', "#search_Costcenter", function () {
                var search = $("#search_Costcenter").val();
                $("#TBbodyBrowse").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPCostcenter") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectcostcenter" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectcostcenter" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on('change', "#search_costExport", function () {
                var search = $("#search_costExport").val();
                $("#TBbodyBrowse").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPCostcenter") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectcostExport" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectcostExport" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on('change', "#search_costToExport", function () {
                var search = $("#search_costToExport").val();
                $("#TBbodyBrowse").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPCostcenter") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectcostToExport" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectcostToExport" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on('change',"#search_EmployeeExport", function () {
                var search = $("#search_EmployeeExport").val();
                $("#TBbodyBrowse").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEemp") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empNum = val[0];
                                var name = val[1];
                                var depart = val[2];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectemployeeexport" href="javascript:void(0)" >' + empNum + '</a></td>';
                                fragment += '<td><a class="clickselectemployeeexport" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '<td><a class="clickselectemployeeexport" href="javascript:void(0)" >' + depart + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });

            $(document).on('change',"#search_empExportBenefits", function () {
                var search = $("#search_empExportBenefits").val();
                $("#TBbodyBrowse").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEemp") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var empNum = val[0];
                                var name = val[1];
                                var depart = val[2];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectempExportBenefits" href="javascript:void(0)" >' + empNum + '</a></td>';
                                fragment += '<td><a class="clickselectempExportBenefits" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '<td><a class="clickselectempExportBenefits" href="javascript:void(0)" >' + depart + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on('change', "#search_costExportBenefits", function () {
                var search = $("#search_costExportBenefits").val();
                $("#TBbodyBrowse").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPCostcenter") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectcostExportBenefits" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectcostExportBenefits" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on('change', "#search_costToExportBenefits", function () {
                var search = $("#search_costToExportBenefits").val();
                $("#TBbodyBrowse").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetERPCostcenter") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ site_ref: sessionStorage.getItem("siteRef"),search:search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectcostToExportBenefits" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectcostToExportBenefits" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });

            //ClickBrowse
            $(document).on("click", ".clickselectcostcenter", function () {
                var cost = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#costcenter").val(cost);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectlevel", function () {
                var level = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#leavel").val(level);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectpaymentID", function () {
                var paymentID = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#modalPaymentID").val(paymentID);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectpayment", function () {
                var paymentID = $(this).closest("tr").find("td:nth-child(1)").text();
                var paymentName = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#payment").val(paymentID);
                $("#payTypeName").text(paymentName);
                $("#modalBrowse").modal("hide");
                $(".showDetails").css("display", "block");
            });
            $(document).on("click", ".clickselectemployee", function () {
                var emp = $(this).closest("tr").find("td:nth-child(1)").text();
                var name = $(this).closest("tr").find("td:nth-child(2)").text();
                var cost = $(this).closest("tr").find("td:nth-child(3)").text();
                $("#empNum").val(emp);
                $("#empName").text(name);
                $("#empCostcenter").text(cost);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectpaymentexport", function () {
                var paymentID = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#paymentExport").val(paymentID);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectcostExport", function () {
                var cost = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#costExport").val(cost);
                $("#costToExport").val(cost);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectcostToExport", function () {
                var cost = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#costToExport").val(cost);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectlevelexport", function () {
                var level = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#levelExport").val(level);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectemployeeexport", function () {
                var emp = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#empExport").val(emp);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectempExportBenefits", function () {
                var emp = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#empExportBenefits").val(emp);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectcostExportBenefits", function () {
                var cost = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#costExportBenefits").val(cost);
                $("#costToExportBenefits").val(cost);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectcostToExportBenefits", function () {
                var cost = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#costToExportBenefits").val(cost);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectSearch", function () {
                var ID = $(this).attr("data-id");
                var paymentID = $(this).closest("tr").find("td:nth-child(1)").text();
                var payType = $(this).closest("tr").find("td:nth-child(2)").text();
                var cost = $(this).closest("tr").find("td:nth-child(3)").text();
                var ref = $(this).closest("tr").find("td:nth-child(4)").text();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetEERegular") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID:ID,
                        paymentID : paymentID,
                        payTypeName : payType,
                        costcenter : cost,
                        Ref : ref,
                        site_ref : sessionStorage.getItem("siteRef")
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var id = val[0];
                                var pay_ID = val[1];
                                var payType = val[2];
                                var cost = val[3];
                                var ref = val[4];
                                var Level = val[5];
                                var Emp_name = val[6];
                                var Value = val[7];
                                var Start_Date = val[8].substr(0,10);
                                var End_Date = val[9].substr(0,10);
                                var Type = val[10];
                                $("#payment").val(pay_ID);
                                $("input[name=regType]").each(function () { $(this).val() == Type ? $(this).prop("checked", true) : ""; });
                                //$("input[name=regType]").each(function () { $(this).val() == Type ? $(".case" + Type).css('display', 'block') : $(".case" + Type).css('display', 'none'); });
                                if (Type == "Costcenter") {
                                    $(".caseCostcenter").css('display', 'block');
                                    $(".caseEmployee").css('display', 'none');
                                } else {
                                    $(".caseEmployee").css('display', 'block');
                                    $(".caseCostcenter").css('display', 'none');
                                }
                                $("#payIDUpdate").val(id);
                                $("#costcenter").val(cost);
                                $("#leavel").val(Level);
                                $("#empNum").val(Level);
                                $("#value").val(Value);
                                $("#startDate").val(Start_Date);
                                $("#endDate").val(End_Date);
                                $("#empName").text(Emp_name);
                                $("#empCostcenter").text(cost);
                                $("#payTypeName").text(payType);
                            });
                        } else { }
                    }
                });
                $("#modalPayment").modal("hide");
                $("#modalSiteRef").modal("hide");
                $(".showDetails").css("display", "block");
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
                        data: JSON.stringify({ user : user, page : 'E-Regular' }),
                        success: function (response) {
                            if (response.d.length > 0 && response.d[0][4] == 'True') {
                                $('.Browse_modal').prop('disabled', false);
                                $('#btnSave').prop('disabled', false);
                                $('#btnNew').prop('disabled', false);
                                $('#btnSearch').prop('disabled', false);
                                $('#btnExport').prop('disabled', false);
                            } else {
                                $('.Browse_modal').prop('disabled', true);
                                $('#btnSave').prop('disabled', true);
                                $('#btnNew').prop('disabled', true);
                                $('#btnSearch').prop('disabled', true);
                                $('#btnExport').prop('disabled', true);
                                $(".caseCostcenter").css('display', 'block');
                                $(".caseEmployee").css('display', 'none');
                                $("#modalSiteRef").modal("hide");
                                alert("You don't have permission to access this page.");
                            }
                        }
                    });
                }
            });
            //---------END Check user's permission----------

        });//END Document Ready

        function GetSiteRef(response) {
            var siteRef = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[0];
                    var company = val[1];
                    //var company = localStorage.getItem("type") == 'EN' ? val[1] : val[2];
                    //if (localStorage.getItem("type") == 'TH') {
                    //    company = company == '' ? val[1] : val[2];
                    //}
                    siteRef += '<option value="' + ID + '">' + company + '</option>';
                });
            }
            $("#siteRef").append(siteRef);
        }
        function GetExport() {
            var nav_type = sessionStorage.getItem("nav-tab");
            if (nav_type == "payment") {
                let paymentID = $("#paymentExport").val();
                let costExport = $("#costExport").val();
                let costToExport = $("#costToExport").val();
                let levelExport = $("#levelExport").val();
                let empExport = $("#empExport").val();
                let effDateExport = $("#effDateExport").val();
                let effDateToExport = $("#effDateToExport").val();
                let siteRef = sessionStorage.getItem("siteRef");
                let check = nav_type;
                if ((costToExport != "" && costExport == "") || (effDateToExport != "" && effDateExport == "") || (effDateToExport == "" && effDateExport != "")) {
                    alert("Please Check Input");
                    return false;
                } else {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetExportPreview") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            paymentID: paymentID,
                            costExport: costExport,
                            costToExport: costToExport,
                            levelExport: levelExport,
                            empExport: empExport,
                            effDateExport: effDateExport,
                            effDateToExport: effDateToExport,
                            site_ref: sessionStorage.getItem("siteRef")
                        }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $("#MainContent_snspayment").val(paymentID);
                                $("#MainContent_snscost").val(costExport);
                                $("#MainContent_snscostTo").val(costToExport);
                                $("#MainContent_snslevel").val(levelExport);
                                $("#MainContent_snsemp").val(empExport);
                                $("#MainContent_snseffDate").val(effDateExport);
                                $("#MainContent_snsteffEnd").val(effDateToExport);
                                $("#MainContent_snssite_ref").val(siteRef);
                                $("#MainContent_snsCheck").val(check);
                                sessionStorage.setItem("checkdata", "true");
                            } else {
                                sessionStorage.setItem("checkdata", "false");
                                alert("No Data");
                            }
                        }
                    });
                }
            } else if (nav_type=="benefit") {
                let empExport = $("#empExportBenefits").val();
                let costExport = $("#costExportBenefits").val();
                let costToExport = $("#costToExportBenefits").val();
                let siteRef = sessionStorage.getItem("siteRef");
                let check = nav_type;
                if ((costToExport != "" && costExport == "")) {
                    alert("Please Check Input");
                    return false;
                } else {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetExportPreviewSearch") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            empExport: empExport,
                            costExport: costExport,
                            costToExport: costToExport,
                            site_ref: sessionStorage.getItem("siteRef")
                        }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $("#MainContent_snssite_ref").val(siteRef);
                                $("#MainContent_snsCheck").val(check);
                                $("#MainContent_snsempBenefits").val(empExport);
                                $("#MainContent_snscostBenefit").val(costExport);
                                $("#MainContent_snscostToBenefit").val(costToExport);
                                sessionStorage.setItem("checkdata", "true");
                            } else {
                                sessionStorage.setItem("checkdata", "false");
                                alert("No Data");
                            }
                        }
                    });
                }
            }
            return sessionStorage.getItem("checkdata") == "true" ? true : false;
            
            //alert($("#MainContent_snsEmpNum").val());
        }
    </script>
</asp:Content>
