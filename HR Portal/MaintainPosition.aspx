<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MaintainPosition.aspx.cs" Inherits="HR_Portal.MaintainPosition" %>

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

        .panel-default > .panel-heading {
            background-color: white;
        }
    </style>
    <div class="page-header">
        <h2>Maintain Position</h2>

    </div>

    <!----End Header---->


    <%--Start New Position Modal--%>
    <div class="modal fade" id="modalPosition" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">New Position</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">

                            <input id="Position_Id" type="hidden" class="form-control max-wide" disabled>
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Position ID:</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input id="Position" type="text" class="form-control max-wide" >
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Position --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Job Title :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input type="text" id="JobTitle" class="form-control max-wide"  />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Job Title --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Job Title EN:</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input type="text" id="JobTitleEN" class="form-control max-wide"  />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Job Title EN --%>
                </div>
                <%--End modal body--%>
                <div class="modal-footer" id="PositionModalfooter">
                    <button type="button" class="btn btn-success" id="PositionSave" >Save</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%-- End Position Modal--%>

    <%--Start Edit Position Modal--%>
    <div class="modal fade" id="modalEditPosition" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Edit Position</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">

                          
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Position ID:</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input id="ePosition" type="text" class="form-control max-wide" disabled>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Position --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Job Title :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input type="text" id="eJobTitle" class="form-control max-wide"  />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Job Title --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Job Title EN:</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input type="text" id="eJobTitleEN" class="form-control max-wide"  />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Job Title EN --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Job Title EN:</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <select id="eStatus" class="form-control max-wide">
                                                <option>Active</option>
                                                <option>InActive</option>
                                            </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Status --%>
                </div>
                <%--End modal body--%>
                <div class="modal-footer" id="ePositionModalfooter">
                    <button type="button" class="btn btn-success" id="ePositionSave" >Save</button>
                    <button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%-- End Edit Position Modal--%>

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


    <%--========Start Tab Rate===========--%>
    <div class="panel-body">
        <div class="table-responsive">
            <div class="row">
                <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                </div>
                <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                    <button class="btn btn-info" type="button" id="btnModalNew" data-toggle="modal" style="margin-bottom: 5px;">New </button>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <table id="TablePosition" class="table" style="width: 100%">
                        <thead>
                            <tr>
                                <%--<th>ID</th>--%>
                                <th>Position</th>
                                <th>Job Title</th>
                                <th>Job Title EN</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id='TBbodyPosition'>
                        </tbody>
                    </table>
                </div>
                <!--- End Col-md-12 --->
            </div>
        </div>
    </div>
    <!--================End Tab Rate=====================-->

    <script type="text/javascript">
        $(document).ready(function () {

            var TablePosition = $('#TablePosition').DataTable({
                searching: true,
                responsive: true
            });
             
            sessionStorage.setItem('Page_type', 'Position');
            LoadData();

            $("#btnModalNew").on("click", function () {
                    
                //Console("WO");
                $("#Position").val("");
                $("#JobTitle").val("");
                $("#JobTitleEN").val("");
                $("#modalPosition").modal("show");

            });

             $(document).on("click", "#PositionSave", function () {
                var Position = $("#Position").val();
                 var JobTitle = $("#JobTitle").val();
                 var JobTitleEN = $("#JobTitleEN").val();

                if (Position == "") {
                    alert("Please fill Position")
                } else if (JobTitle == "") {
                    alert("Please fill Job Title")
                } else if (JobTitleEN == "") {
                    alert("Please fill Job Title EN")
                } else { $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainPosition.aspx/SavePosition")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            Position: Position,
                            JobTitle: JobTitle,
                            JobTitleEN: JobTitleEN,
                            Status: "Active",
                            Action: "Insert"
                        }),
                    success: function (response) {
                        if (response.d == "Save Complete") {
                            $("#modalPosition").modal("hide");
                            LoadData();
                            alert(response.d);
                        } else {
                            alert(response.d);
                        }
                            
                        }
                });//End ajax
                }
            });

            $(document).on("click", "#ePositionSave", function () {
                var Position = $("#ePosition").val();
                var JobTitle = $("#eJobTitle").val();
                var JobTitleEN = $("#eJobTitleEN").val();
                var Status = $("#eStatus").val();

                if (Position == "") {
                    alert("Please fill Position")
                } else if (JobTitle == "") {
                    alert("Please fill Job Title")
                } else if (JobTitleEN == "") {
                    alert("Please fill Job Title EN")
                }
                else {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainPosition.aspx/SavePosition")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            Position: Position,
                            JobTitle: JobTitle,
                            JobTitleEN: JobTitleEN,
                            Status: Status,
                            Action: "Update"
                        }),
                        success: function (response) {
                            if (response.d == "Save Complete") {
                            $("#modalEditPosition").modal("hide");
                            LoadData();
                            alert(response.d);
                            } else {
                                alert(response.d);
                            }
                            
                        }
                    });//End ajax
                }
            });

            $('#Effect_Data').datepicker({ dateFormat: "dd/mm/yy" });

            function LoadData() {
                TablePosition.clear().draw();
                var type = "Rate";
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainPosition.aspx/LoadDataPosition")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var fragment = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var Postion = val[0];
                                var JobTitle = val[1];
                                var JobTitleEN = val[2];
                                var Status = val[3];

                                TablePosition.row.add([ Postion, JobTitle, JobTitleEN,Status//]).draw().node();
                                    , '<button class="btn btn-warning btnModalEditPosition" data-Position="' + Postion + '" data-JobTitle="' + JobTitle + '" data-JobTitleEN="' + JobTitleEN + '" data-Status="' + Status + '" type="button">Edit</button>']).draw().node();
                            });
                        }
                    }
                });
            }

            $(document).on("click", ".btnModalEditPosition", function () {
                //var tr = $(this).closest("tr");
                //var ID = tr.find("td:nth-child(1)").text();
                
                
                var Postion = $(this).attr("data-Position");
                var JobTitle = $(this).attr("data-JobTitle");
                var JobTitleEN = $(this).attr("data-JobTitleEN");
                var Status = $(this).attr("data-Status");
                console.log(Postion);
                $("#ePosition").val(Postion);
                $("#eJobTitle").val(JobTitle);
                $("#eJobTitleEN").val(JobTitleEN);
                $("#eStatus").val(Status);
                //$("#ZoneBrowsefooter").empty();
                //var button = ' <button type="button" class="btn btn-warning " id="ZoneEdit" >Save</button>';
                //button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                //$("#ZoneBrowsefooter").append(button);
                $("#modalEditPosition").modal("show");
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
                        data: JSON.stringify({ user : user, page : 'Position' }),
                        success: function (response) {
                            if (response.d.length > 0 && response.d[0][4] == 'True') {
                                $('.btnModalEditPosition').prop('disabled', false);
                                $('#btnModalNew').prop('disabled', false);
                                //swal('Complete', 'Complete Permission', 'success');
                            } else {
                                $('.btnModalEditPosition').prop('disabled', true);
                                $('#btnModalNew').prop('disabled', true);
                                swal('Error', 'No Permission', 'error',).then( function() {
                                    window.location = "http://portalapp01/PersonalWorkspace/";
                                });
                            }
                        }
                    });
                }
            });
            //---------END Check user's permission----------
        });
    </script>



</asp:Content>
