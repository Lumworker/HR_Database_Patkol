<%@ Page Title="PA Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PATAG_Export.aspx.cs" Inherits="HR_Portal.PATAG_Export" %>

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

        .btn-bigger {
            width: 25rem;
            height: 15rem;
            float: right;
            margin-right: 2rem;
        }

        .text-dowlaod {
            font-size: 20px;
        }

        .btn-dowlaod {
            background-color: #1F7244;
            color: ghostwhite;
            border: none;
        }

            .btn-dowlaod:hover {
                background-color: #006400;
                color: ghostwhite;
            }
    </style>
    <div style="overflow: hidden; width: 0; height: 0;">
    <asp:TextBox runat="server" ID="snsStartDate" />
    <asp:TextBox runat="server" ID="snsEndDate" />
    <asp:TextBox runat="server" ID="snsStatus" />
    <asp:Button runat="server" Class="btn" Text="Charge" ID="aspCharge_onClick" OnClick="exportTableCharge_onClick" />
    <asp:Button runat="server" Class="btn" Text="TAx" ID="aspTax_onClick" OnClick="exportTableTax_onClick" />
    <asp:Button runat="server" Class="btn" Text="Insurance" ID="aspInsurance_onClick" OnClick="exportTableInsurance_onClick" />
    <asp:Button runat="server" Class="btn" Text="MA" ID="aspMA_onClick" OnClick="exportTableMA_onClick" />
    </div>


    <div class="page-header">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                    <span>PATAG Export
                    </span>
                </div>
                <div class="col-md-8 col-xs-8" style="text-align: right">
                </div>
            </div>
        </div>

    </div>
    <!----End Header---->
        <div class="row" style="margin-top: 1rem">
    <div class="col-12">
    <div class="col-md-6 col-xs-12">
            <div class="panel-group">
                <div class="panel panel-default">
                    <%--   <div class="panel-heading">
                <h3 style="margin-left: 5px;">Export</h3>
            </div>--%>
                    <div class="panel-body">
                        <%-- <div class="col-md-6 col-xs-12">
                                <div class="row form-group">
                                    <div class="col-md-12 col-xs-12  date" data-provide="datepicker">
                                        <label class="control-label">StartDate :</label>
                                        <div class="input-group">
                                            <input placeholder="dd/mm/yyyy" id="Export_Start_DATE" type="text" class="form-control notText max-wide" autocomplete="off">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <div class="row form-group">
                                    <div class="col-md-12 col-xs-12  date" data-provide="datepicker">
                                        <label class="control-label">EndDate :</label>
                                        <div class="input-group">
                                            <input placeholder="dd/mm/yyyy" id="Export_End_DATE" type="text" class="form-control notText max-wide" autocomplete="off">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <div class="col-md-8 col-xs-12 form-group">
                                    <label class="control-label">Status :</label>
                                    <select id="PA_TAG_Status" class="form-control max-wide">
                                        <option value="">ALL</option>
                                        <option value="Active">Active</option>
                                        <option value="In Active">InActive</option>
                                    </select>
                                </div>
                                <div class="col-md-12 col-xs-12" style="margin-top: 25px;">
                                    <button id="btnSearchExport" class="btn btn-warning btn-block" type="button" data-toggle="modal" style="float: right">Search <i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

