<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportBCP.aspx.cs" Inherits="HR_Portal.ExportBCP" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv='cache-control' content='no-cache'>
    <meta http-equiv='expires' content='0'>
    <meta http-equiv='pragma' content='no-cache'>
    <title><%: Page.Title %></title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/jquery-ui.css" rel="stylesheet" />
    <link href="Content/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="Content/responsive.bootstrap.min.css" rel="stylesheet" />
    <link href="Content/morris.css" rel="stylesheet" />
    <link href="Content/jquery.auto-complete.css" rel="stylesheet" />
    <link href="Content/sideNav.css" rel="stylesheet" />
    <link href="Content/forntawesome/fontawesom-all.min.css" rel="stylesheet" />
    <link href="Content/smart_wizard.min.css" rel="stylesheet" />
    <link href="Content/smart_wizard_theme_arrows.min.css" rel="stylesheet" />
    <link href="Content/smart_wizard_theme_circles.min.css" rel="stylesheet" />
    <link href="Content/smart_wizard_theme_dots.min.css" rel="stylesheet" />
    <link href="Content/basic.min.css" rel="stylesheet" />
    <link href="Content/dropzone.min.css" rel="stylesheet" />
    <webopt:BundleReference runat="server" Path="~/Content/css" />

</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <script src="Scripts/jquery-ui.js"></script>
        <script src="Scripts/raphael.min.js"></script>
        <script src="Scripts/jquery.flot.js"></script>
        <script src="Scripts/jquery.flot.pie.js"></script>
        <script src="Scripts/jquery.flot.resize.js"></script>
        <script src="Scripts/morris.js"></script>
        <script src="Scripts/multiple-emails.js"></script>
        <script src="Scripts/datatables.min.js"></script>
        <script src="Scripts/dataTables.bootstrap.js"></script>
        <script src="Scripts/dataTables.responsive.min.js"></script>
        <script src="Scripts/Blob.min.js"></script>
        <script src="Scripts/xlsx.core.min.js"></script>
        <script src="Scripts/FileSaver.min.js"></script>
        <script src="Scripts/tableexport.min.js"></script>
        <script src="Scripts/jquery.smartWizard.min.js"></script>
        <script src="Scripts/dropzone.min.js"></script>
        <script src="Scripts/sweetalert.min.js"></script>
        <script src="Scripts/Currency.js"></script>


        <style>
            .ui-autocomplete {
                z-index: 999999;
                max-height: 200px;
                overflow-y: auto; /* prevent horizontal scrollbar */
                overflow-x: hidden; /* add padding to account for vertical scrollbar */
                padding-right: 20px;
            }

            .radio-group label {
                overflow: hidden;
            }

            .radio-group input {
                height: 1px;
                width: 1px;
                position: absolute;
                top: -20px;
            }


            .radio-group .not-active {
                color: #3276b1;
                background-color: #fff;
            }

            .dropdown-menu {
                -webkit-transition: all .5s ease-out;
                transition: all .5s ease-out;
                transform: rotateX(90deg);
                transform-origin: top;
                opacity: 0;
                display: block;
                border: none;
                margin-left: 5rem;
            }

            .open .dropdown-menu {
                opacity: 1;
                transform: rotateX(0deg);
                transform-origin: top;
                border: none;
                /*position: relative;*/
                background-color: #bfbfbf;
            }
        </style>

        <div class="container body-content">

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


            <div style="overflow: hidden; width: 0; height: 0;">
                <asp:TextBox runat="server" ID="snstextExport_BUGroup" />
                <asp:TextBox runat="server" ID="snstextExport_Status" />
                <asp:TextBox runat="server" ID="snstextExport_BCP" />
                <asp:TextBox runat="server" ID="snstextExport_Type" />
                <%--End C# Export Excel List BCP--%>
            </div>


            <div class="page-header">
                <h2>Export BCP</h2>
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

                        <div class="panel-body">
                            <!--panel-default-->
                            <div class="panel">
                                <div class="panel-heading">
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div id="smartwizard">
                                                    <ul>
                                                        <li class="check" data-step="Step1"><a href="#step-1">Select BMC</a></li>
                                                        <li class="check" data-step="Step2"><a href="#step-2">Export Excel</a></li>
                                                    </ul>
                                                    <div class="row">
                                                        <div id="step-1" class="">
                                                            <div class="panel-group">
                                                                <div class="panel panel-default" style="margin-top: 1em;">
                                                                    <div class="panel-heading">
                                                                        <h4>Select BMC</h4>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="form-group">
                                                                            <div class="col-md-12 col-sm-12">
                                                                                <div class="row">
                                                                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                                                        <asp:Label class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="BU Group"></asp:Label>
                                                                                        <div class="col-md-9 col-xs-12">
                                                                                            <div class="input-group">
                                                                                                <div class="input-group-btn">
                                                                                                    <div class="input-group">
                                                                                                        <input id="textExport_BUGroup" type="text" class="form-control max-wide" disabled>
                                                                                                        <div class="input-group-btn">
                                                                                                            <button class="btn btn-default Browse_modal" data-type="Export_BUGroup" data-row_no="0" type="button">
                                                                                                                <i class="glyphicon glyphicon-search"></i>
                                                                                                            </button>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                                                        <asp:Label class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Status"></asp:Label>
                                                                                        <div class="col-md-9 col-xs-12">
                                                                                            <%--<div class="input-group">--%>
                                                                                            <select class="form-control max-wide" id="textExport_Status">
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
                                                                                            <select class="form-control max-wide" id="textExport_BCP">
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                                                                        <asp:Label class="col-md-3 col-xs-12" runat="server" Font-Bold="True" Text="Type"></asp:Label>
                                                                                        <div class="col-md-9 col-xs-12">
                                                                                            <%--<div class="input-group">--%>
                                                                                            <select class="form-control max-wide" id="textExport_Type">
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!--END Row-->
                                                                                <div style="text-align: right">
                                                                                    <button id="nextPage2" class="btn btn-warning Pos_Worker" type="button" data-toggle="modal">Next</button>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <%--End panel-body--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--======End Step 3.1======--%>
                                                        <div id="step-2" class="">
                                                            <div class="panel-group">
                                                                <div class="panel panel-default" style="margin-top: 1em;">
                                                                    <div class="panel-heading">
                                                                        <h4>Export Excel</h4>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div style="max-width: 100%;">
                                                                            <div class="col-md-2 ">
                                                                            </div>
                                                                            <div class="col-md-8 col-sm-8">
                                                                                <div class="row">

                                                                                    <div style="text-align: center;">
                                                                                        <asp:Button runat="server" class="btn btn-block btn-Excel-dowlaod" Style="min-width: 100%; height: 80px; font-weight: bold; font-size: 24px;" Text="Export" ID="Button4" OnClick="Export_ListBCP" UseSubmitBehavior="false" />
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-2 ">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--======End Step 3.2 ======--%>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab 3====================-->
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


            <script type="text/javascript">

                $(document).ready(function () {
                    GetBCPGroup()
                    GetBCPType()
                    $(document).on("click", ".Browse_modal", function () {
                        var fragment = '';
                        var fragmentHeader = '';
                        var Type = $(this).attr("data-type");
                        $("#Titlebrowse").text(Type);
                        $("#TBbodyBrowse").empty();
                        $("#TBheaderBrowse").empty();
                        $("#search_box").empty();
                        $("#search_box").append('<input type="text" id="search_' + Type + '" placeholder="Search.." class="form-control max-wide" autocomplete="off">');

                        if (Type == 'Export_BUGroup') {
                            GET_SearchBUGroup_Export('');
                        }//End  

                        $("#TBheaderBrowse").append(fragmentHeader);
                        $("#TBbodyBrowse").append(fragment);
                        $("#modalBrowseSearch").modal("show");
                    });

                    $('#smartwizard').smartWizard({
                        theme: 'arrows',
                        keyNavigation: false,
                        showStepURLhash: false,
                        selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                        transitionEffect: 'slide',
                        toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
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

                    $(document).on("click", ".clickselecttext_Export_BUGroup", function () {
                        var tr = $(this).closest("tr");
                        var Group = tr.find("td:nth-child(1)").text();
                        var Desc = tr.find("td:nth-child(2)").text();
                        $("#textExport_BUGroup").val(Group);
                        $("#modalBrowseSearch").modal("hide");
                    });
                    //END Function BrowseClick

                    $(document).on("change", "#search_Export_BUGroup", function () {
                        $("#TBheaderBrowse").empty();
                        $("#TBbodyBrowse").empty();
                        var search = $(this).val();
                        GET_SearchBUGroup_Export(search);
                        $("#modalBrowseSearch").modal("show");
                    });
                    //END Onchange

                    function GET_SearchBUGroup_Export(search) {
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
                                        fragment += '<td><a class="clickselecttext_Export_BUGroup" href="javascript:void(0)" >' + Group + '</a></td>';
                                        fragment += '<td><a class="clickselecttext_Export_BUGroup" href="javascript:void(0)" >' + Desc + '</a></td>';
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
                                $("#textExport_BCP").append(BCP);
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
                                $("#textExport_Type").append(BCPType);
                            }
                        }
                    });
                }

            </script>
            <hr />
            <footer>
                <p>
                    &copy; <%: DateTime.Now.Year %> - Maintain BCP
                </p>
            </footer>
        </div>



        <script type="text/javascript">

            $(document).ready(function () {

            });
            
            function openNav() {
                document.getElementById("mySidenav").style.width = "300px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }

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

        </script>
    </form>
</body>
</html>
