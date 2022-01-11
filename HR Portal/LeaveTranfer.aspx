<%@ Page Title="Leave Transaction" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveTranfer.aspx.cs" Inherits="HR_Portal.LeaveTranfer" %>
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
    </style>
    <div class="page-header">
        <h2>Leave Transaction</h2>
    </div>
    <!----End Header---->

    <div class="page-body">
        <div class="row" style="margin-bottom:1rem">
            <div class="col-md-1 col-sm-1 col-xs-1">
                <label class="control-label" style="font-size: 12px">Emp Num :</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" >
                <div class="input-group">
                    <input id="EmpNum" type="text" class="form-control max-wide" disabled>
                    <div class="input-group-btn">
                        <button class="btn btn-default Browse_modal" type="button" id="btnmodal" data-type="EmpNum">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1">
                <label class="control-label" style="font-size: 12px">Emp Name :</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" >
                <input id="EmpName" type="text" class="form-control max-wide" disabled>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1">
                <label class="control-label" style="font-size: 11px">Department :</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" >
                <input id="EmpDept" type="text" class="form-control max-wide" disabled>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3" >
                <select class="form-control max-wide" id="mainCom" disabled>
                    <option value=""></option>
                </select>
            </div>
        </div>
        <div class="row" style="margin-bottom:1rem">
            <div class="col-md-1 col-sm-1 col-xs-1">
                <label class="control-label" style="font-size: 12px">Start Date :</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" >
                <input id="EmpStart" type="text" class="form-control max-wide" disabled>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1">
                <label class="control-label" style="font-size: 12px">End Date :</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" >
                <input id="EmpEnd" type="text" class="form-control max-wide" disabled>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1">
                <label class="control-label" style="font-size: 12px">Probation Date :</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" >
                <input id="EmpPro" type="text" class="form-control max-wide" disabled>
            </div>
        </div>
        <div class="row" style="margin-bottom:1rem">
            <div class="col-md-1 col-sm-1 col-xs-1">
                <label class="control-label" style="font-size: 13px">Year :</label>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" >
                <select class="form-control max-wide" id="EmpYear">
                    <option value="">===Select Year===</option>
                </select>
            </div>
        </div>
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <table id="TableLeave" class="table" style="width: 100%">
                                <thead>
                                    <tr>
                                        <%--<th style="display:none;">ID</th>--%>
                                        <th>Leave Type</th>
                                        <th>Avaliable</th>
                                        <th>Accumulate Date</th>
                                        <th>Accumulate Hour</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id='TBbodyLeave' >
                                </tbody>
                            </table>
                        </div>
                        <!--- End Col-md-12 --->
                    </div>
                </div>
            </div>
        </div>
        <div class="page-footer" style="padding-bottom: 9px;border-bottom: 1px solid #eee;margin: 40px 0 20px;">
            <h2>Absence</h2>
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                 <div id="DayTotal"></div>
                </div>

                <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                    <button id="btnModalAddAbsence" class="btn btn-info" type="button" data-toggle="modal" disabled> Add </button>
                </div>
            </div>
        </div>
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <table id="TableAbsence" class="table" style="width: 100%">
                                <thead>
                                    <tr>
                                        <%--<th style="display:none;">ID</th>--%>
                                        <th>Date</th>
                                        <th>Days</th>
                                        <th>Hours</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id='TBbodybsence' >
                                </tbody>
                            </table>
                        </div>
                        <!--- End Col-md-12 --->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!---End body--->
    <%--Start Modal Search Emp--%>
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
                                            <%--<option value="[DataType]">Draft</option>--%>
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
    <!--- End Modal Search Emp --->

    <%--modal Edit Laeve--%>
    <div class="modal fade" id="modalEditLeave" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Update Leave</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="row" style="margin-bottom:1rem">
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <label class="control-label" style="font-size: 11.5px">Leave Type :</label>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4" >
                            <input id="leaveName" type="text" class="form-control max-wide" disabled>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-2" >
                            <input id="leaveType" style="display:none" type="text" class="form-control max-wide" disabled>
                            <label class="control-label" style="font-size: 12px">Avaliable :</label>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-3" >
                            <input id="avaliDate" type="text" class="form-control max-wide" disabled>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:1rem">
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <label class="control-label" style="font-size: 12px">Accumulate Date :</label>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-3" >
                            <input id="accumDate" type="number" class="form-control max-wide">
                        </div>
                        <div class="col-md-1 col-sm-1 col-xs-1" >

                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <label class="control-label" style="font-size: 12px">Accumulate Hour :</label>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-3" >
                            <input id="accumHour" type="number" class="form-control max-wide">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="updateLeave" class="btn btn-warning" >Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--End --%>
    <%--modal add Absence--%>
    <div class="modal fade" id="modalAddAbsence" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Add Absence</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                  <input id="AbsenceID" type="hidden" class="form-control max-wide">
                    <div class="row" style="margin-bottom:1rem">
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <label class="control-label" style="font-size: 12px">Accumulate Date :</label>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-3" >
                            <input id="AbsenceDate1" type="number" class="form-control max-wide">
                        </div>
                        <div class="col-md-1 col-sm-1 col-xs-1" >

                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <label class="control-label" style="font-size: 12px">Accumulate Hour :</label>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-3" >
                            <input id="AbsenceHour1" type="number" class="form-control max-wide">
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:1rem">
                        <div class="col-md-2 col-sm-2 col-xs-2">
                            <label class="control-label" style="font-size: 12px">AbsenceEffect Date :</label>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-3" data-provide="datepicker" >
                            <input id="AbsenceEffectDate1" type="text" class="form-control max-wide" placeholder="dd/mm/yyyy" >
                        </div>
                        <div class="col-md-1 col-sm-1 col-xs-1" >

                        </div>
                     
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnAddAbsence" class="btn btn-info" >Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--End --%>
    <%--modal show leave--%>
    <div class="modal fade" id="modalShowLeave" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="leaveHeader">Leave</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListLeave" class="table table-responsive">
                        <thead>
                            <tr class="header">
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Used Date</th>
                                <th>Used Hour</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id='TBbodyshowleave'></tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--End --%>

    <script type="text/javascript">

        sessionStorage.setItem('Page_type', 'Leave');

        $(document).ready(function () {

            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetMainCompany")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                success: GetMainCompany
            }); 


            $(document).on('click', ".btnupdateEmpLeave", function () {
                var tr = $(this).closest("tr");
                var ID = parseInt($(this).closest("tr").attr("data-id"));
                var leaveID = $(this).attr("data-leaveID");
                var leaveName = tr.find("td:nth-child(1)").text();
                var avaliDate = tr.find("td:nth-child(2)").text();
                var accumDay = tr.find("td:nth-child(3)").text();
                var accumHour = tr.find("td:nth-child(4)").text();
                $("#leaveType").val(ID);
                $("#leaveName").val(leaveName);
                $("#avaliDate").val(avaliDate);
                $("#accumDate").val(accumDay);
                $("#accumHour").val(accumHour);

                $("#modalEditLeave").modal('show');
            });

            $(document).on('click', ".showEmpLeave", function () {
                var tr = $(this).closest("tr");
                var leaveName = tr.find("td:nth-child(1)").text();
                var leaveID = $(this).attr("data-leaveID");
                var empNum = $(this).attr("data-empid");
                $("#leaveHeader").text(leaveName);
                $("#TBbodyshowleave").empty();
                var fragment = '';
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetLeaveTransaction") %>",//new
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        empNum: empNum,
                        leaveID: leaveID,
                        ID : ''
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var strDate = val[0];
                                var endDate = val[1];
                                var useDate = val[2];
                                var useHour = val[3];
                                var ID = val[4];
                                var status = val[8];
                                var leave_reason = val[9];
                                var type = val[10]

                                fragment += '<tr>';
                                fragment += '<td><a class=" showLeaveDetails" data-type="'+type+'" data-leaveID="'+ID+'"><p style="font-weight: bold;">'+ leave_reason +'</p></a></td>';
                                fragment += '<td><a class=" showLeaveDetails" data-type="'+type+'" data-leaveID="'+ID+'">'+ strDate.substring(0, 10) +'</a></td>';
                                fragment += '<td><a class=" showLeaveDetails" data-type="'+type+'" data-leaveID="'+ID+'">'+ endDate.substring(0, 10) +'</a></td>';
                                fragment += '<td><a class=" showLeaveDetails" data-type="'+type+'" data-leaveID="'+ID+'">'+actionColor(status)+'</a></td>';
                                //fragment += '<td><button class="'+actionColorbtn(status)+' showLeaveDetails" data-type="'+type+'" data-leaveID="'+ID+'" type="button">'+status+'</button></td>';
                                
                                //fragment += '<td>'  + actionColor(status) + '</td>';
                                //fragment += '<td>' + useDate + '</td>';
                                //fragment += '<td>' + useHour + '</td>';
                                //fragment += '<td><button class="btn btn-success showLeaveDetails" data-type="'+type+'" data-leaveID="'+ID+'" type="button">Show</button></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyshowleave").append(fragment);
                    }
                });

                $("#modalShowLeave").modal('show');
            });


            $(document).on('click', "#btnModalAddAbsence", function () {
                $("#btnUpdateAbsence").attr("id", "btnAddAbsence");
                $("#btnAddAbsence").text("Add");
                 $("#AbsenceID").val("");
                 $("#AbsenceEffectDate1").val("");
                 $("#AbsenceDate1").val(0);
                 $("#AbsenceHour1").val(0);
                 $("#modalAddAbsence").modal('show');
            });
            $(document).on('click', ".btnModalEditAbsence", function () {
                $("#btnAddAbsence").attr("id", "btnUpdateAbsence");
                $("#btnUpdateAbsence").text("Edit");
                 var tr = $(this).closest("tr");
                 var ID = parseInt($(this).closest("tr").attr("data-id"));
                 var Effect_Date = tr.find("td:nth-child(1)").text();
                 var Accommodation_Date = tr.find("td:nth-child(2)").text();
                 var Accommodation_Hour = tr.find("td:nth-child(3)").text();
                 $("#AbsenceID").val(ID);
                 $("#AbsenceEffectDate1").val(Effect_Date);
                 $("#AbsenceDate1").val(Accommodation_Date);
                 $("#AbsenceHour1").val(Accommodation_Hour);
                 $("#modalAddAbsence").modal('show');
            });

            $(document).on('click', ".showLeaveDetails", function () {
                var ID = $(this).attr("data-leaveID");
                window.open("LeaveForm.aspx?ID=" + ID, '_blank');
            });

            $("#btnmodal").on("click", function () {
                $("#modalEmp").modal("show");
                $("#TBbodyemp").empty();
                $(".myInputEmp").val("");
                var fragment = '';
                var Search = new Array();
                var fillter = new Array();
                var type = '';
                var fragment = '';
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

            
            $('#AbsenceEffectDate1').datepicker({ dateFormat: "dd/mm/yy" });
            //// input change Search emp in start modal
            $(document).on("change",".myInputEmp", function () {
                var fragment = "";
                $("#TBbodyemp").empty();
                $("#TBbodybsence").empty();
                $('#btnModalAddAbsence').prop('disabled', true);
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
            // select change Search emp in start modal
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

            $(document).on("click", ".clickselectemp", function () {
                var EmpNum = $(this).closest("tr").find("td:nth-child(1)").text();
                //var newOption = '<option value="">===Select Year===</option>';
                var newOption = '';
                $("#TBbodyLeave").empty();
                $("#TBbodybsence").empty();
                $("#DayTotal").empty();
                $('#btnModalAddAbsence').prop('disabled', true);
                $("#EmpYear").empty();
                $(newOption).appendTo("#EmpYear");
                GetEmployee(EmpNum);
                $("#modalEmp").modal("hide");
            });

            $("#updateLeave").on('click', function () {
                var leaveID = $("#leaveType").val();
                var accumDate = $("#accumDate").val();
                var accumHour = $("#accumHour").val();
                  $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/SPLeaveLimit")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: leaveID,
                        Accommodation_Date: accumDate,
                        Accommodation_Hour: accumHour,
                        Action : "Update"
                    }),
                      success: function (response) {
                          var empNum = $("#EmpNum").val();
                          var year = $("#EmpYear").val();
                            $.ajax({
                                type: "post",
                                async: false,
                                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetTBLeaveLimit")%>",
                                contentType: "application/json; charset = utf-8",
                                dataType: "json",
                                data: JSON.stringify({
                                    Emp_Num: empNum,
                                    Year: year
                                }),
                                success: function (response) {
                                    alert("Update Complete!");
                                    $("#modalEditLeave").modal("hide");
                                    GetLeaveList(response);
                                }
                            });
                      }
                 });

            });
            $(document).on("click", "#btnAddAbsence", function () {
                var Accommodation_Date = $("#AbsenceDate1").val();
                var Accommodation_Hour = $("#AbsenceHour1").val();
                var Effect_Date = $("#AbsenceEffectDate1").val();
                var empNum = $("#EmpNum").val();
                var year = $("#EmpYear").val();
                  $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/SPLeaveAbsence")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: 0,
                        Emp_Num : empNum,
                        Accommodation_Date: Accommodation_Date,
                        Accommodation_Hour: Accommodation_Hour,
                        Effect_Date: Effect_Date,
                        Action : "Insert"
                    }),
                      success: function (response) {
                            $.ajax({
                                type: "post",
                                async: false,
                                url: "<%=ResolveUrl("MaintainEmployee.aspx/Get_TBLeaveAbsence")%>",
                                contentType: "application/json; charset = utf-8",
                                dataType: "json",
                                data: JSON.stringify({
                                    Emp_Num: empNum,
                                    Year: year
                                }),
                                success: function (response) {
                                    alert("Update Complete!");
                                    $("#modalAddAbsence").modal("hide");
                                    Get_TBLeaveAbsence(response);
                                }
                          });

                      }
                 });

            });

            $(document).on("click", "#btnUpdateAbsence", function () {
                var ID = $("#AbsenceID").val();
                var Accommodation_Date = $("#AbsenceDate1").val();
                var Accommodation_Hour = $("#AbsenceHour1").val();
                var Effect_Date = $("#AbsenceEffectDate1").val();
                var empNum = $("#EmpNum").val();
                var year = $("#EmpYear").val();
                  $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/SPLeaveAbsence")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        ID: ID,
                        Emp_Num : empNum,
                        Accommodation_Date: Accommodation_Date,
                        Accommodation_Hour: Accommodation_Hour,
                        Effect_Date: Effect_Date,
                        Action : "Update"
                    }),
                      success: function (response) {
                            $.ajax({
                                type: "post",
                                async: false,
                                url: "<%=ResolveUrl("MaintainEmployee.aspx/Get_TBLeaveAbsence")%>",
                                contentType: "application/json; charset = utf-8",
                                dataType: "json",
                                data: JSON.stringify({
                                    Emp_Num: empNum,
                                    Year: year
                                }),
                                success: function (response) {
                                    alert("Update Complete!");
                                    $("#modalAddAbsence").modal("hide");
                                    Get_TBLeaveAbsence(response);
                                }
                            });
                            
                      }
                 });

            });

            $("#EmpYear").on("change", function () {
                var empNum = $("#EmpNum").val();
                var year = $("#EmpYear").val();
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/GetTBLeaveLimit")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: empNum,
                        Year: year
                    }),
                    success: function (response) {
                        GetLeaveList(response);
                        $('#btnModalAddAbsence').prop('disabled', false);
                    }
                });
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/Get_TBLeaveAbsence")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: empNum,
                        Year: year
                    }),
                    success: function (response) {
                        Get_TBLeaveAbsence(response);
                    }
                });
                 
            });

            //-------add search----------
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
        //End document ready

        function GetYearLeaveLimit(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var year = val[0];
                    fragment += '<option value="' + year + '">' + year + '</option>';
                });
            }
            $("#EmpYear").append(fragment);
        }

        function GetEmployee(EmpNum) {

            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListEmployee") %>",//new
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Emp_Num: EmpNum, search: "", type: localStorage.getItem("type"), fillter: "" }),
                success: function (response) {
                    console.log(response.d);
                    if (response.d.length > 0) {
                        $("#EmpNum").val(response.d[0][0]);
                        $("#EmpName").val(response.d[0][4] + " " + response.d[0][5]);
                        $("#EmpStart").val(response.d[0][13].includes("-") ? formatDate(response.d[0][13].substring(0, 10)) : response.d[0][13].substring(0, 10));
                        $("#EmpEnd").val(response.d[0][41].includes("-") ? formatDate(response.d[0][41].substring(0, 10)) : response.d[0][41].substring(0, 10));
                        $("#EmpPro").val(response.d[0][14].includes("-") ? formatDate(response.d[0][14].substring(0, 10)) : response.d[0][14].substring(0, 10));
                        $("#EmpDept").val(response.d[0][48]);
                        $("#mainCom").val(response.d[0][49]);
                    }

                }
            });

            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/GetYearLeaveLimit")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                    data: JSON.stringify({ Emp_Num: $("#EmpNum").val() }),
                success: GetYearLeaveLimit
            });

            var empNum = $("#EmpNum").val();
            var year = $("#EmpYear").val();
            $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/GetTBLeaveLimit")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: empNum,
                        Year: year
                    }),
                    success: function (response) {
                        GetLeaveList(response);
                        $('#btnModalAddAbsence').prop('disabled', false);
                    }
                });
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/Get_TBLeaveAbsence")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        Emp_Num: empNum,
                        Year: year
                    }),
                    success: function (response) {
                        Get_TBLeaveAbsence(response);
                    }
                });
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

        function GetMainCompany(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[1];
                    var company = localStorage.getItem("type") == 'EN' ? val[2] : val[3];
                    if (localStorage.getItem("type") == 'TH') {
                        company = company == '' ? val[2] : val[3];
                    }
                    fragment += '<option value="' + ID + '">' + company + '</option>';
                });
            }
            $("#mainCom").append(fragment);
        }

        function GetLeaveList(response) {
            $("#TBbodyLeave").empty();
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[0];
                    var leaveID = val[1];
                    var avaliDate = parseInt(val[2]);
                    var accumDate = parseInt(val[3]);
                    var accumHour = parseInt(val[4]);
                    var empNum = $("#EmpNum").val();
                    //if (localStorage.getItem("type") == 'TH') {
                    //    company = company == '' ? val[2] : val[3];
                    //}
                    fragment += '<tr data-id="' + ID + '">';
                    fragment += '<td>' + getleaveName(leaveID) + '</td>';
                    fragment += '<td>' + avaliDate + '</td>';

                    if (((accumDate*8)+accumHour) > (avaliDate*8) ) {
                        fragment += '<td style="color:red;font-weight: bold;">' + accumDate + '</td>';
                        fragment += '<td style="color:red;font-weight: bold;">' + accumHour + '</td>';
                       
                    }
                    else {
                        fragment += '<td>' + accumDate + '</td>';
                        fragment += '<td>' + accumHour + '</td>';
                    }
                    fragment += '<td><button class="btn btn-warning btnupdateEmpLeave" data-leaveID="'+leaveID+'" type="button">Edit</button></td>';
                    fragment += '<td><button class="btn btn-success showEmpLeave" data-leaveID="'+ID+'" data-empID="'+empNum+'" type="button">Details</button></td>';
                    fragment += '<tr>';
                });
            }
            $("#TBbodyLeave").append(fragment);
        }

        function getleaveName(leaveID) {
            var leaveName = '';
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetLeaveMaster") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ search: leaveID }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var name = val[2];
                            leaveName = name;
                        });
                    } 
                }
            });
            return leaveName;
        }
        
        function Get_TBLeaveAbsence(response) {
            $("#TBbodybsence").empty();
            var empNum = $("#EmpNum").val();
            var year = $("#EmpYear").val();
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var ID = val[0];
                    var Accommodation_Date = val[1];
                    var Accommodation_Hour = val[2];
                    var Effect_Date = val[3];
                    var Effect_Date = Effect_Date.substring(0, 10);
                    fragment += '<tr data-id="' + ID + '">';
                    fragment += '<td>' + Effect_Date + '</td>';
                    fragment += '<td>' + Accommodation_Date + '</td>';
                    fragment += '<td>' + Accommodation_Hour + '</td>';
                    fragment += '<td><button class="btn btn-warning btnModalEditAbsence"  type="button">Edit</button></td>';
                    fragment += '<tr>';

                });
            }
            $.ajax({
                type: "post",
                async: false,
                url: "<%=ResolveUrl("MaintainEmployee.aspx/SPLeaveTotalAbsence")%>",
                contentType: "application/json; charset = utf-8",
                dataType: "json",
                data: JSON.stringify({
                    Emp_Num: empNum,
                    Year: year
                }),
                success: function (response) {
                    GETSPLeaveTotalAbsence(response);
                }
            });
            $("#TBbodybsence").append(fragment);
        }

        function GETSPLeaveTotalAbsence(response) {
            $("#DayTotal").empty();
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var Accommodation_Date = val[0];
                    var Accommodation_Hour = val[1];
                    fragment += "<h3>Days : <b style='color:red;'>"+Accommodation_Date+"</b> | Hour <b style='color:red;'>"+Accommodation_Hour+"</b></h3>"
                    
                    $("#DayTotal").append(fragment);
                });
            }
        }
        function actionColor(action) {
            var color = '';
            if (action == 'Complete') {
                color = "<p  style='color:#4CAF50;font-weight: bold;'>"+action+" <span class='glyphicon glyphicon-new-window' aria-hidden='true'></span></p>";
            }else if (action == 'Inprocess') {
                color = "<p  style='color:#FF9800;font-weight: bold;'>"+action+" <span class='glyphicon glyphicon-new-window' aria-hidden='true'></span></p>";
            }
            else if (action == 'Reject'|| action == 'Cancel') {
                color = "<p  style='color:#f44336;font-weight: bold;'>"+action+" <span class='glyphicon glyphicon-new-window' aria-hidden='true'></span></p>";
            }
            //else if (action == 'Approve') {
            //    color = "<p  style='color:#29B6F6'>"+action+"</p>";
            //}
            //else if (action == 'Rebuild') {
            //    color = "<p  style='color:#64DD17'>"+action+"</p>";
            //}
            return color;
        }
        function actionColorbtn(action) {
            var color = '';
            if (action == 'Complete') {
                color = "btn btn-success";
            }else if (action == 'Inprocess') {
                color = "btn btn-warning";
            }
            else if (action == 'Reject'|| action == 'Cancel'|| action == 'Deleted') {
                color = "btn btn-danger";
            }
            //else if (action == 'Approve') {
            //    color = "<p  style='color:#29B6F6'>"+action+"</p>";
            //}
            //else if (action == 'Rebuild') {
            //    color = "<p  style='color:#64DD17'>"+action+"</p>";
            //}
            return color;
        }

    </script>

    
</asp:Content>
