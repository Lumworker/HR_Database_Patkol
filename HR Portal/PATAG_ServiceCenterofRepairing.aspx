<%@ Page Title="PATAG CarService Center" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PATAG_ServiceCenterofRepairing.aspx.cs" Inherits="HR_Portal.PA_TAG_ServiceCenterofRepairing" %>
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
                <div class="col-md-7 col-xs-7" style="text-align: left; font-size: 30px;">
                    <span>Maintain PA TAG CarService Center  </span>
                </div>
                <div class="col-md-5 col-xs-5" style="text-align: right">
                    <button id="btnNewService" class="btn btn-success" type="button">New</button>
                </div>
            </div>



    </div>
    <!----End Header---->

        <div class="panel-group">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 style="margin-left: 5px;">CarService Center</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="TablePATAG_Serveice" class="table table-hover table-bordered" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Service Name</th>
                                                    <th style="width: 10%"></th>
                                                </tr>
                                            </thead>
                                            <tbody id='TBbodyPATAG_Serveice'>
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

   

    
    <div class="modal fade" id="ModalPAService" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-sm" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title"><span id="Titletxt"></span>: Service Center </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                        </div>
                    </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">Name :</label>
                            </div>
                            <div class="col-md-9">
                                <input id="NameStatus" type="text" class="form-control max-wide" autocomplete="off" >
                            </div>
                        </div>
                        <input id="txtServiceID" type="text" class="form-control max-wide" style="display:none" autocomplete="off">
                        <input id="txtServiceStatus" type="text" class="form-control max-wide" style="display:none" autocomplete="off">
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="btnSaveService">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Modal PA TYPE--%>

        <script type="text/javascript">

        $(document).ready(function () {

            var TablePATAG_Serveice = $('#TablePATAG_Serveice').DataTable({
                searching: true,
                responsive: true
            });
            LoadData();

            $("#btnNewService").on("click", function () {
                $("#NameStatus").val('');
                $("#txtServiceID").val(0);
                $("#Titletxt").text("New");
                $("#txtServiceStatus").val('Insert');
                $("#ModalPAService").modal("show");
            });
            
            $(document).on("click", ".btnModalEdit", function () {
                var Group_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                var ID = $(this).attr("data-id");
                $("#NameStatus").val(Group_Code);
                $("#txtServiceID").val(ID);
                $("#Titletxt").text("Edit");
                $("#txtServiceStatus").val("Update");
                $("#ModalPAService").modal("show");
            });
                
            //$(document).on("click", ".btnDelete", function () {
            //    if (confirm('Confrim Delete?')) {
            //        var Group_Code = $(this).closest("tr").find("td:nth-child(1)").text();
            //        btnSaveService(Group_Code, '', '', 'Delete');
            //    }
            //});

            $("#btnSaveService").on("click", function () {
                var NameStatus = $("#NameStatus").val();
                var txtServiceID = $("#txtServiceID").val();
                var txtServiceStatus = $("#txtServiceStatus").val();
                btnSaveService(NameStatus, txtServiceID, txtServiceStatus);
            });

           function btnSaveService(NameStatus, txtServiceID, txtServiceStatus) {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_ServiceCenterofRepairing") %>",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: JSON.stringify({  ID: txtServiceID,NameStatus: NameStatus, Status: txtServiceStatus }),
                    success: function (response) {
                          swal("Complete", "บันทึกข้อมูลเสร็จสิ้น", "success")
                         //SaveChargeDetail(0, Code, Date);
                         LoadData();
                         $("#ModalPAService").modal("hide");
                     }
                });
            }

            function LoadData() {
                TablePATAG_Serveice.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GETPA_TAG_ServiceCenterofRepairing")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var fragment = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var NameStatus = val[1];
                               //[Group_Code],[Group_Detail],[Group_Status]

                                TablePATAG_Serveice.row.add([ NameStatus
                                    , '<button class="btn btn-warning btnModalEdit" style="width:100%" type="button" data-id="'+ID+'">Edit</button>']).draw().node();
                            });
                        }
                    }
                });
            }


        });


        </script>


</asp:Content>
