<%@ Page Title="IT Maintain" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ITMaintain.aspx.cs" Inherits="HR_Portal.ITMaintain" %>

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
        <h2>IT Maintain
            <button id="btnmodal" class="btn btn-secondary" type="button" data-toggle="modal">
                <i class="glyphicon glyphicon-search"></i>
            </button>
        </h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">

                <button id="btnupdate" class="btn btn-warning" type="button" style="display: none">Save</button>
                <button id="btnsave" class="btn btn-info" type="button">Save</button>
                <button id="syncmodal" class="btn btn-danger" type="button" style="display: none">Sync</button>
            </div>
        </div>
    </div>
    <!----End Header---->
    <%--Start Modal Emp--%>
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
                                            <%--<option value="[DataType]">Draft</option>--%>
                                        </select>
                                    </div>
                                    <!-- /btn-group -->
                                    <input type="text" placeholder="Search for Employee ..." title="Type in a name" class="form-control max-wide myInputEmp" autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group col-md-2 col-lg-2 col-sm-2 multiSearchBtn" style="margin-bottom: 6px">
                                <%--<button type="button" class="btn btn-success max-wide " id="addSearch"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>--%>
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
    <%--Start HTML--%>
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="row form-group">
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <label class="control-label">Emp Num :</label>
                                        </div>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <input id="Emp_Num" type="text" name="empnum" class="form-control max-wide" onkeypress="InputNumber(event)" disabled>
                                        </div>
                                    </div>
                                </div>
                                <!--- End EmpCode --->
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="row form-group">
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <label class="control-label">Status :</label>
                                        </div>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <select id="Emp_Status" class="form-control max-wide" disabled>
                                                <option>Active</option>
                                                <option>InActive</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--- End Empnum , End Status --->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Name :</label>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <input id="Emp_FullName" type="text" class="form-control max-wide" disabled>
                                </div>
                                <!--- End Full Name--->
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Start Date :</label>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <input id="Emp_StartDate" type="text" class="form-control max-wide" disabled>
                                </div>
                            </div>
                        </div>
                        <!--- End Name , End StartDate --->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Department :</label>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <input id="Emp_CostCenter" type="text" class="form-control max-wide" disabled>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">EndDate :</label>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12 date" data-provide="datepicker">
                                    <input placeholder="dd/mm/yyyy" id="Emp_EndDate" type="text" class="form-control notText max-wide" autocomplete="off" disabled>
                                </div>
                            </div>
                        </div>
                        <!--- End Department , End EndDate --->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row form-group">
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Email :</label>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <input id="Emp_Email" type="text" class="form-control max-wide">
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12">
                                    <label class="control-label">Extension Phone :</label>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <input id="Emp_Extension" type="tel" class="form-control max-wide">
                                </div>
                            </div>
                        </div>
                        <!--- End Department , End EndDate --->

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-group">
        <div class="panel nav-tab panel-default">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="nav-item active">
                        <a href="#permission" class="nav-link" role="tab" data-toggle="tab">Permission</a>
                    </li>
                    <li class="nav-item ">
                        <a href="#redirect" class="nav-link " role="tab" data-toggle="tab">Redirect</a>
                    </li>
                </ul>
            </div>

            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="permission">
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <div class="row form-group">
                                    <table id="TB_Permission" class="table table-striped" >
                                        <thead>
                                            <tr>
                                                <th style="width: 30px; display: none">Employee Code</th>
                                                <th style="padding-left: 30px;">User Name</th>
                                                <th>Permission Type</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody  id="ListPer">
                                            <tr>
                                                <%--<td  style="padding-left: 30px;"><input type="text" class="form-control max-wide" id="Emp_Num_Per"></td>--%>
                                                <td style="padding-left: 30px;">
                                                    <input type="text" class="form-control max-wide" id="peruser" ></td>
                                                <td>
                                                    <select class="form-control max-wide" id="pertype">
                                                        <option>===Select Type===</option>
                                                        <option>UserAD</option>
                                                        <option>ERP</option>
                                                        <option>K2</option>
                                                        <option>Salesforce</option>
                                                    </select></td>
                                                <td>
                                                    <button type="button" class="btn btn-info" id="btnAddPer">Add Row</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" role="tabpanel" id="redirect">
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
                                        <th>Delegate</th>
                                    </tr>
                                </thead>
                                <tbody id="ListRediRedirectrect">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End  Permission-->
    <%--modal emp UserRedirect--%>
    <div class="modal fade" id="ModalUserRedirect" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="reHeader">Redirect To</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group col-md-9 col-lg-9 col-sm-12">
                            <div id="search-box-redirect">
                                <input type="text" id="InputUserRedirect" placeholder="Search for Employee Code..." title="Type in a name" class="form-control max-wide" autocomplete="off">
                            </div>
                            <input type="hidden" id="version" disabled>
                            <input type="hidden" id="K2Redirect" disabled>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListUserRedirect" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header">
                                <th style="width: 30px">Employee</th>
                                <th>Full Name</th>
                            </tr>
                        </thead>
                        <tbody id='TBbodyUserRedirect'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--modal emp UserRedirect--%>

    <script type="text/javascript">

        $(document).ready(function () {

            var TableRedirect = $('#TbListRedirect').DataTable({
                searching: true
            });

            var emp_num = getAllUrlParams("Emp_Num");
            var getemp = (typeof emp_num === "undefined") ? "" : (emp_num);
            sessionStorage.setItem('Page_type', 'ITMaintain');
            sessionStorage.setItem('username', '');
            //// Modal emp

            //Check Path 
            if (getemp != "") {
                var type = localStorage.getItem("type");
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListEmployee") %>",//new
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Emp_Num: getemp, search: "", type: type, fillter: "" }),
                    success: function (response) {
                        console.log(response.d);
                        if (response.d.length > 0) {
                            $("#Emp_Num").val(response.d[0][0]);
                            $("#Emp_Code_Comp").val(response.d[0][0]);
                            $("#Language").val(response.d[0][1]);
                            $("input[name=Prefix]").each(function () { $(this).val() == response.d[0][2] ? $(this).prop("checked", true) : ""; });
                            $('#img-show').attr('src', "http:\\\\pkflow01\\ImageEmployee\\" + response.d[0][0] + ".png");
                            $("#Emp_FullName").val(response.d[0][4] + " " + response.d[0][5]);
                            $("#Emp_MiddelName").val(response.d[0][6]);
                            $("#Emp_Level").val(response.d[0][7]);
                            //$("#JobTitle").val(response.d[0][8]);
                            $("#Emp_Location").val(response.d[0][9]);
                            $("#Emp_Email").val(response.d[0][10]);
                            $("#Emp_Extension").val(response.d[0][11]);
                            $("#Emp_BizPhone").val(response.d[0][12]);
                            $("#Emp_StartDate").val(response.d[0][13].includes("-") ? formatDate(response.d[0][13].substring(0, 10)) : response.d[0][13].substring(0, 10));
                            $("#Emp_EndDate").val(response.d[0][41].includes("-") ? formatDate(response.d[0][41].substring(0, 10)) : response.d[0][41].substring(0, 10));
                            $("#Emp_HireDate").val(response.d[0][14].includes("-") ? formatDate(response.d[0][14].substring(0, 10)) : response.d[0][14].substring(0, 10));
                            $("#Emp_HR_Shift_ID").val(response.d[0][15] ? response.d[0][15] : '');
                            $("#Emp_Type").val(response.d[0][16] ? response.d[0][16] : '');
                            $("#Emp_ID_Card").val(response.d[0][17]);
                            $("#Emp_ID_Card_Expired_Date").val(response.d[0][18].includes("-") ? formatDate(response.d[0][18].substring(0, 10)) : response.d[0][18].substring(0, 10));
                            $("#Emp_Birth_Date").val(response.d[0][19].includes("-") ? formatDate(response.d[0][19].substring(0, 10)) : response.d[0][19].substring(0, 10));
                            $("#Emp_Gender").val(response.d[0][20] ? response.d[0][20] : '');
                            $("#Emp_Nationality").val(response.d[0][21]);
                            $("#Emp_Religion").val(response.d[0][22]);
                            $("#Emp_Marital_Status").val(response.d[0][23] ? response.d[0][23] : '');
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
                            //console.log(response.d[0]);

                        }


                    }
                });

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUsername")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: $("#Emp_Num").val() }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var user = val[1]
                                sessionStorage.setItem('username', user);
                            });
                        }
                    }
                });

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetTbListRedirect")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: sessionStorage.getItem('username') }),
                    success: GetTbListRedirect
                });


            } else {
                $("#btnsave").prop('disabled', true);
                $("#btnAddPer").prop('disabled', true);
                alert('Please Select Employee!');
            }
            
            //onclick modal
            $("#btnmodal").on("click", function () {
                $("#modalEmp").modal("show");
                $("#TBbodyemp").empty();
                var fragment = '';
                //var Search = new Array();
                //var fillter = new Array();
                var Search = '';
                var fillter = '';
                var type = '';
                var fragment = '';
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListEmployee") %>",//new
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: Search,
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
            //On change Input Employee
            $(document).on("change", ".myInputEmp", function () {
                var fragment = "";
                $("#TBbodyemp").empty();
                var type = localStorage.getItem("type");
                //var Search = new Array();
                //var fillter = new Array();
                //$(document).find(".DispalySearchArea").each(function (index, val) {
                //    var text = $(this).find("input[type=text]").val();
                //    var column = $(this).find("Select option:selected").val();
                //    Search.push(text.trim());
                //    fillter.push(column);
                //    console.log(text.trim());
                //});
                var Search = $(".myInputEmp").val();
                var fillter = $(".fillterSearch").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListEmployee") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num : '',
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

            $(document).on("change", ".fillterSearch", function () {
                var fragment = "";
                $("#TBbodyemp").empty();
                var type = localStorage.getItem("type");
                //var Search = new Array();
                //var fillter = new Array();
                //$(document).find(".DispalySearchArea").each(function (index, val) {
                //    var text = $(this).find("input[type=text]").val();
                //    var column = $(this).find("Select option:selected").val();
                //    Search.push(text);
                //    fillter.push(column);
                //});
                var Search = $(".myInputEmp").val();
                var fillter = $(".fillterSearch").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListEmployee") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num : '',
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

            //Select Employee
            $(document).on("click", ".clickselectemp", function () {
                var EmpNum = $(this).closest("tr").find("td:nth-child(1)").text();
                window.location.href = "ITMaintain.aspx?Emp_Num=" + EmpNum;
            });
            //-------add search----------
            var searctCount = 1;
            $(document).on("click", "#addSearch", function () {
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
            //Save
            $("#btnsave").on('click', function () {
                var Emp_Num = $("#Emp_Num").val();
                var Emp_Email = $("#Emp_Email").val();
                var Emp_Extension = $("#Emp_Extension").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_IT_Maintain") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: Emp_Num,
                        Emp_Email: Emp_Email,
                        Emp_Extension: Emp_Extension,
                        Action: 'Update'
                    }),
                    success: function (response) {
                        alert("Success");
                    }
                });

            });
            /////////////////////// Permission  /////////////////////////

            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListPermission")%>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ ID: getemp }),
                success: GetListPermission
            });

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
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_HR_Employee_Authen") %>",
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
                        //window.location.href = "MaintainEmployee.aspx?ID=" + getid;
                        window.location.href = "ITMaintain.aspx?Emp_Num=" + $("#Emp_Num").val();
                    }
                });
            });
            $(".btndeletePer").on("click", function () {
                var r = confirm("Confirm Delete");
                if (r === true) {
                    var tr = $(this).closest("tr");
                    //var ID_tr_per = tr.attr("data-id");
                    var Emp_Num = $("#Emp_Num").val();
                    var Username = tr.find("td:nth-child(2)").parent().find("input[name=EmpUser]").val();
                    var Permission = tr.find("td:nth-child(3)").parent().find("input[name=Emptype]").val();
                    //console.log(ID_tr_cer +':'+ Emp_Num + ':' +Emp_Certificate + ':' + Description);
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_HR_Employee_Authen") %>",
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
                        data: JSON.stringify({ user : user, page : 'IT' }),
                        success: function (response) {
                            if (response.d.length > 0 && response.d[0][4] == 'True') {
                                $('#btnupdate').prop('disabled', false);
                                $('#syncmodal').prop('disabled', false);
                                $('#btnsave').prop('disabled', false);
                                $('#btndeletePer').prop('disabled', false);
                                $('#btnAddPer').prop('disabled', false);
                            } else {
                                $('#btnupdate').prop('disabled', true);
                                $('#syncmodal').prop('disabled', true);
                                $('#btnsave').prop('disabled', true);
                                $('.btndeletePer').prop('disabled', true);
                                $('#btnAddPer').prop('disabled', true);
                            }
                        }
                    });
                }
            });
            //---------END Check user's permission----------
            //-----------------------redirect---------------
            //// Modal UserRedirect
            $(document).on("click", ".btnbrowseuserRedirect", function () {
                $("#ModalUserRedirect").modal("show");
                $("#reHeader").text("Redirect to");
                $("#TBbodyUserRedirect").empty();
                $("#search-box-redirect").empty();
                $('<input>').attr({
                    type: 'text',
                    id: 'InputUserRedirect',
                    placeholder: "Search..",
                    class: "form-control max-wide",
                    autocomplete: "off"
                }).appendTo('#search-box-redirect');
                $("#K2Redirect").val($(this).attr("data-K2"));
                $("#version").val($(this).attr("data-ver"));
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

            //// Modal UserDelegate
            $(document).on("click",".btnbrowseuserDelegate", function () {
                $("#ModalUserRedirect").modal("show");
                $("#reHeader").text("Delegate to");
                $("#TBbodyUserRedirect").empty();
                $("#search-box-redirect").empty();
                $('<input>').attr({
                    type: 'text',
                    id: 'InputUserDelegate',
                    placeholder: "Search..",
                    class: "form-control max-wide",
                    autocomplete: "off"
                }).appendTo('#search-box-redirect');
                $("#K2Redirect").val($(this).attr("data-K2"));
                $("#version").val($(this).attr("data-ver"));
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
                                fragment += '<td><a class="clickselectempuserDelegate" href="javascript:void(0)" >' + username + '</a></td>';
                                fragment += '<td><a class="clickselectempuserDelegate" href="javascript:void(0)" >' + fullname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyUserRedirect").append(fragment);
                    }
                });
            });
            //// End Modal UserDelegate

        //-------Redirect------
            $(document).on("click", ".clickselectempuserRedirect", function () {
                let user = sessionStorage.getItem('username');;
                var RedirectFrom = user
                var RedirectTO = $(this).closest("tr").find("td:nth-child(1)").text();
                var K2Redirect = $("#K2Redirect").val();
                var SNvalue = "";
                var version = $("#version").val();
                var url = $("#version").val() == "V4" ? "http://k2app/K2Redirect/api/K2TaskRedirect" : "http://k2app5/K2Redirect/api/K2TaskRedirect";
                console.log("RedirectFrom",RedirectFrom);
                console.log("RedirectTO",RedirectTO);
                console.log("K2Redirect",K2Redirect);
                console.log("version",version);
                console.log("url",url);
                //Get SNvalue for redirect
                var button = confirm("Redirect K2: " + K2Redirect + " \n" + RedirectFrom + " => " + RedirectTO);
                if (button == true) {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetSNvalueRedirect") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            RedirectFrom: RedirectFrom,
                            K2Redirect: K2Redirect,
                            version: version

                        }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    SNvalue = val[0];
                                    console.log("SNvalue",SNvalue);
                                })
                            }
                        }
                    });
                    //search Redirect
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/btnCallK2URL") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            RedirectFrom: RedirectFrom,
                            RedirectTO: RedirectTO,
                            SNvalue: SNvalue,
                            url: url

                        }),
                        success: function (response) {
                            var result = response.d;
                            console.log(response.d);
                            
                            if (result.includes('Redirect unsuccesful')) {
                                alert(response.d);
                            }
                            else {
                                alert("Success : " + K2Redirect + "\n" + "Success : " + SNvalue);
                                $("#ModalUserRedirect").modal("hide");
                            }

                            $.ajax({
                                type: "post",
                                async: false,
                                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetTbListRedirect")%>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ search: sessionStorage.getItem('username') }),
                                success: GetTbListRedirect
                            });

                        }
                    });
                    //window.location.href = "MaintainEmployee.aspx?Emp_Num=" + $("#Emp_Num").val();
                }
            });

        //-------Redirect------
            $(document).on("click", ".clickselectempuserDelegate", function () {
                let user = sessionStorage.getItem('username');
                var RedirectFrom = user;
                var RedirectTO = $(this).closest("tr").find("td:nth-child(1)").text();
                var K2Redirect = $("#K2Redirect").val();
                var version = $("#version").val();
                var url = $("#version").val() == "V4" ? "http://k2app/K2Redirect/api/K2TaskDelegate" : "http://k2app5/K2Redirect/api/K2TaskDelegate";
                var SNvalue = "";
                //Get SNvalue for redirect
                var button = confirm("Delegate K2: " + K2Redirect + " \n" + RedirectFrom + " => " + RedirectTO);
                if (button == true) {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetSNvalueRedirect") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            RedirectFrom: RedirectFrom,
                            K2Redirect: K2Redirect,
                            version : version 

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
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/btnCallK2URL") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            RedirectFrom: RedirectFrom,
                            RedirectTO: RedirectTO,
                            SNvalue: SNvalue,
                            url:url

                        }),
                        success: function (response) {
                            console.log(response.d);
                            if (response.d.includes('Redirect unsuccesful')) {
                                alert(response.d);
                            }
                            else {
                                alert("Success : " + K2Redirect + "\n" + "Success : " + SNvalue);
                            }
                            $("#ModalUserRedirect").modal("hide");

                            $.ajax({
                                type: "post",
                                async: false,
                                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetTbListRedirect")%>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ search: sessionStorage.getItem('username') }),
                                success: GetTbListRedirect
                            });

                        }
                    });
                
                    //window.location.href = "MaintainEmployee.aspx?Emp_Num=" + $("#Emp_Num").val();
                }
            });

            //// Search in modal
            $(document).on("change","#InputUserRedirect", function () {
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

            $(document).on("change","#InputUserDelegate", function () {
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
                                fragment += '<td><a class="clickselectempuserDelegate" href="javascript:void(0)" >' + username + '</a></td>';
                                fragment += '<td><a class="clickselectempuserDelegate" href="javascript:void(0)" >' + fullname + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyUserRedirect").append(fragment);
                    }
                });
            });

            function GetTbListRedirect(response) {
                if (response.d.length > 0) {
                    TableRedirect.clear().draw();
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
                        TableRedirect.row.add(['<a href="http://pk-flow/application_Software_Space' + linkNew + '&Site_ref=' + site_ref + '&ID=' + idmain + '&K2=' + K2ID + '&TypeK2=' + Type + '&FlowType=' + Flowtype + '" ' + ' >' + K2ID + '</a> ' + '</td> '
                            , WorkflowType, Subject, CreateDate, '<a href="http://portalapp01/PersonalWorkspace/HistoryViewFlow.aspx?site_ref=' + site_ref + '&K2=' + K2ID + '&K2Vers=' + k2vers + 'Type=' + WFtype + '" target="_blank" >' + ' view flow ' + '</a> ' + '</td>'
                            , '<button type="button" class="btn btn-primary btnbrowseuserRedirect" data-K2="' + K2ID + '" data-ver="' + k2vers + '"> <i class="glyphicon glyphicon-refresh"></i> </button> '
                            , '<button type="button" class="btn btn-warning btnbrowseuserDelegate" data-K2="' + K2ID + '" data-ver="' + k2vers + '"> <i class="fa fa-user-plus"></i> </button> ']).draw().node();
                    });

                    //$("#ListRediRedirectrect").append(fragment);
                }
            }
        });
        function GetListPermission(response) {
            //console.log(response.d);
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {

                    var Emp_Num_Per = $("#Emp_Num").val();
                    var Username = val[1];
                    var Permission = val[2];
                    //console.log(ID + ":" + Emp_Num_Per + ":" + Username + ":" + Permission)
                    fragment += '<tr data-id>';
                    //fragment += '<td><input type="text" name="EmpnumPer"class="form-control max-wide" value="' + Emp_Num_Per + '"></td>';
                    fragment += '<td style="padding-left: 30px;" ><input type="text" name="EmpUser" class="form-control max-wide" value="' + Username + '"></td>';
                    fragment += '<td><input type="text" name="Emptype" class="form-control max-wide" value="' + Permission + '"></td>';
                    fragment += '<td><button type="button" class="btn btn-danger btndeletePer" ><i class="glyphicon glyphicon-trash" aria-hidden="true"  style="color:white"></i></button></td>';
                    fragment += '</tr>'
                });
            } else { }
            $("#ListPer tr:first").before(fragment)
        }


    </script>
</asp:Content>
