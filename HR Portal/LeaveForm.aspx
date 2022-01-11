<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveForm.aspx.cs" Inherits="HR_Portal.LeaveForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .max-wide {
            max-width: 100%;
        }

        .datetimepicker {
            background: #333;
            border: 1px solid #555;
            color: #EEE;
        }

        .nav-tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }
        .add-space{
            margin-bottom: 0.5rem;
        }
        .panel-heading{
            padding: 1px 15px;
        }
        /*#hideToggle{
            transform: rotateX(90deg);
            -webkit-transition: all .8s ease-in-out;
            -moz-transition: all .8s ease-in-out;
            /*-ms-transition: all 2s ease-in-out;*/
            /*-o-transition: all .8s ease-in-out;
            transition: all .8s ease-in-out;
        }*/
        .showLeaveDays{
            display:none;
        }

        .showLeaveDayTime{
            display:none;
        }
        .btn-default.btn-on.active{
            color: #3276b1;
            background-color: #fff;
        }
        .btn-default.btn-off.active{
            background-color: #DA4F49;color: white;
        }
        .noti{
            color:red;
            margin:0;
            text-align: center;
            display:none;
        }
        
        
    </style>
    <div class="page-header" style="padding:1rem">
        <div class="row" >
            <div class="col-md-12 col-sm-12 col-xs-12" >
                <h2 id="pageHeader" class="text-primary" style="padding-bottom: 1rem;float:left;padding-right: 1rem;padding-left: 1rem;">Request Leave</h2>
                <h5 style="float:left;padding-right: 1rem;padding-top: 2.5rem;display:none;" class="headerStatus"><b>: </b></h5><h5 id="WFStatus" style="color:#FF6F00;font-weight: bold;float:left;padding-top: 2.5rem;"class="headerStatus"></h5>
            </div>
            
        </div>
    </div>
    <!----End Header---->

    <div class="page-body">

        <div class="panel-group">
            <div class="panel panel-primary">
                <div class="panel-heading" >
                    <h3>Employee Details</h3>
                </div>
                <div class="panel-body">
                    <div class="row" style="margin-bottom:1rem;margin-top: 1rem;">
                        <div class="col-md-4 col-sm-4 col-xs-12 add-space"style="margin-top: 1rem;">
                            <div class="col-md-3 col-sm-3 col-xs-12">
                                <label class="control-label" style="font-size: 12px">Emp Num </label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12" >
                                <input id="EmpNum" type="text" class="form-control max-wide" disabled>
                                <%--<div class="input-group">
                                    <input id="EmpNum" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" id="btnmodal" data-type="EmpNum" >
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12 " style="margin-top: 1rem;">
                            <div class="col-md-3 col-sm-3 col-xs-12" >
                                <label class="control-label" id="TitleName" style="font-size: 12px;display:none;">Name </label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12" >
                                <p id="EmpName"></p>
                                <%--<input id="EmpName" type="text" class="form-control max-wide" disabled>--%>
                            </div>
                            
                        </div>

                        <div class="col-md-4 col-sm-4 col-xs-12 ">
                            <div class="col-md-9 col-sm-9 col-xs-12" >
                                <button type="button" class="btn btn-default" style="margin-top: 1rem;display:none;" onclick="togglePannel()" id="btnToggle">Details</button>
                            </div>
                        </div>
                    </div>
                    <div id="hideToggle" style="display:none;">
                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row" style="margin-bottom:1rem">
                                        <div class="col-md-4 col-sm-4 col-xs-12 " >
                                            <div class="col-md-3 col-sm-4 col-xs-12">
                                                <label class="control-label" style="font-size: 12px">Level</label>
                                            </div>
                                            <div class="col-md-9 col-sm-8 col-xs-12" >
                                                <%--<input id="EmpLevel" type="text" class="form-control max-wide" disabled>--%>
                                                <p id="EmpLevel"></p>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12" >
                                            <div class="col-md-3 col-sm-4 col-xs-12">
                                                <label class="control-label" style="font-size: 12px">Department</label>
                                            </div>
                                            <div class="col-md-9 col-sm-8 col-xs-12" >
                                                <%--<input id="EmpDepartment" type="text" class="form-control max-wide" disabled>--%>
                                                <p id="EmpDepartment"></p>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="col-md-3 col-sm-4 col-xs-12">
                                                <label class="control-label" style="font-size: 12px">Group </label>
                                            </div>
                                            <div class="col-md-9 col-sm-8 col-xs-12" >
                                                <%--<input id="EmpGroup" type="text" class="form-control max-wide" disabled>--%>
                                                <p id="EmpGroup"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" >
                                        <div class="col-md-4 col-sm-4 col-xs-12 ">
                                            <div class="col-md-3 col-sm-4 col-xs-12">
                                                <label class="control-label" style="font-size: 12px">Start Date </label>
                                            </div>
                                            <div class="col-md-9 col-sm-8 col-xs-12" >
                                                <%--<input id="EmpStart" type="text" class="form-control max-wide" disabled>--%>
                                                <p id="EmpStart"></p>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="col-md-3 col-sm-4 col-xs-12">
                                                <label class="control-label" style="font-size: 12px">Probation Date </label>
                                            </div>
                                            <div class="col-md-9 col-sm-8 col-xs-12" >
                                                <%--<input id="EmpPro" type="text" class="form-control max-wide" disabled>--%>
                                                <p id="EmpPro"></p>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="col-md-3 col-sm-4 col-xs-12">
                                                <label class="control-label" style="font-size: 12px">Longevity</label>
                                            </div>
                                            <div class="col-md-9 col-sm-8 col-xs-12" >
                                                <%--<input id="EmpLong" type="text" class="form-control max-wide" disabled>--%>
                                                <p id="EmpLong"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--Toggle-->

                </div>
            </div>
        </div><!---End Panel--->
                    
        <div class="panel-group">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12" id="leaveTap">
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="margin-bottom: 2rem;">
                            <h3>Leave Details</h3>
                        </div>
                        <div class="panel-body" >
                            <div class="row" style="margin-bottom:1rem">
                            <%--details--%>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="row" style="margin-bottom:1rem">
                                    <%--<div class="col-md-12 col-sm-12 col-xs-12">--%>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="col-md-3 col-sm-3 col-xs-2">
                                                <label class="control-label" style="font-size: 12px;">Leave Type</label>
                                            </div>
                                            <div class="col-md-9 col-sm-9 col-xs-10" >
                                                <select class="form-control max-wide" id="EmpLeaveType">
                                                    <option value="">=====Select Leave=====</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12 showLeaveDays">
                                            <div class="col-md-2 col-sm-2 col-xs-2">
                                                <label class="control-label" id="TiltleRemind" style="font-size: 12px;display:none;">Remind</label>
                                            </div>
                                            <div class="col-md-10 col-sm-10 col-xs-10">
                                                <p style="color:red;" id="LeaveRemind" ></p>
                                                <%--<textarea class="form-control max-wide" rows="4" id="LeaveRemind" disabled></textarea>--%>
                                            </div>
                                        </div>
                                    <%--</div>--%>
                                </div>

                                <div class="row" style="padding-top:0.5rem">
                                    <div class="col-md-2 col-sm-2 col-xs-2 showLeaveDays">
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-10 showLeaveDays">
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="col-md-6 col-sm-6 col-xs-8">
                                                <label class="control-label" style="font-size: 12px;color:#FF6F00;">Avaliable Days</label>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-2">
                                                <label class="control-label" id="LimitDays" >0</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="col-md-6 col-sm-6 col-xs-8">
                                                <label class="control-label" style="font-size: 12px;color:#FF6F00;">Avaliable Hours</label>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-2">
                                                <label class="control-label" id="LimitHour"  >0</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row add-space">
                                    <div class="col-md-2 col-sm-2 col-xs-2 showLeaveDays">
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-10 showLeaveDays">
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="col-md-6 col-sm-6 col-xs-8">
                                                <label class="control-label" style="font-size: 12px;color:#FF6F00;">Used Days</label>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-2">
                                                <label class="control-label" id="UsedDays" >0</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="col-md-6 col-sm-6 col-xs-8">
                                                <label class="control-label" style="font-size: 12px;color:#FF6F00;">Used Hours</label>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-2">
                                                <label class="control-label"  id="UsedHour">0</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="margin-bottom:1rem">
                                    <div class="col-md-6 col-sm-6 col-xs-12 add-space">
                                        <div class="col-md-3 col-sm-3 col-xs-12" >
                                            <label class="control-label" style="font-size: 12px">Leave Date</label>
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-12" >
                                            <div class="input-group">
                                                <input id="LeaveStart" type="text" class="form-control max-wide" autocomplete="off" readonly="readonly" >
                                                <div class="input-group-btn">
                                                    <button id="calenStart" class="btn btn-default Browse_modal" type="button">
                                                        <i class="glyphicon glyphicon-calendar"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="col-md-2 col-sm-2 col-xs-12">
                                            <label class="control-label" style="font-size: 20px">- </label>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-12" >
                                            <div class="form-group has-feedback has-search">
                                                <div class="input-group">
                                                    <input id="LeaveEnd" type="text" class="form-control max-wide" autocomplete="off" readonly="readonly" >
                                                    <div class="input-group-btn">
                                                        <button id="calenEnd" class="btn btn-default Browse_modal" type="button">
                                                            <i class="glyphicon glyphicon-calendar"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                        
                                </div>
                                <div class="row" style="margin-bottom:1rem">
                                    <div class="showLeaveDayTime" >
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                <label class="control-label" style="font-size: 12px">Days</label>
                                            </div>
                                            <div class="col-md-9 col-sm-9 col-xs-12" >
                                                <input id="LeaveUseDay" type="text" class="form-control max-wide" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12" id="hour-box">
                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                <label class="control-label" style="font-size: 12px">Hours</label>
                                            </div>
                                            <div class="col-md-9 col-sm-9 col-xs-12" >
                                                <input id="LeaveUseHour" type="text" class="form-control max-wide" disabled>
                                                <p class="noti" id="miniCheck">Hour was less than <b id="mini"></b> (Minimum hour per day)</p>
                                                <%--<p class="noti" id="lessCheck">Hour was less than <b id="mini"></b> (Minimum hour per day)</p>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="margin-bottom:1rem">
                                    <div class="col-md-6 col-sm-6 col-xs-12" >
                                        <div class="col-md-3 col-sm-3 col-xs-12">
                                            <label class="control-label" style="font-size: 12px">Leave Details</label>
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-12" >
                                            <textarea  id="LeaveDetails" class="form-control max-wide" rows="4" ></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="margin-bottom:1rem">
                                <div class="col-md-6 col-sm-6 col-xs-12" >
                                    <div class="col-md-3 col-sm-3 col-xs-1">
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2">
                                        <input type="checkbox" class="checkbox" id="acting" />
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-9">
                                        <label class="control-label" style="font-size: 12px">Request Acting Approval</label>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12" id="browseActing" style="display:none;">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <label class="control-label" style="font-size: 12px">Acting Approval</label>
                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <div class="input-group">
                                            <input id="username" type="text" class="form-control max-wide" disabled>
                                            <div class="input-group-btn">
                                                <button class="btn btn-default Browse_modal" type="button" id="btnbrowseuser" >
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--end row--%>

                            <div class="row" style="margin-bottom:1rem">
                                <div class="col-md-6 col-sm-6 col-xs-12" >
                                    <%--<div class="col-md-6 col-sm-6 col-xs-12">--%>
                                        <div class="col-md-3 col-sm-3 col-xs-2">
                                            <label class="control-label" style="font-size: 12px">Attach files</label>
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-10">
                                            <button type="button" class="btn btn-info" id="attach"> <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span></button>
                                        </div>
                                    <%--</div>--%>
                                </div>
                            </div>
                            </div>

                                    

                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <%--History--%>
                    <div id="WF_History" style="display: none;">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3>Workflow History</h3>
                            </div>
                            <div class="panel-body" id="hisBody">
                            </div>
                        </div>
                        <%--end panel--%>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top:1rem">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <%--<button type="button" id="btnSend" class="btn btn-default" style="float:right;margin-right:1rem;width:100%;margin-bottom:5px;" disabled>Complete</button>--%>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <button type="button" id="btnRejectModal" class="btn btn-danger cmModal" style="float:right;margin-right:1rem;width:100%;margin-bottom:5px;display:none;" data-type="reject">Reject</button>
                        <button type="button" id="btnDelete" class="btn btn-danger" style="float:right;margin-right:1rem;width:100%;margin-bottom:5px;display:none;" >Delete</button>
                    </div>
                    <%--<div class="col-md-4 col-sm-4 col-xs-12">
                        <button type="button" id="btnSendModal" class="btn btn-success cmModal" style="float:right;margin-right:1rem;width:100%;margin-bottom:5px;" >Submit</button>
                        <button type="button" id="btnApprove" class="btn btn-success cmModal" style="float:right;margin-right:1rem;width:100%;margin-bottom:5px;display:none;" data-type="approve">Approve</button>
                        <button type="button" id="btnRebuildModal" class="btn btn-success cmModal" style="float:right;margin-right:1rem;width:100%;margin-bottom:5px;display:none;" data-type="rebuild">Rebuild</button>
                    </div>--%>
                </div>
            </div>

        </div>
    </div><!---Page body--->

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
                                <input type="text" placeholder="Search for Employee ..." title="Type in a name" class="form-control max-wide myInputEmp" autocomplete="off">
                                
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

    <%--modal attach  --%>
    <div class="modal fade" id="modalAttach" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Files Attachment</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div id="addAtt" class="row">
                        <div class="col-md-3 col-lg-3 col-sm-12">
                            <p style="margin:1rem;">Add File : </p>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6">
                            <button type="button" class="btn btn-success" style="width:100%;max-width:200px;margin-bottom: 1rem;" onclick="addAttach()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                        </div>
                    </div>
                    
                    <table class="table  table-striped">
                        <thead>
                        </thead>
                        <tbody id="ListAttach2">
                        </tbody>
                    </table>

                    <table class="table  table-striped">
                        <thead>
                            <tr>
                                <th>File</th>
                                <th>File Name</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="ListAttach">
                        </tbody>
                    </table>
                                    
                </div>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-info" id="saveAttach" >Save</button>--%>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--End attach --%>

    <div class="modal fade" id="ModalUserAd" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Acting Approval</h4>
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

    <div class="modal fade" id="ModalComment" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" >
                        <%--<div class="col-md-9 col-lg-9 col-sm-12">--%>
                            <h4 class="modal-title">Comment Leave</h4>
                        <%--</div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>--%>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-lg-12 col-sm-12" >
                        <textarea id="comment" class="form-control max-wide" rows="6" placeholder="Comment. . ."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" id="btnSend" class="btn btn-success" style="float:right;" >Submit</button>
                    <button type="button" id="btnReject" class="btn btn-danger" style="float:right;display:none;" >Reject</button>
                    <button type="button" id="approve" class="btn btn-success" style="float:right;display:none;" >Approve</button>
                    <button type="button" id="btnRebuild" class="btn btn-success" style="float:right;display:none;">Rebuild</button>
                </div>
            </div>
        </div>
    </div>
    <!--- End Modal User --->

    <script type="text/javascript">

        $(document).ready(function () {

            var getURL = getAllUrlParams("ID");
            var ID = typeof getURL === "undefined" ? "": getURL;

            if (ID != "") {
                callHistory(ID);
                $("#leaveTap").attr("class","col-md-8 col-sm-8 col-xs-12");
                $("#WF_History").css("display", "block");
                // Get Leave Details
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetLeaveTransaction") %>",//new
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        empNum: "",
                        leaveID: "",
                        ID:ID
                    }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var strDate = val[0];
                                var endDate = val[1];
                                var useDate = val[2];
                                var useHour = val[3];
                                //var ID = val[4];

                                var EmpNum = val[5];
                                var RefID = val[6];
                                var Description = val[7];

                                $("#LeaveStart").val(strDate);
                                $("#LeaveEnd").val(endDate);
                                $("#EmpNum").text(EmpNum);
                                GetEmployeeDetails(EmpNum)
                                $("#EmpLeaveType").val(RefID);
                                $("#LeaveDetails").text(Description);
                                $("#UsedDays").text(useDate);
                                $("#UsedHour").text(useHour);
                                $(".showLeaveDays").css("display", "block");
                                $.ajax({
                                    type: "post",
                                    async: false,
                                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetLeaveTotalUsed")%>",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    data: JSON.stringify({ Emp_Num: EmpNum , LeaveType:RefID }),
                                    success: GetLeaveTotalUsed
                                });
                            });
                        } else {
                            window.location.href = "MaintainEmployee.aspx";
                        }
                    }
                });

                //get Employee From EmpNum
                function GetEmployeeDetails(EmpNum) {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetListEmployee") %>",//new
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Emp_Num: EmpNum ,search:"", type: "" , fillter: "" }),
                        success: function (response) {
                            console.log(response.d);
                            if (response.d.length > 0) {
                                $("#EmpNum").val(response.d[0][0]);
                                $("#EmpName").text(response.d[0][4] + " " + response.d[0][5]);
                                $("#EmpLevel").text(response.d[0][7]);
                                $("#EmpStart").text(response.d[0][13].includes("-") ? formatDate(response.d[0][13].substring(0, 10)) : response.d[0][13].substring(0, 10));
                                $("#EmpPro").text(response.d[0][14].includes("-") ? formatDate(response.d[0][14].substring(0, 10)) : response.d[0][14].substring(0, 10));
                                $("#EmpDepartment").text(response.d[0][48]);
                            
                                //console.log(response.d[0]);
                            }
                            var department = $("#EmpDepartment").text();
                            $.ajax({
                                type: "post",
                                async: false,
                                url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_HR_List_Company")%>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ search: department }),
                                success: GetListBUGroup
                            });

                            $.ajax({
                                type: "post",
                                async: false,
                                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetLeaveType")%>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ Emp_Num: EmpNum }),
                                success: GetLeaveType
                            });
                            $("#btnSend").prop('disabled', false)
                            $("#btnToggle").css('display', 'block');
                            $("#TitleName").css('display', 'block');
                            //$("#modalEmp").modal("hide");
                        }
                    });
                }
                
                <%--$(document).on("change", "#EmpLeaveType", function () {
                    if ($(this).val() != "") {
                        $(".showLeaveDays").css("display", "block");
                        var Remind = $('option:selected', this).attr('data-Remind');
                        var EmpNum = $("#EmpNum").val();
                        var LeaveTypeID = $("#EmpLeaveType").val();
                        if (Remind != "") {
                            $("#TiltleRemind").css('display', 'block');
                            $("#LeaveRemind").text(Remind);
                        }
                        else {
                            $("#TiltleRemind").css('display', 'none');
                            $("#LeaveRemind").empty();
                        }

                        $.ajax({
                                type: "post",
                                async: false,
                                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetLeaveTotalUsed")%>",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({ Emp_Num: EmpNum , LeaveType:LeaveTypeID }),
                                success: GetLeaveTotalUsed
                            });

                    } else {
                        $(".showLeaveDays").css("display", "none");
                    }
                
                });--%>

            }//IF
            //history
            $(document).on('click',".toggle",function(){
                var type = $(this).attr("data-type");
                $("."+type).toggle();
            });
            
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

        function callHistory(Leave_ID) {
            var fragment = '';
            $("#hisBody").empty();
            $.ajax({
                type: "post",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetHistory") %>",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Leave_ID: Leave_ID, Language: 'EN' }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var tranID = val[0];
                            var LeaveID = val[1];
                            var des = val[2];
                            var action = val[3] == '' ? 'Awaiting' : val[3];
                            action = actionColor(action);
                            var status = val[4];
                            var strDate = val[5];
                            var endDate = val[6];
                            var wfStatus = val[7];
                            var cm = val[8];
                            fragment += '<div class="row"><div class="col-md-12 col-sm-12 col-xs-12" >';
                            fragment += '<h5 class="text-primary" style="float:left;"><b>'+wfStatus+'</b></h5>'+
                            '<button type="button" class="btn btn-default toggle" data-type="'+tranID+'" style="float:right;"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></button>';
                            fragment += '<div class="col-md-12 col-sm-12 col-xs-12 '+tranID+'" >';
                            fragment += '<div class="row"><div class="col-md-4 col-sm-4 col-xs-3"><p>Status :</p></div>';
                            fragment += '<div class="col-md-8 col-sm-8 col-xs-9"><b>'+action+'</b></div></div>';
                            fragment += '<div class="row"><div class="col-md-4 col-sm-4 col-xs-3"><p>Start Date :</p></div>';
                            fragment += '<div class="col-md-8 col-sm-8 col-xs-9"><p>'+strDate+'</p></div></div>';
                            fragment += '<div class="row"><div class="col-md-4 col-sm-4 col-xs-3"><p>End Date :</p></div>';
                            fragment += '<div class="col-md-8 col-sm-8 col-xs-9"><p>'+endDate+'</p></div></div>';
                            fragment += '<div class="row"><div class="col-md-4 col-sm-4 col-xs-3"><p>Actual Approve :</p></div>';
                            fragment += '<div class="col-md-8 col-sm-8 col-xs-9"><p>'+des+'</p></div></div>';
                            fragment += '<div class="row"><div class="col-md-4 col-sm-4 col-xs-3"><p>Comment :</p></div>';
                            fragment += '<div class="col-md-8 col-sm-8 col-xs-9"><p>'+cm+'</p></div></div>';
                            fragment += '</div>';
                            fragment += '</div>';
                            fragment += '</div>';
                                
                        });
                    } else { }
                    $("#hisBody").append(fragment);
                }
            });
        }

        function actionColor(action) {
            var color = '';
            if (action == 'Submit') {
                color = "<p  style='color:#29B6F6'>"+action+"</p>";
            }
            else if (action == 'Approve') {
                color = "<p  style='color:#4CAF50'>"+action+"</p>";
            }
            else if (action == 'Reject'|| action == 'Cancel') {
                color = "<p  style='color:#f44336'>"+action+"</p>";
            }
            else if (action == 'Rebuild') {
                color = "<p  style='color:#64DD17'>"+action+"</p>";
            }
            else if (action == 'Awaiting') {
                color = "<p  style='color:#FF9800'>"+action+"</p>";
            }
            return color;
        }

        function GetLeaveTotalUsed(response) {
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var Available_Date = val[0];
                    var Available_house = val[1];
                    var Accommodation_Date = val[2];
                    var Accommodation_Hour = val[3];
                    $("#LimitDays").text(Available_Date);
                    $("#LimitHour").text(Available_house);
                    //$("#UsedDays").text(Accommodation_Date);
                    //$("#UsedHour").text(Accommodation_Hour);
                });
            }
        }

        function GetLeaveType(response) {
            var fragment = '';
            $("#EmpLeaveType").empty();
            if (response.d.length > 0) {
                  fragment += `<option value="">========Select Leave========</option>`;
                $.each(response.d, function (index, val) {
                    var LeaveTypeID = val[0];
                    var Leave_Reason = val[1];
                    var Remind = val[2];
                    fragment += '<option value="' + LeaveTypeID +'" data-Remind="'+Remind+'" >' + Leave_Reason + '</option>';
                    //console.log(response);
                });
            }
            $("#EmpLeaveType").append(fragment);
        }

        function GetListBUGroup(response) {
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var BUname = val[4];
                    $('#EmpGroup').text(BUname);
                });
            }
            else {
                $('#EmpGroup').val('');
            }
            //if ($('#Emp_CostCenter').val() == '') {
            //}
        }

        function GetLeaveReason(response) {
            var fragment = '';
            if (response.d.length > 0) {
                $.each(response.d, function (index, val) {
                    var year = val[0];
                    fragment += '<option value="' + year + '">' + year + '</option>';
                });
            }
            $("#EmpLeaveType").append(fragment);
        }

        function togglePannel() {
            var checkCss = $("#hideToggle").css("display");
            if (checkCss == "none") {
                $("#hideToggle").css("display", "block");
                //$("#hideToggle").css("opacity", "1");
                //setTimeout(function () { $("#hideToggle").css("display", "block") }, 1000);
                
                $("#btnToggle").html("Hide");
            }
            else if (checkCss == "block") {
                //$("#hideToggle").css("opacity", "0");
                //setTimeout(function () { $("#hideToggle").css("display", "none") }, 500);
                $("#hideToggle").css("display", "none");
                $("#btnToggle").html("Details");
            }
        }

    </script>
</asp:Content>
