<%@ Page Title="" Language="C#" MasterPageFile="~/Site_BCP.Master" AutoEventWireup="true" CodeBehind="Maintain_BCP.aspx.cs" Inherits="HR_Portal.Maintain_BCP" %>

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
            /*background-color: #f1f1f1;*/
        }

        .red {
            color: red;
            /*font-size: 18px;*/
        }

        .datepicker-container {
            z-index: 1061 !important;
        }

        .margin-top {
            margin-top: 2em
        }

        .margin-bottom {
            margin-bottom: 2em
        }

        input[type=checkbox] {
            /* Double-sized Checkboxes */
            -ms-transform: scale(2); /* IE */
            -moz-transform: scale(2); /* FF */
            -webkit-transform: scale(2); /* Safari and Chrome */
            -o-transform: scale(2); /* Opera */
            transform: scale(2);
            padding: 10px;
        }

        /* Might want to wrap a span around your checkbox text */
        .checkboxtext {
            /* Checkbox text */
            font-size: 110%;
            display: inline;
        }

        .center {
            text-align: center;
        }

        .att-margin {
            margin-top: 2.5rem;
        }

        .nav-tab {
            overflow: hidden;
            border: 1px solid #ccc;
            /*background-color: #f1f1f1;*/
        }

        .panel-default > .panel-heading {
            color: #333;
            background-color: #fff;
            border-color: #ddd;
        }


        .btn-Excel-dowlaod {
            background-color: #1F7244;
            color: ghostwhite;
            border: none;
        }

            .btn-Excel-dowlaod:hover {
                background-color: #006400;
                color: ghostwhite;
            }
    </style>
    
  
    
        
    <div class="page-header">
        <h2>Maintain BCP</h2>
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
            </div>
        </div>
    </div>


    <div class="panel-group">
        <div class="panel nav-tab panel-default" style="margin-top: 2em;">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="nav-item active">
                        <a href="#TAB1" class="nav-link" role="tab" data-toggle="tab">List Employee</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB2" class="nav-link" data-toggle="tab" role="tab">Change BCP</a>
                    </li>
                </ul>

                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="TAB1">

                            <%--  <div class="panel-heading">
                                    <div class="row form-group">
                                        <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                            <h3 style="font-weight: bold;">List Employee</h3>
                                        </div>
                                        <div class="col-md-8 col-xs-8" style="text-align: right">
                                        
                                        </div>
                                    </div>
                                </div>--%>

                            <div class="panel ">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label2" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Employee Num"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <div class="input-group">
                                                        <input id="textListEmp_EmpNum" type="text" class="form-control max-wide" disabled>
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-default Browse_modal PosViewer" data-type="ListEmp_EmpNum" data-row_no="0" type="button">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label ID="Label8" class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Cost Center"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <div class="input-group">
                                                        <div class="input-group-btn">
                                                            <div class="input-group">
                                                                <input id="textListEmp_CostCenter" type="text" class="form-control max-wide" disabled>
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-default Browse_modal PosViewer" data-type="ListEmp_CostCenter" data-row_no="0" type="button">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--END Row-->
                                        <div class="row">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="BU Group"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <div class="input-group">
                                                        <div class="input-group-btn">
                                                            <div class="input-group">
                                                                <input id="textListEmp_BUGroup" type="text" class="form-control max-wide" disabled>
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-default Browse_modal PosViewer" data-type="ListEmp_BUGroup" data-row_no="0" type="button">
                                                                        <i class="glyphicon glyphicon-search"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label  class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <%--<div class="input-group">--%>
                                                    <select class="form-control max-wide PosViewer" id="textListEmp_Status">
                                                        <option value="">=== Plase Select Status ===</option>
                                                        <option value="Active">Active</option>
                                                        <option value="InActive">InActive</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <!--END Row-->
                                        <div class="row">
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="BCP Group"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <%--<div class="input-group">--%>
                                                    <select class="form-control max-wide PosViewer" id="textListEmp_BCP">
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                <asp:Label class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type"></asp:Label>
                                                <div class="col-md-9 col-xs-12">
                                                    <%--<div class="input-group">--%>
                                                    <select class="form-control max-wide PosViewer" id="textListEmp_Type">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <!--END Row-->
                                    </div>

                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                                <div class="col-md-8 col-xs-12">
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="button" id="btnSearchListEmp_Clear" class="btn btn-warning btn-block PosViewer" style="float: right;">Clear</button>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="button" id="btnSearchListEmp" class="btn btn-info btn-block PosViewer" style="float: right;">Search</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--panel-body-->
                            </div>

                            <div class="panel-group" style="margin-top: 1em;" id="divTable_ListEmployee">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table table-hover table-responsive" style="width: 100%" id="Table_List_Employee">
                                                    <thead>
                                                        <tr>
                                                            <th>EmpNum</th>
                                                            <th width="30%">Name</th>
                                                            <th>Cost Center</th>
                                                            <th>Status</th>
                                                            <th>Level</th>
                                                            <th>BCP Group</th>
                                                            <th>Site ref</th>
                                                            <th>Bcp</th>
                                                            <th>Type</th>
                                                            <th>Effect Date</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="List_list_Employee">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab 1====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB2">
                            <div class="panel-group">
                                <!--panel-default-->
                                <div class="panel">
                                    <div class="panel-heading">
                                        <div class="row form-group">
                                            <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                <h3 style="font-weight: bold;">Change BCP</h3>
                                            </div>
                                            <div class="col-md-8 col-xs-8" style="text-align: right">
                                                <button id="btnAddRow" class="btn btn-info PosViewer" type="button" data-toggle="modal" style="font-size: 16px; font-weight: bold;">+ </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered table-responsive center" style="width: 100%" id="tableChange_BCP">
                                                        <thead>
                                                            <tr>
                                                                <th>Employee</th>
                                                                <th>BCP Group</th>
                                                                <th>Type</th>
                                                                <th>Effect Date</th>
                                                                <th>Remark</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListChange_BCP">
                                                            <tr>
                                                                <td>
                                                                    <div class="input-group">
                                                                        <input id="textEmpNum_0" style="display: none;" type="text" class="form-control max-wide textEmpNum" disabled>
                                                                        <input id="textEmpname_0" type="text" class="form-control max-wide textEmpname" disabled>
                                                                        <div class="input-group-btn">
                                                                            <button class="btn btn-default Browse_modal PosViewer" data-type="ChangeBCP_EmpNum" data-row_no="0" type="button">
                                                                                <i class="glyphicon glyphicon-search"></i>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <select class="form-control max-wide PosViewer" id="">
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option>
                                                                        <option value="3">3</option>
                                                                        <option value="4">4</option>
                                                                    </select>

                                                                </td>
                                                                <td>
                                                                    <select class="form-control max-wide PosViewer" id="">
                                                                        <option value="">=== Plase Select Type ===</option>
                                                                        <option value="กักตัวอยู่บ้าน">กักตัวอยู่บ้าน</option>
                                                                        <option value="อยู่บริษัท">อยู่บริษัท</option>
                                                                        <option value="รักษาตัวที่โรงพยาบาล">รักษาตัวที่โรงพยาบาล</option>
                                                                    </select>
                                                                </td>
                                                                <td>
                                                                    <input type="text" class="form-control max-wide textEffect_Date PosViewer" placeholder="dd/mm/yyyy">
                                                                </td>
                                                                <td>
                                                                    <input id="" type="text" class="form-control max-wide PosViewer">
                                                                </td>
                                                                <td>
                                                                    <button class="btn btn-danger PosViewer" onclick="deleteRow(this)" type="button">
                                                                        <i class="glyphicon glyphicon-trash"></i>
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="col-md-10"></div>
                                                        <div class="col-md-2">
                                                            <button id="btnChange" class="btn btn-warning PosViewer" type="button" data-toggle="modal" style="font-size: 16px; font-weight: bold; float: right;">Change </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Panel-Group -->
                        </div>
                        <!--================End Tab 2====================-->
                    </div>
                </div>
            </div>
        </div>
    </div>







    <div class="modal fade" id="modalBrowseSearch" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs" id="modalSize">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 id="Titlebrowse" class="modal-title">Text</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                            <div id="search_box">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <input id="textrow_no" type="text" class="form-control max-wide" disabled style="display: none">
                    <table id="TbListBrowse" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header" id="TBheaderBrowse">
                            </tr>
                        </thead>
                        <tbody id='TBbodyBrowse'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--Browse_modal--%>
    <div class="modal fade" id="modalBCP_Trans" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4>Detail</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListHistory" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header" id="TBheaderListEmp_Detail">
                            </tr>
                        </thead>
                        <tbody id='TBbodyListEmp_Detail'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--Browse_modal--%>


    <script type="text/javascript">

        $(document).ready(function () {

            var Table_List_Employee = $("#Table_List_Employee").DataTable({
                searching: false,
                lengthChange: true,
            });
            
            GetBCPGroup()
            GetBCPType()
            GetTable_List_Employee('', '', '', '','','')
            SetDatePicker();
            Checkpermission('BCP')
            $(".textEffect_Date").val(Date_ToDay);
            var countRow = 1;
            $(document).on("click", "#btnAddRow", function () {
                var NewRow = `<tr>
                                        <td>
                                            <div class="input-group">
                                                <input id="textEmpNum_`+ countRow + `"  style="display:none;" type="text" class="form-control max-wide textEmpNum" disabled>
                                                <input id="textEmpname_`+ countRow + `" type="text" class="form-control max-wide textEmpname" disabled>
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default Browse_modal" data-type="ChangeBCP_EmpNum" data-row_no="`+ countRow + `" type="button">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <select class="form-control max-wide" id="">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>

                                        </td>
                                        <td>
                                            <select class="form-control max-wide" id="">
                                                <option value="">=== Plase Select Type ===</option>
                                                <option value="กักตัวอยู่บ้าน">กักตัวอยู่บ้าน</option>
                                                <option value="อยู่บริษัท">อยู่บริษัท</option>
                                                <option value="รักษาตัวที่โรงพยาบาล">รักษาตัวที่โรงพยาบาล</option>
                                            </select>
                                        </td>
                                        <td>
                                             <input type="text" class="form-control max-wide textEffect_Date" placeholder="dd/mm/yyyy" value="`+ Date_ToDay() + `">
                                        </td>
                                        <td>
                                             <input id="" type="text" class="form-control max-wide" >
                                        </td>

                                        <td>
                                             <button class="btn btn-danger" onclick="deleteRow(this)"  type="button">
                                                <i class="glyphicon glyphicon-trash"></i>
                                             </button>
                                        </td>
                                    </tr>`;
                $("#ListChange_BCP").append(NewRow);
                SetDatePicker();
                countRow++;
            });

            $(document).on("click", ".Browse_modal", function () {
                var fragment = '';
                var fragmentHeader = '';
                var Type = $(this).attr("data-type");
                $("#Titlebrowse").text(Type);
                $("#TBbodyBrowse").empty();
                $("#TBheaderBrowse").empty();
                $("#search_box").empty();
                $("#search_box").append('<input type="text" id="search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');

                if (Type == 'ChangeBCP_EmpNum') {
                    var data_no = $(this).attr("data-row_no");
                    $("#textrow_no").val(data_no);
                    Get_Change_SearchUser('');
                }//End  
                else if (Type == 'ListEmp_EmpNum') {
                    Get_SearchUser('');
                }//End  
                else if (Type == 'ListEmp_CostCenter') {
                    Get_SearchCostCenter('');
                }//End 
                else if (Type == 'ListEmp_BUGroup') {
                    GET_SearchBUGroup('');
                }//End  

                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowseSearch").modal("show");
            });

            $(document).on("click", ".btnListEmp_Detail", function () {
                var tr = $(this).closest("tr");
                var Emp_num = tr.find("td:nth-child(1)").text();
                //console.log(Emp_num)
                var fragment = '';
                var fragmentHeader = `<th>EmpNum</th>
                                     <th>BCP</th>
                                     <th>Type</th>
                                     <th>Effect Date</th>
                                     <th>Remark</th>`;
                $("#TBheaderListEmp_Detail").empty();
                $("#TBbodyListEmp_Detail").empty();

                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/BCP_Employee_Trans") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Emp_num: $.trim(Emp_num) }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[Emp_num],[BCP],[Type],[Effect_date],[Remark]
                                var ID = val[0];
                                var Emp_Num = val[1];
                                var BCP = val[2];
                                var Type = val[3];
                                var Effect_date = val[4];
                                var Remark = val[5];
                                fragment += '<tr>';
                                fragment += '<td>' + Emp_Num + '</td>';
                                fragment += '<td>' + BCP + '</td>';
                                fragment += '<td>' + Type + '</td>';
                                fragment += '<td>' + Effect_date.substr(0, 10) + '</td>';
                                fragment += '<td>' + Remark + '</td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderListEmp_Detail").append(fragmentHeader);
                $("#TBbodyListEmp_Detail").append(fragment);
                $("#modalBCP_Trans").modal("show");
            });

            $(document).on("click", "#btnChange", function () {
                var checkinput = false;
                $('#ListChange_BCP > tr').each(function (index, value) {
                    var Emp_Num = $(this).find("td:nth-child(1)").find("input[type=text]").val();
                    var BCP = $(this).find("td:nth-child(2)").find("select").val();
                    var Type = $(this).find("td:nth-child(3)").find("select").val();
                    var Effect_date = $(this).find("td:nth-child(4)").find("input[type=text]").val();
                    var Remark = $(this).find("td:nth-child(5)").find("input[type=text]").val();
                    if (Emp_Num != "") {
                        checkinput = true;
                    } else {
                        checkinput = false;
                    }

                });

                if (checkinput) {
                    $('#ListChange_BCP > tr').each(function (index, value) {
                        var Emp_Num = $(this).find("td:nth-child(1)").find("input[type=text]").val();
                        var BCP = $(this).find("td:nth-child(2)").find("select").val();
                        var Type = $(this).find("td:nth-child(3)").find("select").val();
                        var Effect_date = $(this).find("td:nth-child(4)").find("input[type=text]").val();
                        var Remark = $(this).find("td:nth-child(5)").find("input[type=text]").val();
                        if (Emp_Num != "") {
                            SP_BCP_Employee(Emp_Num, BCP, Type, Effect_date, Remark)
                        }

                    });
                    $("#btnAddRow").click();
                    $("#ListChange_BCP").empty();
                    GetTable_List_Employee('', '', '', '','','')
                } else {
                    swal('Error', 'กรุณากรอกข้อมูลให้ครบถ้วน', 'error');
                }
            });

            

            $(document).on("click", "#btnSearchListEmp_Clear", function () {
                $("#textListEmp_EmpNum").val('');
                $("#textListEmp_CostCenter").val('');
               $("#textListEmp_BCP").val('');
                $("#textListEmp_Type").val('');
                $("#textListEmp_BUGroup").val('');
               $("#textListEmp_Status").val('');

                GetTable_List_Employee('', '', '', '','','')
            });

            $(document).on("click", "#btnSearchListEmp", function () {
                var Emp_num = $("#textListEmp_EmpNum").val();
                var CostCenter = $("#textListEmp_CostCenter").val();
                var BCP = $("#textListEmp_BCP").val();
                var Type = $("#textListEmp_Type").val();
                var BUGroup = $("#textListEmp_BUGroup").val();
                var Emp_Status = $("#textListEmp_Status").val();
                GetTable_List_Employee(Emp_num, CostCenter, BCP, Type,BUGroup,Emp_Status) 
            });
            

            $(document).on("click", "#nextPage2", function () {
                console.log('Page2');
                var textExport_BUGroup = $("#textExport_BUGroup").val();
                var textExport_Status = $("#textExport_Status").val();
                var textExport_BCP = $("#textExport_BCP").val();
                var textExport_Type = $("#textExport_Type").val();
                $("#snstextExport_BUGroup").val(textExport_BUGroup);
                $("#snstextExport_Status").val(textExport_Status);
                $("#snstextExport_BCP").val(textExport_BCP);
                $("#snstextExport_Type").val(textExport_Type);
                $('#smartwizard').smartWizard("next");
            });

            $(document).on("click", ".clickselecttext_Change_BCP", function () {
                var tr = $(this).closest("tr");
                var EmpNum = tr.find("td:nth-child(1)").text();
                var Name = tr.find("td:nth-child(2)").text();
                var row_no = $("#textrow_no").val();
                $("#textEmpNum_" + row_no).val(EmpNum);
                $("#textEmpname_" + row_no).val(Name);
                $("#textrow_no").val('');
                $("#modalBrowseSearch").modal("hide");
            });

            $(document).on("click", ".clickselecttext_ListEmp_User", function () {
                var tr = $(this).closest("tr");
                var EmpNum = tr.find("td:nth-child(1)").text();
                var Name = tr.find("td:nth-child(2)").text();
                $("#textListEmp_EmpNum").val(EmpNum);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_ListEmp_CostCenter", function () {
                var tr = $(this).closest("tr");
                var CostCenter = tr.find("td:nth-child(1)").text();
                var Desc = tr.find("td:nth-child(2)").text();
                $("#textListEmp_CostCenter").val(CostCenter);
                $("#modalBrowseSearch").modal("hide");
            });
            $(document).on("click", ".clickselecttext_ListEmp_BUGroup", function () {
                var tr = $(this).closest("tr");
                var Group = tr.find("td:nth-child(1)").text();
                var Desc = tr.find("td:nth-child(2)").text();
                $("#textListEmp_BUGroup").val(Group);
                $("#modalBrowseSearch").modal("hide");
            });
            //END Function BrowseClick


            $(document).on("change", "#search_ChangeBCP_EmpNum", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                Get_Change_SearchUser(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_ListEmp_EmpNum", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                Get_SearchUser(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_ListEmp_CostCenter", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                Get_SearchCostCenter(search);
                $("#modalBrowseSearch").modal("show");
            });
            $(document).on("change", "#search_ListEmp_BUGroup", function () {
                $("#TBheaderBrowse").empty();
                $("#TBbodyBrowse").empty();
                var search = $(this).val();
                GET_SearchBUGroup(search);
                $("#modalBrowseSearch").modal("show");
            });
            //END Onchange

            function Get_Change_SearchUser(search) {
                $("#Titlebrowse").text('Search Employee');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>EmpNum</th>
                                     <th>Emp Name</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/Get_User_BCP") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[Site_Ref],[Emp_Num],[sname],[name],[dept],[Uf_Level],[Uf_Location],[Uf_PositionID],[Uf_Jobtitle],[Uf_JobTitleEN],[BUGroup],[BUGroupDesc]
                                var Site_Ref = val[0];
                                var Emp_Num = val[1];
                                var sname = val[2];
                                var name = val[3];
                                var dept = val[4];
                                var Uf_Level = val[5];
                                var Uf_Location = val[6];
                                var Uf_PositionID = val[7];
                                var Uf_Jobtitle = val[8];
                                var Uf_JobTitleEN = val[9];
                                var BUGroup = val[10];
                                var BUGroupDesc = val[11];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_Change_BCP" href="javascript:void(0)"  data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >' + Emp_Num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_Change_BCP" href="javascript:void(0)" data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            function Get_SearchUser(search) {
                $("#Titlebrowse").text('Search Employee');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>EmpNum</th>
                                     <th>Emp Name</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/Get_User_BCP") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[Site_Ref],[Emp_Num],[sname],[name],[dept],[Uf_Level],[Uf_Location],[Uf_PositionID],[Uf_Jobtitle],[Uf_JobTitleEN],[BUGroup],[BUGroupDesc]
                                var Site_Ref = val[0];
                                var Emp_Num = val[1];
                                var sname = val[2];
                                var name = val[3];
                                var dept = val[4];
                                var Uf_Level = val[5];
                                var Uf_Location = val[6];
                                var Uf_PositionID = val[7];
                                var Uf_Jobtitle = val[8];
                                var Uf_JobTitleEN = val[9];
                                var BUGroup = val[10];
                                var BUGroupDesc = val[11];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_ListEmp_User" href="javascript:void(0)"  data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >' + Emp_Num + '</a></td>';
                                fragment += '<td><a class="clickselecttext_ListEmp_User" href="javascript:void(0)" data-site_ref="' + Site_Ref + ' "data-dept="' + dept + ' "data-Uf_level="' + Uf_Level + '" data-Uf_Location="' + Uf_Location + '"data-uf_positionid="' + Uf_PositionID + '"data-uf_jobtitle="' + Uf_Jobtitle + '" data-uf_JobTitleen="' + Uf_JobTitleEN + '" data-bugroup="' + BUGroup + '" data-bugoupDesc="' + BUGroupDesc + '" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
            }

            function Get_SearchCostCenter(search) {
                $("#Titlebrowse").text('Search CostCenter');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>CostCenter</th>
                                     <th>Desc</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Company") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];
                                var group = val[4];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_ListEmp_CostCenter" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselecttext_ListEmp_CostCenter" href="javascript:void(0)" >' + name + '</a></td>';
                                //fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + group + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowse").modal("show");
            }

            function GET_SearchBUGroup(search) {
                $("#Titlebrowse").text('Search BUGroup');
                var fragmentHeader = '';
                var fragment = '';
                $("#modalSize").attr('class', 'modal-dialog modal-md');
                fragmentHeader = `<th>Group</th>
                                     <th>Desc</th>`;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GET_VW_BuGroup_AllSite") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Group = val[0];
                                var Desc = val[1];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselecttext_ListEmp_BUGroup" href="javascript:void(0)" >' + Group + '</a></td>';
                                fragment += '<td><a class="clickselecttext_ListEmp_BUGroup" href="javascript:void(0)" >' + Desc + '</a></td>';
                                //fragment += '<td><a class="clickselectdepartment" href="javascript:void(0)" >' + group + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                    }
                });
                $("#TBheaderBrowse").append(fragmentHeader);
                $("#TBbodyBrowse").append(fragment);
                $("#modalBrowse").modal("show");
            }
            

            function SP_BCP_Employee(Emp_num, BCP, Type, Effect_date, Remark) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_BCP_Employee")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Emp_num: Emp_num, BCP: BCP, Type: Type, Effect_date: Effect_date, Remark: Remark }),
                    success: function (response) {
                        swal('Complete', 'Change ข้อมูลสำเร็จ', 'success');
                    }
                });
            }

            function GetTable_List_Employee(Emp_num, CostCenter, BCP, Type, BUGroup, Emp_Status) {
                $("#IMGUpload").modal("show");
                Table_List_Employee.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_BCP_Employee")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Emp_num: Emp_num, CostCenter: CostCenter, BCP: BCP, Type: Type, BUGroup: BUGroup, Emp_Status: Emp_Status }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[Emp_num],[name],[dept],[Uf_Level],[Site_Ref],[BUGroup],[BUGroupDesc]
                                //, [Emp_Status], [BCP], [Type], [Effect_date], [Remark]
                                var Emp_num = val[0];
                                var name = val[1];
                                var dept = val[2];
                                var Uf_Level = val[3]
                                var Site_Ref = val[4]
                                var BUGroup = val[5]
                                var BUGroupDesc = val[6]
                                var Emp_Status = val[7]
                                var BCP = val[8]
                                var Type = val[9]
                                var Effect_date = val[10]
                                var Remark = val[11]
                                Table_List_Employee.row.add([Emp_num, name, dept, Emp_Status, Uf_Level
                                    , BUGroupDesc, Site_Ref, BCP, Type, Effect_date.substr(0, 10)
                                    , '<button class="btn btn-warning btnListEmp_Detail"  data-Emp_num="' + Emp_num + '" type="button">Detail</button>']).draw().node();
                            });
                        }
                    }
                });
                $("#IMGUpload").modal("hide");
            }

            function SetDatePicker() {
                $('.textEffect_Date').datepicker({ dateFormat: "dd/mm/yy", autoHide: true });
            }

            function Date_ToDay() {
                var today = new Date();
                var dd = String(today.getDate()).padStart(2, '0');
                var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                var yyyy = today.getFullYear();
                today = dd + '/' + mm + '/' + yyyy;
                return today;
            }
        });
        //End Document Ready

        function GetBCPGroup() {
            var BCP = '<option value="">=======Please Select BCP Group=======</option>';
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GET_BCP_TB_BCP_Maintain")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var Type = val[0];
                            var Name = val[1];
                            BCP += '<option value="' + Name + '">' + Name + '</option>';
                        });
                        $("#textListEmp_BCP").append(BCP);
                    }
                }
            });
        }

        function GetBCPType() {
            var BCPType = '<option value="">=======Please Select Type =======</option>';
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GET_Type_TB_BCP_Maintain")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var Type = val[0];
                            var Name = val[1];
                            BCPType += '<option value="' + Name + '">' + Name + '</option>';
                        });
                        $("#textListEmp_Type").append(BCPType);
                    }
                }
            });
        }
        
        function deleteRow(btn) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

        function Checkpermission(page) {
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
                        data: JSON.stringify({ user: user, page: page }),
                        success: function (response) {
                            if (response.d.length > 0 && response.d[0][4] == 'True') {
                                $('.PosViewer').prop('disabled', false);
                                
                            } else {
                                $('.PosViewer').prop('disabled', true);
                                $('.input').prop('disabled', true);
                                $('#divTable_ListEmployee').hide();
                                swal({
                                    title: 'Error',
                                    text: "You don't have permission to access this page.",
                                    icon: 'error',
                                    buttons: {
                                        confirm: true,
                                    },
                                }).then(function () {
                                    window.location.href = "http://portalapp01/PersonalWorkspace/";
                                })

                            }
                        }
                    });
                }
            });
        }

    </script>

</asp:Content>
