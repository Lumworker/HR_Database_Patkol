<%@ Page Title="Leave Maintain" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveMaintain.aspx.cs" Inherits="HR_Portal.LeaveMaintain" %>
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
        <h2>Maintain Leave</h2>
         <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
            </div>

            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                <button id="btnModalNew" class="btn btn-info" type="button" data-toggle="modal"> New </button>
            </div>
        </div>

    </div>


    <!----End Header---->

    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <table id="TableLeave" class="table" style="width: 100%">
                            <thead>
                                <tr>
                                    <%--<th style="display:none;">ID</th>--%>
                                    <th>Leave Group</th>
                                    <th>Leave Reason</th>
                                    <th>Effective Start</th>
                                    <th>Avaliable Leave Day</th>
                                    <th>Avaliable Leave Pay Day</th>
                                    <th style="width:220px">Remind</th>
                                    <th style="width:50px"></th>
                                    <%--<th style="width:50px"></th>--%>
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
    <%--Start New Permission Modal--%>
    <div class="modal fade" id="modalLeave" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="modalHeaderText">New Leave</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12" >
                            <input id="leaveID" type="hidden" class="form-control max-wide" disabled>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <label class="control-label" style="font-size: 13px">Type :</label>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4">
                                    <div class="input-group">
                                        <input id="leaveType" type="text" class="form-control max-wide" disabled>
                                        <div class="input-group-btn">
                                            <button class="btn btn-default Browse_modal" type="button" data-type="leaveType">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <%--<input id="username" type="text" class="form-control max-wide" >--%>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <input id="leaveReason" type="text" class="form-control max-wide">
                                    <input id="leaveTypeName" type="text" class="form-control max-wide" style="display:none">
                                </div>
                            </div>
                    </div>
                        <%--End ZoneID --%>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <label class="control-label" style="font-size: 13px">Sex :</label>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">
                                    <label class="radio-inline">
                                        <input name="sex" id="all" value="ALL" type="radio" checked /><span>All</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input name="sex" id="men" value="M" type="radio" /><span>Male</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input name="sex" id="women" value="W" type="radio" /><span>Female</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    <%--End sex --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 12px">Effective Start :</label>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <select class="form-control max-wide" id="effStart">
                                    <option value="EmpStart">Employee Start</option>
                                    <option value="AfterPro">After Probation</option>
                                    <option value="Longevity">Longevity</option>
                                </select>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="LongevityYear" type="text" class="form-control max-wide" value="0" placeholder="Years" disabled style="display:none">
                            </div>
                        </div>
                    </div>
                    <%--End effStart--%>
                    <%--<div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Limited Day :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <label class="radio-inline">
                                    <input name="isLimited" id="yes" value="yes" type="radio" checked /><span>Yes</span>
                                </label>
                                <label class="radio-inline">
                                    <input name="isLimited" id="no" value="no" type="radio" /><span>No</span>
                                </label>
                            </div>

                        </div>
                    </div>--%>
                    <%--End isLimited--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Avaliable Leave Day :</label>
                            </div>
                            <%--<div class="col-md-9 col-sm-9 col-xs-9">--%>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="avaliableDay" type="number" class="form-control max-wide" >
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <label class="control-label" style="font-size: 13px">Non Limit :</label>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <%--<label class="radio-inline">
                                    <input name="isLimited" id="yesDay" value="1" type="radio" checked /><span>Yes</span>
                                </label>--%>
                                <label class="checkbox">
                                    <input name="isLimited" id="noDay" value="0" type="checkbox" style="margin: 0;" />
                                </label>
                            </div>
                            <%--</div>--%>
                        </div>
                    </div>
                    <%--End avaliableDay--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Avaliable Leave Pay Day :</label>
                            </div>
                            <%--<div class="col-md-9 col-sm-9 col-xs-9">
                                <input id="avaliablePayDay" type="text" class="form-control max-wide" >
                            </div>--%>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="avaliablePayDay" type="number" class="form-control max-wide" >
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <label class="control-label" style="font-size: 13px">Non Limit:</label>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <%--<label class="radio-inline">
                                    <input name="isLimitedPay" id="yesPayDay" value="1" type="radio" checked /><span>Yes</span>
                                </label>--%>
                                <label class="checkbox">
                                    <input name="isLimitedPay" id="noPayDay" value="0" type="checkbox" style="margin: 0;" />
                                </label>
                            </div>
                        </div>
                    </div>
                    <%--End avaliablePayDay--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" >
                        <%--<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">--%>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Leave Condition :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="radio-inline">
                                    <input name="leaveCondition" id="day" value="DAY" type="radio" checked /><span>Day</span>
                                </label>
                                <label class="radio-inline">
                                    <input name="leaveCondition" id="hour" value="Hour" type="radio" /><span>Hour</span>
                                </label>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <label class="control-label" style="font-size: 13px">Mininmum :</label>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input id="leaveMini" type="number" class="form-control max-wide" ">
                            </div>

                        </div>
                    </div>
                    <%--End leaveCondition--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Paper:</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <input name="Reqpeper" id="Reqpeper" value="0" type="checkbox" /><span> Require</span>
                                
                            </div>
                        </div>
                    </div>
                    <%--End ReqPaper--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Reset Date :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <label class="radio-inline">
                                    <input name="resetDate" id="Nonreset" value="None" type="radio" checked/><span>None</span>
                                </label>
                                <label class="radio-inline">
                                    <input name="resetDate" id="NewYear" value="NewYear" type="radio"  /><span>New Year</span>
                                </label>
                                <label class="radio-inline">
                                    <input name="resetDate" id="EmpStart" value="EmpStart" type="radio"  /><span>Employee Start</span>
                                </label>
                                <label class="radio-inline">
                                    <input name="resetDate" id="AfterPro" value="AfterPro" type="radio"  /><span>After Probation</span>
                                </label>
                                
                            </div>
                        </div>
                    </div>
                    <%--End Reset Date--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Reset Date 2 :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <label class="radio-inline">
                                    <input name="resetDate2" id="None" value="None" type="radio" checked /><span>None</span>
                                </label>
                                <label class="radio-inline">
                                    <input name="resetDate2" id="newYear" value="NewYear" type="radio" /><span>New Year</span>
                                </label>
                                <label class="radio-inline">
                                    <input name="resetDate2" id="empstart" value="Empstart" type="radio" /><span>Employee Start</span>
                                </label>
                                <label class="radio-inline">
                                    <input name="resetDate2" id="afterPro" value="AfterPro" type="radio" /><span>After Probation</span>
                                </label>
                            </div>

                        </div>
                    </div>
                    <%--End Reset Date2--%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Remind :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <%--<input id="remind" type="text" class="form-control max-wide" >--%>
                                <textarea class="form-control max-wide" rows="3" id="remind"></textarea>
                            </div>
                        </div>
                    </div>
                    <%--End Remind--%>

                </div>
                <%--End modal body--%>
                <div class="modal-footer" id="Browsefooter">
                                    
                </div>
            
            </div>
        </div>
    </div>
    <%--End Modal--%>
        <%--Start Browse Modal--%>
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
                                <input type="text" id="SearchBrowse" placeholder="Search.." class="form-control max-wide" autocomplete="off">
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
    <%--End Browse Modal--%>

    
    <script type="text/javascript">

        $(document).ready(function () {

            sessionStorage.setItem('Page_type', 'LeaveMaintain');
            
            var TableLeave = $('#TableLeave').DataTable({
                    searching: true,
                    responsive: true,
                    "order": []

                });
            LoadData();

            $("#effStart").on('change', function () {
                if ($("#effStart").val() == 'Longevity') {
                    $("#LongevityYear").prop('disabled', false);
                    $("#LongevityYear").css("display", "block");
                    $("#LongevityYear").focus();
                } else {
                    $("#LongevityYear").prop('disabled', true);
                    $("#LongevityYear").val(0);
                    $("#LongevityYear").css("display", "none");
                }
            });

            $("input[name=isLimited]").on('change', function () {
                if ($("#noDay").is(':checked')) {
                    $("#avaliableDay").val(0);
                    $("#avaliableDay").prop('disabled', true);
                } else {
                    $("#avaliableDay").prop('disabled', false);
                }
            });

            $("input[name=isLimitedPay]").on('change', function () {
                if ($("#noPayDay").is(':checked')) {
                    $("#avaliablePayDay").val(0);
                    $("#avaliablePayDay").prop('disabled', true);
                } else {
                    $("#avaliablePayDay").prop('disabled', false);
                }
            });

            $("#btnModalNew").on("click", function () {
                $("#modalHeaderText").text("New Leave");
                $("#leaveID").val("");
                $("#leaveType").val("");
                $("#leaveTypeName").val("");
                $("#leaveReason").val("");
                $("#all").prop("checked", true);
                $("#effStart").val("EmpStart");
                $("#LongevityYear").val(0);
                $("#noDay").prop("checked", false);
                $("#noPayDay").prop("checked", false);
                $("#avaliableDay").val(0);
                $("#avaliablePayDay").val(0);
                $("#day").prop("checked", true);
                $("#Nonreset").prop("checked", true);
                $("#None").prop("checked", true);
                $("#leaveMini").val(0);
                $("#remind").val("");
                $("#Reqpeper").prop("checked", false);
                $("#Browsefooter").empty();
                $("#LongevityYear").css("display", "none");
                $("#avaliableDay").prop("disabled", false);
                $("#avaliablePayDay").prop("disabled", false);

                var button = ' <button type="button" class="btn btn-success" id="LeaveModalSave" >Save</button>';
                button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                $("#Browsefooter").append(button);
                $("#modalLeave").modal("show");
            });

            $(document).on("click", ".btnModalEdit", function () {
                $("#modalHeaderText").text("Leave Details");
                var tr = $(this).closest("tr");
                //var ID = tr.find("td:nth-child(1)").text();
                var ID = $(this).attr("data-id");
                var leaveType = tr.find("td:nth-child(1)").text();
                var leaveReason = tr.find("td:nth-child(2)").text();
                var leaveTypeName = $(this).attr("data-group");
                var sex = $(this).attr("data-sex");
                var effStart = tr.find("td:nth-child(3)").text();
                var LongevityYear = ($(this).attr("data-longevity")) == "" ? 0 : $(this).attr("data-longevity");
                var isLimited = ($(this).attr("data-isLimited")) == 1 ? 1 : 0;
                var avaliableDay = tr.find("td:nth-child(4)").text();
                var isLimitedPay = ($(this).attr("data-isLimitedPay")) == 1 ? 1 : 0;
                var avaliablePayDay = tr.find("td:nth-child(5)").text();
                var leaveCondition = $(this).attr("data-leaveCondition");
                var resetDate = $(this).attr("data-resetDate");
                var resetDate2 = $(this).attr("data-resetDate2");
                var remind = $(this).attr("data-remind");
                var reqpaper = ($(this).attr("data-reqpaper")) == 1 ? 1 : 0;
                console.log(reqpaper);
                var Leave_Minimum = $(this).attr("data-leaveMini");
                if (effStart == 'Longevity') {
                    $("#LongevityYear").prop('disabled', false);
                    $("#LongevityYear").css("display", "block");
                } else {
                    $("#LongevityYear").prop('disabled', true);
                    $("#LongevityYear").css("display", "none");
                }
                if (isLimited==0) {
                    $("#avaliableDay").val(0);
                    $("#avaliableDay").prop('disabled', true);
                } else {
                    $("#avaliableDay").prop('disabled', false);
                }
                if (isLimitedPay==0) {
                    $("#avaliablePayDay").val(0);
                    $("#avaliablePayDay").prop('disabled', true);
                } else {
                    $("#avaliablePayDay").prop('disabled', false);
                }
                $("#leaveID").val(ID);
                $("#leaveType").val(leaveType);
                $("#leaveReason").val(leaveReason);
                $("#leaveTypeName").val(leaveTypeName);
                $("input[name=sex]").each(function () { $(this).val() == sex ? $(this).prop("checked", true) : ""; });
                $("#effStart").val(effStart);
                $("#LongevityYear").val(LongevityYear);
                $("input[name=isLimited]").prop("checked", isLimited == 0 ? true : false);
                $("#avaliableDay").val(avaliableDay);
                $("input[name=isLimitedPay]").prop("checked", isLimitedPay == 0 ? true : false);
                $("#avaliablePayDay").val(avaliablePayDay);
                $("input[name=leaveCondition]").each(function () { $(this).val() == leaveCondition ? $(this).prop("checked", true) : ""; });
                $("#leaveMini").val(Leave_Minimum);
                $("input[name=resetDate]").each(function () { $(this).val() == resetDate ? $(this).prop("checked", true) : ""; });
                $("input[name=resetDate2]").each(function () { $(this).val() == resetDate2 ? $(this).prop("checked", true) : ""; });
                $("#remind").val(remind);
                $("#Reqpeper").prop("checked", reqpaper == 0 ? false :  true);
                $("#Browsefooter").empty();
                var button = ' <button type="button" class="btn btn-warning " id="LeaveEdit" >Save</button>';
                button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                $("#Browsefooter").append(button);
                $("#modalLeave").modal("show");
            });
            

            $(document).on("click", "#LeaveModalSave", function () {
                var id = $("#leaveID").val();
                var leaveType = $("#leaveTypeName").val();
                //var leaveTypeName = $("#leaveType").val();
                var leaveReason = $("#leaveReason").val();
                var sex = $("input[name=sex]:Checked").val();
                var effStart = $("#effStart").val();
                var LongevityYear = $("#LongevityYear").val();
                var isLimited = $("input[name=isLimited]:Checked").val() == 0 ? 0 : 1;
                var avaliableDay = $("#avaliableDay").val();
                var isLimitedPayDay = $("input[name=isLimitedPay]:Checked").val() == 0 ? 0 : 1;
                var avaliablePayDay = $("#avaliablePayDay").val();
                var leaveCondition = $("input[name=leaveCondition]:Checked").val();
                var resetDate = $("input[name=resetDate]:Checked").val();
                var resetDate2 = $("input[name=resetDate2]:Checked").val();
                var remind = $("#remind").val();
                var Leave_Minimum = $("#leaveMini").val();
                var reqpaper = $("input[name=Reqpeper]:Checked").val() == 0 ? 1 : 0;
                
                
                if (leaveType != "" && avaliableDay != "" && avaliablePayDay != "" && Leave_Minimum != "") {
                    if (isLimited == 1 && avaliableDay == 0) {
                        alert("Please Check Avaliable Day");
                    }
                    //else if (isLimitedPayDay == 1 ) {
                    //    alert("Please Check Avaliable Pay Day!");
                    //}
                    else if (LongevityYear=="") {
                        alert("Please Check Longevity's Years!");
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Leave_Type_Maintain")%>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({
                                Leave_ID: 0,
                                Leave_Group: leaveType,
                                Leave_Reason: leaveReason,
                                Sex: sex,
                                Effective_Start: effStart,
                                Longevity_Year: LongevityYear,
                                isLimitedDay: isLimited,
                                availableDay: avaliableDay,
                                isLimitedPayDay: isLimitedPayDay,
                                availablePayDay: avaliablePayDay,
                                Leave_Condition: leaveCondition,
                                Leave_Minimum: Leave_Minimum,
                                reqpaper : reqpaper,
                                Reset_Date: resetDate,
                                Reset_Date2: resetDate2,
                                Remind: remind,
                                Action: "Insert"
                            }),
                            success: function (response) {
                                alert("Insert Complete!");
                                $("#Browsefooter").empty();
                                $("#modalLeave").modal("hide");
                                LoadData();
                            }
                        });//End ajax
                    }
                } else { alert("Please check data") }
            });

            $(document).on("click", "#LeaveEdit", function () {
                var id = $("#leaveID").val();
                var leaveType = $("#leaveTypeName").val();
                var leaveReason = $("#leaveReason").val();
                var sex = $("input[name=sex]:Checked").val();
                var effStart = $("#effStart").val();
                var LongevityYear = $("#LongevityYear").val();
                var isLimited = $("input[name=isLimited]:Checked").val() == 0 ? 0 : 1;
                var avaliableDay = $("#avaliableDay").val();
                var isLimitedPayDay = $("input[name=isLimitedPay]:Checked").val() == 0 ? 0 : 1;
                var avaliablePayDay = $("#avaliablePayDay").val();
                var leaveCondition = $("input[name=leaveCondition]:Checked").val();
                var resetDate = $("input[name=resetDate]:Checked").val();
                var resetDate2 = $("input[name=resetDate2]:Checked").val();
                var remind = $("#remind").val();
                var Leave_Minimum = $("#leaveMini").val();
                var reqpaper = $("input[name=Reqpeper]:Checked").val() == 0 ? 1 : 0;
                
                if (leaveType != "" && avaliableDay != "" && avaliablePayDay != "" && Leave_Minimum != "") {
                    if (isLimited == 1 && avaliableDay == 0) {
                        alert("Please Check Avaliable Day");
                    }
                    //else if (isLimitedPayDay == 1 ) {
                    //    alert("Please Check Avaliable Pay Day!");
                    //}
                    else if (LongevityYear=="") {
                        alert("Please Check Longevity's Years!");
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Leave_Type_Maintain")%>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({
                                Leave_ID: id,
                                Leave_Group: leaveType,
                                Leave_Reason: leaveReason,
                                Sex: sex,
                                Effective_Start: effStart,
                                Longevity_Year: LongevityYear,
                                isLimitedDay: isLimited,
                                availableDay: avaliableDay,
                                isLimitedPayDay: isLimitedPayDay,
                                availablePayDay: avaliablePayDay,
                                Leave_Condition: leaveCondition,
                                Leave_Minimum: Leave_Minimum,
                                reqpaper : reqpaper,
                                Reset_Date: resetDate,
                                Reset_Date2: resetDate2,
                                Remind: remind,
                                Action: "Update"
                            }),
                            success: function (response) {
                                alert("Update Complete!");
                                $("#Browsefooter").empty();
                                $("#modalLeave").modal("hide");
                                LoadData();
                            }
                        });//End ajax
                    }
                } else { alert("Please check data") }
            });

            <%--$(document).on("click", ".PermissionDelete", function () {
                var r = confirm("Confirm Delete");
                if (r === true) {
                    var tr = $(this).closest("tr");
                    //var ID = tr.find("td:nth-child(1)").text();
                    var ID = $(this).attr("data-id");
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Permission")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID,
                            username: '',
                            Per_Page: '',
                            viewer : '',
                            editor: '',
                            Action: "Delete"
                        }),
                        success: function (response) {
                            alert("Delete Complete!");
                            $("#modalLeave").modal("hide");
                            LoadData();
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });--%>

            $(".Browse_modal").on("click", function () {
                $("#search_leaveType").val("");
                $("#TBbodyBrowse").empty();
                //----create new search box----
                $("#search_box").empty();
                $('<input>').attr({
                    type: 'text',
                    id: 'SearchBrowse',
                    placeholder: "Search..",
                    class: "form-control max-wide",
                    autocomplete: "off"
                }).appendTo('#search_box');
                var fragment = '';
                browse_type = $(this).attr("data-type");
                if (browse_type == 'leaveType') {
                    $("#browseHeader").text('Select Leave Group');
                    $('#SearchBrowse').attr("id", 'search_leaveType');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetleaveGroup") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var num = val[0];
                                    var username = val[1];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectleavegroup" href="javascript:void(0)" >' + num + '</a></td>';
                                    fragment += '<td><a class="clickselectleavegroup" href="javascript:void(0)" >' + username + '</a></td>';
                                    fragment += '</tr>';
                                });

                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                
            });

            $(document).on("change", "#search_leaveType", function() {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetleaveGroup")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var num = val[0];
                                var username = val[1];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectleavegroup" href="javascript:void(0)" >' + num + '</a></td>';
                                fragment += '<td><a class="clickselectleavegroup" href="javascript:void(0)" >' + username + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });

            //-------select username------
            $(document).on("click", ".clickselectleavegroup", function () {
                var group = $(this).closest("tr").find("td:nth-child(1)").text();
                var name = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#leaveType").val(name);
                $("#leaveReason").val(name);
                $("#leaveTypeName").val(group);
                $("#modalBrowse").modal("hide");
            });

            //$('#editor').on('change', function () {
            //    if ($('#editor').is(':checked')) {
            //        $('#viewer').prop('checked', true);
            //    }
            //});

            function LoadData() {
                    TableLeave.clear().draw();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetLeaveMaster")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: '' }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var ID = val[0];
                                    var leaveGroup = val[1];
                                    var leaveReason = val[2];
                                    var sex = val[3];
                                    var effectiveStart = val[4];
                                    var isLimited = val[5] == "True" ? 1 : 0;
                                    var avaliableDay = val[6];
                                    var isLimitedPay = val[7] == "True" ? 1 : 0;
                                    var avaliablePayDay = val[8];
                                    var leaveCondition = val[9];
                                    var leaveMini = val[10];
                                    var longevity = val[11];
                                    var resetDate = val[12];
                                    var resetDate2 = val[13];
                                    var remind = val[14];
                                    var des = val[15];
                                    var reqpaper = val[16] == "True" ? 1 : 0;
                                    TableLeave.row.add([ des, leaveReason, effectiveStart,avaliableDay,avaliablePayDay ,remind
                                        , '<button class="btn btn-warning btnModalEdit"data-group="'+leaveGroup+'" data-id="'+ID+'" data-sex="'+sex+'" data-isLimited="'+isLimited+'" data-isLimitedPay="'+isLimitedPay+'" data-leaveCondition="'+leaveCondition+'" data-leaveMini="'+leaveMini+'" data-longevity="'+longevity+'" data-resetDate="'+resetDate+'" data-resetDate2="'+resetDate2+'" data-remind="'+remind+'" data-reqpaper="'+reqpaper+'" type="button">Details</button>'
                                        ]).draw().node();
                                });
                            }
                        }
                    });
            }
        });//end Document Ready
       
    </script>
</asp:Content>
