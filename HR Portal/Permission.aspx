<%@ Page Title="HR Permission" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Permission.aspx.cs" Inherits="HR_Portal.Permission" %>
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
        <h2>Permission</h2>
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
                        <table id="TablePermission" class="table" style="width: 100%">
                            <thead>
                                <tr>
                                    <%--<th style="display:none;">ID</th>--%>
                                    <th>Users</th>
                                    <th>Page</th>
                                    <th>Viewer</th>
                                    <th>Editor</th>
                                    <th style="width:50px"></th>
                                    <th style="width:50px"></th>
                                </tr>
                            </thead>
                            <tbody id='TBbodyBenefits' >
                            </tbody>
                        </table>
                    </div>
                    <!--- End Col-md-12 --->
                </div>
            </div>
        </div>
    </div>
    <%--Start New Permission Modal--%>
    <div class="modal fade" id="modalPermission" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">New Permission</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12" >
                            <input id="PermissionID" type="hidden" class="form-control max-wide" disabled>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <label class="control-label" style="font-size: 13px">User :</label>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">
                                    <div class="input-group">
                                        <input id="username" type="text" class="form-control max-wide" disabled>
                                        <div class="input-group-btn">
                                            <button class="btn btn-default Browse_modal" type="button" data-type="username">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <%--<input id="username" type="text" class="form-control max-wide" >--%>
                                </div>
                            </div>
                    </div>
                        <%--End ZoneID --%>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <label class="control-label" style="font-size: 13px">Page :</label>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">
                                    <%--<div class="input-group">
                                        <input type="text" id="Country" class="form-control max-wide" disabled />
                                        <div class="input-group-btn">
                                            <button class="btn btn-default Browse_modal" type="button" data-type="page">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </div>
                                    </div>--%>
                                    <select class="form-control max-wide" id="Per_Page">
                                        <option value="">======Please Select======</option>
                                        <option value="Employee">Maintain Employee</option>
                                        <option value="Benefits">Maintain Benefits</option>
                                        <option value="E-Regular">Maintain E-Regular</option>
                                        <option value="Leave">Maintain Leave</option>
                                        <option value="Pyramid">Pyramid</option>
                                        <option value="IT">Maintain IT</option>
                                        <option value="Draft">Maintain Draft Employee</option>
                                        <option value="PATAG">Maintain PATAG</option>
                                        <option value="BCP">Maintain BCP</option>
                                        <option value="Position">Maintain Position</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    <%--End Country --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Permisson :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div style="padding-right:5px">
                                    <input type="checkbox" id="viewer" />
                                    <label class="control-label" style="font-size: 13px">Viewer</label>
                                </div>
                                <div style="padding-right:5px">
                                    <input type="checkbox" id="editor" />
                                    <label class="control-label" style="font-size: 13px">Editor</label>
                                </div>
                            </div>

                        </div>
                    </div>
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

            sessionStorage.setItem('Page_type', 'Permission');
            
            var TablePermission = $('#TablePermission').DataTable({
                    searching: true,
                    responsive: true,
                    "order": []
                });
            LoadData();

            $("#btnModalNew").on("click", function () {
                $("#PermissionID").val("");
                $("#username").val("");
                $("#Per_Page").val("");
                $("#viewer").prop('checked', false);
                $("#editor").prop('checked', false);
                $("#Browsefooter").empty();
                var button = ' <button type="button" class="btn btn-success" id="PermissionSave" >Save</button>';
                button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                $("#Browsefooter").append(button);
                $("#modalPermission").modal("show");
            });

            $(document).on("click", ".btnModalEdit", function () {
                var tr = $(this).closest("tr");
                //var ID = tr.find("td:nth-child(1)").text();
                var ID = $(this).attr("data-id");
                var username = tr.find("td:nth-child(1)").text();
                var page = tr.find("td:nth-child(2)").text();
                var viewer = tr.find("td:nth-child(3) span").attr("data-type");
                var editor = tr.find("td:nth-child(4) span").attr("data-type");
                $("#PermissionID").val(ID);
                $("#username").val(username);
                $("#Per_Page").val(page);
                $("#viewer").prop('checked', (viewer == 'True' ? true : false));
                $("#editor").prop('checked', (editor == 'True' ? true : false));
                $("#Browsefooter").empty();
                var button = ' <button type="button" class="btn btn-warning " id="PermissionEdit" >Save</button>';
                button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                $("#Browsefooter").append(button);
                $("#modalPermission").modal("show");
            });

            

            $(document).on("click", "#PermissionSave", function () {
                var username = $("#username").val();
                var Per_Page = $("#Per_Page").val();
                var viewer = $("#viewer").is(':checked') ? 1 : 0;
                var editor = $("#editor").is(':checked')? 1 : 0 ;
                
                if (username != "" && Per_Page != "" && (viewer != "" || editor != "") ) {
                    //alert(ZoneID + "\n" + Country + "\n" + Allowance + "\n" + Accomodation + "\n" + Currency + "\n"+Effect_Data + "\n"+EmpLevel)
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Permission")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: 0,
                            username: username,
                            Per_Page: Per_Page,
                            viewer : viewer,
                            editor: editor,
                            Action: "Insert"
                        }),
                        success: function (response) {
                            alert("Insert Complete!");
                            $("#modalPermission").modal("hide");
                            LoadData();
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });

            $(document).on("click", "#PermissionEdit", function () {
                var ID = $("#PermissionID").val();
                var username = $("#username").val();
                var Per_Page = $("#Per_Page").val();
                var viewer = $("#viewer").is(':checked') ? 1 : 0;
                var editor = $("#editor").is(':checked')? 1 : 0 ;
                
                if (username != "" && Per_Page != "" && (viewer != "" || editor != "") ) {
                    //alert(ZoneID + "\n" + Country + "\n" + Allowance + "\n" + Accomodation + "\n" + Currency + "\n"+Effect_Data + "\n"+EmpLevel)
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Permission")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID,
                            username: username,
                            Per_Page: Per_Page,
                            viewer : viewer,
                            editor: editor,
                            Action: "Update"
                        }),
                        success: function (response) {
                            alert("Update Complete!");
                            $("#modalPermission").modal("hide");
                            LoadData();
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });

            $(document).on("click", ".PermissionDelete", function () {
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
                            $("#modalPermission").modal("hide");
                            LoadData();
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });

            //$('#Effect_Data').datepicker({ dateFormat: "dd/mm/yy" });
            //Start Browse Modal
            $(".Browse_modal").on("click", function () {
                $("#search_username").val("");
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
                if (browse_type == 'username') {
                    $("#browseHeader").text('Username');
                    $('#SearchBrowse').attr("id", 'search_username');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUsername") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var num = val[0];
                                    var username = val[1];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + num + '</a></td>';
                                    fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + username + '</a></td>';
                                    fragment += '</tr>';
                                });

                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
            });

            $(document).on("change", "#search_username", function() {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUsername")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var num = val[0];
                                var username = val[1];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + num + '</a></td>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + username + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });

            //-------select username------
            $(document).on("click", ".clickselectusername", function () {
                var username = $(this).closest("tr").find("td:nth-child(2)").text();
                $('#search_zoneid').attr("id", 'SearchBrowse');
                $("#SearchBrowse").val("");
                $("#username").val(username);
                $("#modalBrowse").modal("hide");
            });

            //$('#editor').on('change', function () {
            //    if ($('#editor').is(':checked')) {
            //        $('#viewer').prop('checked', true);
            //    }
            //});

            function LoadData() {
                TablePermission.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetPermission")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ user: '', page:'' }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var username = val[1];
                                var page = val[2];
                                var viewer = val[3]=="True"? '<span class="glyphicon glyphicon-ok" aria-hidden="true" data-type="True"></span>' : '<span class="glyphicon glyphicon-remove" aria-hidden="true" data-type="False"></span>';
                                var editor = val[4]=="True"? '<span class="glyphicon glyphicon-ok" aria-hidden="true" data-type="True"></span>' : '<span class="glyphicon glyphicon-remove" aria-hidden="true" data-type="False"></span>';

                                TablePermission.row.add([ username, page, viewer,editor
                                    , '<button class="btn btn-warning btnModalEdit" data-id="'+ID+'" type="button">Edit</button>'
                                    , '<button class="btn btn-danger PermissionDelete" data-id="'+ID+'" type="button">Delete</button>']).draw().node();
                            });
                        }
                    }
                });
            }
        });//end Document Ready
       
    </script>
</asp:Content>
