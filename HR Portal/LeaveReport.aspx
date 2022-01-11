<%@ Page Title="Leave Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveReport.aspx.cs" Inherits="HR_Portal.LeaveReport" %>
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
            z-index:2 !important;
        }
    </style>
    <div class="page-header">
        <h2>Leave Report</h2>
         <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <%--<button id="btnModalExport" class="btn btn-warning" type="button" data-toggle="modal"> Export </button>--%>
                <%--<button class="btn btn-danger" type="button" data-toggle="modal" onclick="Clearvalue"> Clear </button>--%>
                <asp:Button runat="server" Class="btn btn-danger" Text="Clear"  OnClientClick=" Clearvalue();"  />
                <asp:Button runat="server" Class="btn btn-warning" Text="Export" ID="btnModalExport" OnClientClick="return GetExport();" OnClick="exportTableC_Click"/>
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
                                <label class="control-label">Emp Num:</label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="input-group">
                                    <input id="EmpNum" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="employee">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Department:</label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="input-group">
                                    <input id="department" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="costCenter">
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
                                <label class="control-label" > To </label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="input-group">
                                    <input id="departmentTo" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="costCenterTo">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row form-group">
                    <%--<div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Group:</label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="input-group">
                                    <input id="group" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="group">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Main Company:</label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="input-group">
                                    <input id="mainComp" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="mainComp">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <input id="siteref" type="text" style="display:none;" class="form-control max-wide" disabled>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <label class="control-label">Leave Date:</label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12" data-provide="datepicker">
                                <input placeholder="dd/mm/yyyy" id="startDate" type="text" class="form-control max-wide" autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="row form-group">
                            <div class="col-md-1 col-sm-1 col-xs-12">
                                <label class="control-label" style="font-size: 20px;"> - </label>
                            </div>
                            <div class="col-md-10 col-sm-10 col-xs-12" data-provide="datepicker">
                                <input placeholder="dd/mm/yyyy" id="endDate" type="text" class="form-control max-wide" autocomplete="off">
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>


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

    <div style="overflow: hidden; width: 0; height: 0;">
    <%--<div style="width: 0; height: 0;">--%>
        <asp:TextBox runat="server" ID="snsEmpNum" />
        <asp:TextBox runat="server" ID="snsdepartment" />
        <asp:TextBox runat="server" ID="snsdepartmentTo" />
        <%--<asp:TextBox runat="server" ID="snsgroup" />--%>
        <asp:TextBox runat="server" ID="snsmainComp" />
        <asp:TextBox runat="server" ID="snsstartDate" />
        <asp:TextBox runat="server" ID="snsendDate" />
    </div>

    <%--modalSiteRef  --%>

    <script type="text/javascript">

        $(document).ready(function() {
            
            sessionStorage.setItem('Page_type', 'Leave');

            //// DatePicker
            $("#startDate").datepicker({ dateFormat: "dd/mm/yy" });
            $('#endDate').datepicker({ dateFormat: "dd/mm/yy" });
            

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
                

               <%-- if (browse_type == 'group') {
                    $("#browseHeader").text('Employee Group');
                    $('#SearchBrowse').attr("id", 'search_empgroup');
                    var num = 0;
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Group") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[0];
                                    num += 1;

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectempgroup" href="javascript:void(0)" >' + num + '</a></td>';
                                    fragment += '<td><a class="clickselectempgroup" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }--%>

                if (browse_type == 'costCenter') {
                    $("#browseHeader").text('Department');
                    $('#SearchBrowse').attr("id", 'search_Department');
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
                                    fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + name + '</a></td>';
                                    //fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + group + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'costCenterTo') {
                    $("#browseHeader").text('Department');
                    $('#SearchBrowse').attr("id", 'search_DepartmentTo');
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
                                    fragment += '<td><a class="clickselectdepartmentTo" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectdepartmentTo" href="javascript:void(0)" >' + name + '</a></td>';
                                    //fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + group + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'employee') {
                    $("#browseHeader").text('Employee');
                    $('#SearchBrowse').attr("id", 'search_Employee');
                    $("#TBbodyemp").empty();
                    var fragment = '';
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
                            Emp_Num:'',
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
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }

                else if (browse_type == 'mainComp') {
                    $("#browseHeader").text('Main Company');
                    $('#SearchBrowse').attr("id", 'search_MainCompany');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetSearchMainCompany") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            search: ""
                        }),
                        success: GetMainCompany
                    });
                    $("#modalBrowse").modal("show");
                }

            });//End browse modal

            //Modal search
            $(document).on("change","#search_empgroup", function () {
                var search = $("#search_empgroup").val();
                var fragment = '';
                var num = 0;
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Group") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search.trim() }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[0];
                                num += 1;

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectempgroup" href="javascript:void(0)" >' + num + '</a></td>';
                                fragment += '<td><a class="clickselectempgroup" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on("change","#search_Department", function () {
                var search = $("#search_Department").val();
                var fragment = '';
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Company") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search.trim() }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];
                                var group = val[4];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + name + '</a></td>';
                                //fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + group + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on("change","#search_DepartmentTo", function () {
                var search = $("#search_DepartmentTo").val();
                var fragment = '';
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Company") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search.trim() }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];
                                var group = val[4];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectdepartmentTo" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectdepartmentTo" href="javascript:void(0)" >' + name + '</a></td>';
                                //fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + group + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on("change","#search_MainCompany", function () {
                var search = $("#search_MainCompany").val();
                $("#TBbodyBrowse").empty();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetSearchMainCompany") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        search: search
                    }),
                    success: GetMainCompany
                });
                $("#modalBrowse").modal("show");
            });
            $(document).on("change","#search_Employee", function () {
                $('#SearchBrowse').attr("id", 'search_Employee');
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var Search = $("#search_Employee").val();
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
                        Emp_Num:'',
                        search: Search.trim(),
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
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });


            //Modal click
            $(document).on("click", ".clickselectemp", function () {
                var EmpNum = $(this).closest("tr").find("td:nth-child(1)").text();
                var dataType = $(this).closest("tr").find("td:nth-child(3)").text();
                $("#EmpNum").val(EmpNum);
                $("#modalBrowse").modal("hide");
                //if (dataType == 'Current') {
                //    window.location.href = "MaintainEmployee.aspx?Emp_Num=" + EmpNum;
                //} else {
                //    window.location.href = "MaintainEmployee_Draft.aspx?Emp_Num=" + EmpNum;
                //}
            });
            //-------select empgroup------
            //$(document).on("click", ".clickselectempgroup", function () {
            //    var Emp_group = $(this).closest("tr").find("td:nth-child(2)").text();
            //    $("#group").val(Emp_group);
            //    $("#modalBrowse").modal("hide");
            //});
            //-------select empcompany------
            $(document).on("click", ".clickselectdepartment", function () {
                var costCenter = $(this).closest("tr").find("td:nth-child(1)").text();
                //var BUGroup = $(this).closest("tr").find("td:nth-child(3)").text();
                $("#department").val(costCenter);
                $("#departmentTo").val(costCenter);
                $("#modalBrowse").modal("hide");
            });
            $(document).on("click", ".clickselectdepartmentTo", function () {
                var costCenter = $(this).closest("tr").find("td:nth-child(1)").text();
                //var BUGroup = $(this).closest("tr").find("td:nth-child(3)").text();
                $("#departmentTo").val(costCenter);

                $("#modalBrowse").modal("hide");
            });
            //-------select empcompany------
            $(document).on("click", ".clickselectmainComp", function () {
                var company = $(this).closest("tr").find("td:nth-child(2)").text();
                var site_ref = $(this).attr("data-type");
                //var BUGroup = $(this).closest("tr").find("td:nth-child(3)").text();
                $("#mainComp").val(company);
                $("#siteref").val(site_ref);
                $("#modalBrowse").modal("hide");
                $("#btnModalExport").prop("disabled", false);
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
                        data: JSON.stringify({ user : user, page : 'Leave' }),
                        success: function (response) {
                            if (response.d.length > 0 && response.d[0][4] == 'True') {
                                $('.Browse_modal').prop('disabled', false);
                            } else {
                                $('.Browse_modal').prop('disabled', true);
                                alert("You don't have permission to access this page.");
                            }
                        }
                    });
                }
            });
            //---------END Check user's permission----------

        });

        function GetMainCompany(response) {
            var fragment = '';
            if (response.d.length > 0) {
                var num = 0;
                $.each(response.d, function (index, val) {
                    var ID = val[1];
                    num += 1;
                    var company = localStorage.getItem("type") == 'EN' ? val[2] : val[3];
                    if (localStorage.getItem("type") == 'TH') {
                        company = company == '' ? val[2] : val[3];
                    }
                    fragment += '<tr>';
                    fragment += '<td><a class="clickselectmainComp" href="javascript:void(0)" data-type="' + ID + '" >' + num + '</a></td>';
                    fragment += '<td><a class="clickselectmainComp" href="javascript:void(0)" data-type="' + ID + '" >' + company + '</a></td>';
                    fragment += '</tr>';
                });
            } else { }
            $("#TBbodyBrowse").append(fragment);
        }
        function GetExport() {
            var EmpNum = $("#EmpNum").val();
            var department = $("#department").val();
            var departmentTo = $("#departmentTo").val();
            var mainComp = $("#siteref").val();
            var startDate = $("#startDate").val();
            var endDate = $("#endDate").val();
            if (EmpNum != "" || (department != "" && departmentTo != "" ) || mainComp != "" || (startDate != "" && endDate != "")) {
                $("#MainContent_snsEmpNum").val(EmpNum);
                $("#MainContent_snsdepartment").val(department);
                $("#MainContent_snsdepartmentTo").val(departmentTo);
                $("#MainContent_snsmainComp").val(mainComp);
                $("#MainContent_snsstartDate").val(startDate);
                $("#MainContent_snsendDate").val(endDate);
                return true;
            }
            else {
                alert("Please Check Input");
                return false;
            }
            //alert($("#MainContent_snsEmpNum").val());
        }function Clearvalue() {
            $("#EmpNum").val("");
            $("#department").val("");
            $("#departmentTo").val("");
            $("#mainComp").val("");
            $("#siteref").val("");
            $("#startDate").val("");
            $("#endDate").val("");

            $("#MainContent_snsEmpNum").val("");
            $("#MainContent_snsdepartment").val("");
            $("#MainContent_snsdepartmentTo").val("");
            $("#MainContent_snsmainComp").val("");
            $("#MainContent_snsstartDate").val("");
            $("#MainContent_snsendDate").val("");

        }
    </script>
</asp:Content>
