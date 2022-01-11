<%@ Page Title="PATAG Group" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PATAG_Group.aspx.cs" Inherits="HR_Portal.PATAG_Group" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .max-wide {
            max-width: 100%;
        }

        .datepicker {
            background: #333;
            border: 1px solid #555;
            color: #EEE;
            z-index: 9999 !important;
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
        #ui-datepicker-div {
            z-index: 1600 !important;
        }

    </style>
        <div class="page-header">

            <div class="row">
                    <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                        <span>Maintain PA TAG Group  </span>
                    </div>

                    <div class="col-md-8 col-xs-8" style="text-align: right">
                        <button id="btnNewGroup" class="btn btn-success" type="button">New</button>
                    </div>
                </div>


        </div>
    <!----End Header---->

    <%--<div class="container">--%>
        <div class="panel-group">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 style="margin-left: 5px;">PA GROUP</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="TablePATAG_Type" class="table table-hover table-bordered" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>รหัสนำหน้า</th>
                                                    <th style="width: 60%">รายละเอียด</th>
                                                    <%--<th>ปีปัจจุบัน</th>--%>
                                                    <th>สถานะ</th>
                                                    <th style="width: 10%"></th>
                                                    <%--<th style="width: 10%"></th>--%>
                                                </tr>
                                            </thead>
                                            <tbody id='TBbodyPATAG_Type'>
                                            </tbody>
                                        </table> 
                                    </div>
                                    <!--- End Col-md-12 --->
                                </div>
                            </div>

                        </div>
                <!--- End Col-md-12 --->
            </div>
        </div>
        </div>

    <%--</div>--%>

    
    <div class="modal fade" id="ModalPAGroup" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-sm" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">กลุ่มข้อมูลอุปกรณ์ </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">รหัสนำหน้า :</label>
                            </div>
                            <div class="col-md-9">
                                <input id="txtGroup_Code" type="text" class="form-control max-wide" autocomplete="off" >
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">รายละเอียด :</label>
                            </div>
                            <div class="col-md-9">
                                <input id="txtGroup_Detail" type="text" class="form-control max-wide" autocomplete="off">
                            </div>
                        </div>
                       <%-- <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">ปีปัจจุบัน :</label>
                            </div>
                            <div class="col-md-9">
                                <input id="txtType_Year" type="text" class="form-control max-wide" autocomplete="off">
                            </div>
                        </div>--%>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">สถานะ :</label>
                            </div>
                            <div class="col-md-9">
                                <select id="txtGroup_Status" class="form-control max-wide">
                                    <option value="Active">Active</option>
                                    <option value="InActive">In Active</option>
                                </select>
                            </div>
                        </div>
                        <input id="txtActionStatus" type="text" class="form-control max-wide" style="display: none;" autocomplete="off">
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                    
                    <button type="button" class="btn btn-warning" id="btnSaveGroup">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Modal PA TYPE--%>

        <script type="text/javascript">

        $(document).ready(function () {

            var TablePATAG_Type = $('#TablePATAG_Type').DataTable({
                searching: true,
                responsive: true
            });
            LoadData();

            $("#btnNewGroup").on("click", function () {
                $("#ModalPAGroup").modal("show");
                $("#txtGroup_Code").attr('disabled', false);
                $("#txtGroup_Code").val('');
                $("#txtGroup_Detail").val('');
                $("#txtGroup_Status").val('Active');
                $("#txtActionStatus").val('');
            });
            
            $(document).on("click", ".btnModalEdit", function () {
                var Group_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                var Group_Detail = $(this).closest("tr").find("td:nth-child(2)").text();
                var Group_Status = $(this).closest("tr").find("td:nth-child(3)").text();
                
                $("#txtGroup_Code").attr('disabled', true);
                $("#txtGroup_Code").val(Group_Code);
                $("#txtGroup_Detail").val(Group_Detail);
                $("#txtGroup_Status").val(Group_Status);
                $("#txtActionStatus").val('Update');
                $("#ModalPAGroup").modal("show");
            });
                
            $(document).on("click", ".btnDelete", function () {
                if (confirm('Confrim Delete?')) {
                    var Group_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                    SaveGroup(Group_Code, '', '', 'Delete');
                }
            });

            $("#btnSaveGroup").on("click", function () {
                var Group_Code = $("#txtGroup_Code").val();
                var Group_Detail = $("#txtGroup_Detail").val();
                var Group_Status = $("#txtGroup_Status").val();
                var ActionStatus = $("#txtActionStatus").val();
                SaveGroup(Group_Code, Group_Detail, Group_Status, ActionStatus);
            });

            function SaveGroup(Group_Code, Group_Detail, Group_Status, ActionStatus) {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Charge_Group") %>",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: JSON.stringify({ Group_Code: Group_Code, Group_Detail: Group_Detail, Group_Status: Group_Status, Status: ActionStatus }),
                     success: function (response) {
                         //SaveChargeDetail(0, Code, Date);
                         LoadData();
                         $("#ModalPAGroup").modal("hide");
                     }
                });
            }

            function LoadData() {
                TablePATAG_Type.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GETPA_TAG_Charge_Group")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var fragment = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Group_Code = val[0];
                                var Group_Detail = val[1];
                                var Group_Status = val[2];
                               //[Group_Code],[Group_Detail],[Group_Status]

                                TablePATAG_Type.row.add([ Group_Code, Group_Detail,Group_Status
                                    , '<button class="btn btn-warning btn-block btnModalEdit" type="button">Edit</button>'
                                    //, '<button class="btn btn-danger btn-block btnDelete" type="button">Delete</button>'
                                ]).draw().node();
                            });
                        }
                    }
                });
            }


        });


        </script>
</asp:Content>