<%--    <div class="col-md-6 col-xs-12">
    </div>--%>
    </div>
    <%--Panel Search End--%>
        <div class="panel-group" id="divDownload" style="display:none;">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <h2 style="margin-left: 5px; margin-bottom: 2rem; font-weight: bold;">Download</h2>
                        <div class="row">

                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <label class="control-label text-dowlaod">Charge :</label>
                                <br />
                                <button type="button" class="btn  btn-lg btn-bigger btn-dowlaod" id="btnExportCharge">Export Excel</button>
                                <button type="button" class="btn btn-info btn-lg btn-bigger btnPreview" data-type="Charge">Preview</button>

                            </div>

                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <label class="control-label text-dowlaod">ภาษี :</label><br />
                                <button type="button" class="btn  btn-lg btn-bigger btn-dowlaod" id="btnExportTax">Export Excel</button>
                                <button type="button" class="btn btn-info btn-lg btn-bigger btnPreview" data-type="Tax">Preview</button>

                            </div>

                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">

                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <label class="control-label text-dowlaod">ประกันภัย & พรบ :</label><br />
                                <button type="button" class="btn  btn-lg btn-bigger btn-dowlaod" id="btnExportInsurance">Export Excel</button>
                                <button type="button" class="btn btn-info btn-lg btn-bigger btnPreview" data-type="Insurance">Preview</button>
                            </div>

                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <label class="control-label text-dowlaod">MA :</label><br />
                                <button type="button" class="btn  btn-lg btn-bigger btn-dowlaod" id="btnExportMA">Export Excel</button>
                                <button type="button" class="btn btn-info btn-lg btn-bigger btnPreview" data-type="MA">Preview</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalID" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center;">
        <div class="modal-dialog modal-lg" style="width: 80%">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <div class="col-md-9 col-lg-9 col-sm-12">
                                <h4 class="modal-title">ตาราง <span id="modaltitle_name"></span></h4>
                            </div>
                            <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; overflow-x: auto; max-height: 32em; max-width: 100%; text-align: center;">
                    <div class="row">
                        <div class='col-md-12 col-sm-12 col-xs-12' style="text-align: center; margin-top: 10px;">

                            <table id="TablePreview" class="table table-hover table-bordered" style="width: 100%">
                                <thead id="theader_Modal">
                                    <tr>
                                        <th>PA_TAG_Code</th>
                                        <th>PA_TAG_Type_Car</th>
                                        <th>PA_TAG_Band</th>
                                        <th>PA_TAG_Model</th>
                                        <th>PA_TAG_CarID</th>
                                        <th>PA_TAG_Company_Location</th>
                                        <th>PA_TAG_Status</th>
                                        <th>PA_TAG_Car_Status</th>
                                        <th>PA_TAG_Start_DATE</th>
                                        <th>PA_TAG_End_DATE</th>
                                        <th>Emp_Num</th>
                                        <th>Fullname</th>
                                        <th>CostCenter</th>
                                        <th>JobTitle</th>
                                        <th>Level</th>
                                        <th>PA_PE_Date</th>
                                        <th>CH_Code</th>
                                        <th>CH_Desc</th>
                                        <th>CH_Value</th>
                                        <th>Detail</th>
                                        <th>EffectDate</th>
                                    </tr>
                                </thead>
                                <tbody id="TBbodyPreview"></tbody>
                            </table>


                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <%--Panel Export End--%>
    <script type="text/javascript">
        //SetDateDefault();
        //SetaspTime();
        //$('#Export_Start_DATE').datepicker({ dateFormat: "dd/mm/yy" });
        //$('#Export_End_DATE').datepicker({ dateFormat: "dd/mm/yy" });

        $("#MainContent_snsStatus").val('');

        $(document).on("click", ".btnPreview", function () {
            var type = $(this).attr("data-type");
            var snsStatus = $("#PA_TAG_Status").val();
            //console.log(type);
            if (type == "Charge") {
                GetPreview('VW_PA_TAG_Report_Charge',snsStatus);
            }
            else if (type == "Tax") {
                GetPreview('VW_PA_TAG_Report_Tax',snsStatus);
            }
            else if (type == "Insurance") {
                GetPreview('VW_PA_TAG_Report_Insurance',snsStatus);
            }
            else if (type == "MA") {
                GetPreview('VW_PA_TAG_Report_MA',snsStatus);
            }
            $("#modaltitle_name").text(type);
            $("#ModalID").modal("show");

        });


        $(document).on("click", "#btnSearchExport", function () {
            $("#divDownload").css("display", "block");
        });

        $(document).on("click", "#btnExportCharge", function () {
            $("#MainContent_aspCharge_onClick").click();
        });


        $(document).on("click", "#btnExportTax", function () {
            $("#MainContent_aspTax_onClick").click();
        });

        $(document).on("click", "#btnExportInsurance", function () {
            $("#MainContent_aspInsurance_onClick").click();
        });

        $(document).on("click", "#btnExportMA", function () {
            $("#MainContent_aspMA_onClick").click();
        });


        $(document).on("change", "#PA_TAG_Status", function () {
            //SetaspTime();
            var PA_TAG_Status = $("#PA_TAG_Status").val();
            console.log("PA_TAG_Status");
            $("#MainContent_snsStatus").val(PA_TAG_Status);
        });

        //function SetaspTime() {

        //    var StartDate = $("#Export_Start_DATE").val();
        //    var EndDate = $("#Export_End_DATE").val();
        //    $("#MainContent_snsStartDate").val(StartDate);
        //    $("#MainContent_snsEndDate").val(EndDate);
        //    //console.log(StartDate + ' ' + EndDate)
        //}

        //function SetDateDefault() {
        //    var date = new Date();
        //    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1).format('dd/MM/yyyy');
        //    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0).format('dd/MM/yyyy');
        //    $("#Export_Start_DATE").val(firstDay);
        //    $("#Export_End_DATE").val(lastDay);
        //}

        function GetPreview(from,snsStatus) {
            var fragment = "";
            var theader_Modal = "<tr>";
            $.ajax({
                type: "POST",
                async: false,
                url: "<%= ResolveUrl("MaintainEmployee.aspx/GetPreviewExcel") %>",//new
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ from: from, snsStatus: snsStatus }),
                success: function (response) {
                    if (response.d.length > 0) {
                        var Header = response.d[0];
                        var item = response.d[1];
                        $.each(Header, function (index, val) {
                            //console.log(val[0]);
                            theader_Modal += '<th>' + val[0] + '</th>';
                        });
                        $.each(item, function (index, val) {
                            //console.log(response.d[1]);
                            fragment += '<tr>';
                            for (i = 0; i < val.length; i++) {
                                fragment += '<td>' + val[i] + '</td>';
                            }
                            fragment += '</tr>';
                        });
                    }
                }
            });
            theader_Modal += "</tr>";
            $("#TBbodyPreview").empty();
            $("#theader_Modal").empty();
            $("#theader_Modal").append(theader_Modal);
            $("#TBbodyPreview").append(fragment);
        }
      

    </script>






</asp:Content>
