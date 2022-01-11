<%@ Page Title="PATAG Charge" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PATAG_Charge.aspx.cs" Inherits="HR_Portal.PATAG_Charge1" %>
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
                    <span>Maintain PA TAG Charge  </span>
                </div>

                <div class="col-md-8 col-xs-8" style="text-align: right">
                    <button id="btnNewCharge" class="btn btn-success" type="button">New</button>
                </div>
            </div>


    </div>
    <!----End Header---->

        <div class="panel-group">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 style="margin-left: 5px;">PA Charge</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <table id="TablePATAG_Charge" class="table table-hover table-bordered" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th>Code</th>
                                                <th style="width: 60%">Detail</th>
                                                <th style="width: 10%"></th>
                                                <th style="width: 10%"></th>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyPATAG_Charge'>
                                            <tr>
                                                <td>CH1</td>
                                                <td>ขนาดเครื่องยนต์ 2.0 ขึ้นไป</td>
                                                <td>
                                                    <button class="btn btn-info btnChargeDetail" type="button">Charge</button></td>
                                                <td>
                                                    <button class="btn btn-warning btnEditCharge" type="button">Edit</button></td>
                                            </tr>
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

     <div class="modal fade" id="ModalChargeDetail" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-sm" style="width: 70%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">ChargeDetail (<span id="TitleModdalDetail"></span>) </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">

                    <div class="panel-group">
                        <div class="col-md-12 ">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-4 col-xs-4" style="text-align: left;">
                                                <h4 style="font-weight: bold;">Charge</h4>
                                            </div>
                                            <div class="col-md-8 col-xs-8" style="text-align: right">
                                                <button id="btnAddChargeDetail" class="btn btn-success" type="button"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-12  form-group">
                                            <input type="text" class="form-control max-wide" id="ChargeDetail_Code" autocomplete="off" style="display:none">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered" id="tableSpaicalChecklist">
                                                    <thead>
                                                        <tr>
                                                            <th>Charge Detail</th>
                                                            <th>Charge value</th>
                                                            <th>Effective Date</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="ListChargeUpdate">
                                                    </tbody>
                                                    <tbody id="ListChargeNew">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-success" id="btnSaveChargeDetail">Save</button>--%>
                </div>
            </div>
        </div>
    </div>
    <%--Modal Easy Pass--%>


    <div class="modal fade" id="ModalNewPAChargeDetail" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px; z-index:">
        <div class="modal-dialog modal-sm" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title"><span id="TitleModdlaChargeDetail"></span>: PA Charge Detail </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">

                    <div class="panel-group">
                        <div class="col-md-">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">ข้อมูล</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">Charge Detail :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="txtCH_Detail" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">Charge value :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="txtCH_Value" type="text"  pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" data-type="currency"  class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">Charge Date :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input type="text"  id="txtCharge_Date" class="form-control max-wide " autocomplete="off">
                                            </div>
                                        </div>

                                        <input id="PAChargeDetailID" type="text" class="form-control max-wide" autocomplete="off" style="display:none">
                                        <input id="PAChargeDetailCODE" type="text" class="form-control max-wide" autocomplete="off" style="display:none">
                                        <%--<input id="PAChargeDetailID" type="text" class="form-control max-wide" autocomplete="off" style="display:none">--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                    
                    <button type="button" class="btn btn-warning" id="btnSavePAChargeDetail">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Modal New Group--%>

    <div class="modal fade" id="ModalNewPACharge" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-sm" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title"><span id="TitleModdla"></span>: PA Charge </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">

                    <div class="panel-group">
                        <div class="col-md-">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">ข้อมูล</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">Code :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="txtCharge_Code" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">Detail :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="txtCharge_Detail" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>

                                        <input id="PACharge_ModlaType" type="text" class="form-control max-wide" autocomplete="off" style="display:none">
                                        <%--<input id="PACharge_ModlaType" type="text" class="form-control max-wide" autocomplete="off" style="display:none">--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="btnSavePACharge">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Modal New Group--%>

   
    

    





    <script type="text/javascript">

        $(document).ready(function () {
            $('#txtCharge_Date').datepicker({ dateFormat: "dd/mm/yy" });
            var TablePATAG_Charge = $('#TablePATAG_Charge').DataTable({
                searching: true,
                responsive: true
            });
            SetinputCurrency();
            LoadDataPATAG();
             $('.txtCharge_Date').datepicker({ dateFormat: "dd/mm/yy" });

            $("#btnNewCharge").on("click", function () {
                $("#txtCharge_Code").attr('disabled', false);
                $("#txtCharge_Code").val("");
                $("#txtCharge_Detail").val("");
                $("#TitleModdla").text("New");
                $("#PACharge_ModlaType").val("Insert");
                $("#ModalNewPACharge").modal("show");
            });

            $(document).on("click", ".btnEditCharge", function () {
                var CH_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                var Detail = $(this).closest("tr").find("td:nth-child(2)").text();
                $("#txtCharge_Code").attr('disabled', true);
                $("#txtCharge_Code").val(CH_Code);
                $("#txtCharge_Detail").val(Detail);
                $("#TitleModdla").text("Edit");
                $("#PACharge_ModlaType").val("Update");
                $("#ModalNewPACharge").modal("show");
            });

            $(document).on("click", "#btnAddChargeDetail", function () {
                $("#txtCH_Detail").attr('disabled', false);
                $("#txtCH_Detail").val('');
                $("#txtCH_Value").val('');
                $("#txtCharge_Date").val('');
                $("#PAChargeDetailCODE").val('');
                $("#TitleModdlaChargeDetail").text("New");
                $("#PAChargeDetailID").val(0);
                $("#ModalNewPAChargeDetail").modal("show");
            });
            $(document).on("click", ".btnEditChargeDetail", function () {
                var CODE = $(this).attr("data-CODE");
                var ID = $(this).attr("data-ID");
                var CH_Value = $(this).attr("data-CH_Value");
                var CH_desc =$(this).attr("data-CH_desc");
                var EffectDate = $(this).attr("data-EffectDate");

                $("#txtCH_Detail").attr('disabled', true);
                $("#txtCH_Detail").val(CH_desc);
                $("#txtCH_Value").val(CH_Value);
                $("#txtCharge_Date").val(EffectDate);
                $("#PAChargeDetailCODE").val(CODE);
                $("#TitleModdlaChargeDetail").text("Edit");
                $("#PAChargeDetailID").val(ID);
                $("#ModalNewPAChargeDetail").modal("show");
            });
            
            $(document).on("click", ".btnChargeDetail", function () {
                var CH_Code = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#ChargeDetail_Code").val(CH_Code);
                $("#ListChargeUpdate ").empty();
                $("#ListChargeNew ").empty();
                LoadDataPATAGDetail(CH_Code)
                $("#TitleModdalDetail").text(CH_Code);
                $("#ModalChargeDetail").modal("show");
            });

            $(document).on("click", ".btnDelete", function () {
                var ID = $(this).attr("data-id");
                var code = $(this).attr("data-code");
                if (confirm('Confrim Delete?')) {
                    console.log(ID);
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Charge_Detail") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, CH_Code: '-999', CH_Desc: '', CH_Value: 0, EffectDate: '' }),
                        success: function (response) {
                            LoadDataPATAGDetail(code);
                        }
                    });
                }
            });

            $("#btnSavePACharge").on("click", function () {
                var Code = $("#txtCharge_Code").val();
                var Detail = $("#txtCharge_Detail").val();
                var Status = $("#PACharge_ModlaType").val();
                console.log(Code);
                console.log(Detail);
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Charge") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ CH_Code: Code, Detail: Detail, Status: Status }),
                    success: function (response) {
                        //SaveChargeDetail(0, Code, Date);
                        LoadDataPATAG();
                        $("#ModalNewPACharge").modal("hide");
                    }
                });
            });

            $("#btnSavePAChargeDetail").on("click", function () {
                    //var CH_Code = $("#PAChargeDetailCODE").val(CODE);
                    var ID =  $("#PAChargeDetailID").val();
                    var CH_Code = $("#ChargeDetail_Code").val();
                    var CH_Desc = $("#txtCH_Detail").val();
                    var CH_Value = $("#txtCH_Value").val();
                    var CH_Value = removeCurrency(CH_Value)
                    var EffectDate = $("#txtCharge_Date").val();
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Charge_Detail") %>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: ID, CH_Code: CH_Code, CH_Desc: CH_Desc, CH_Value: CH_Value, EffectDate: EffectDate }),
                            success: function (response) {
                                LoadDataPATAGDetail(CH_Code);
                                $("#ModalNewPAChargeDetail").modal("hide");

                            }
                        });
    
                //Add PATAG Detail
            });

            $(document).on("click", "#btnChargeAddLine", function () {
                var fragment = '';
                fragment += '<tr>';
                fragment += '<td class="center">';
                fragment += '<input type="text" class="form-control max-wide" placeholder="Charge" autocomplete="off">';
                fragment += '</td>';
                fragment += '<td class="center">';
                fragment += '<input type="text" class="form-control max-wide" placeholder="Charge" autocomplete="off">';
                fragment += '</td>';
                fragment += '<td class="center" data-provide="datepicker">';
                fragment += '<input type="text" class="form-control max-wide" autocomplete="off">';
                fragment += '</td>';
                fragment += '</tr>';
                $('#ListChargeNew').append(fragment);
            });

            
            function LoadDataPATAG() {
                TablePATAG_Charge.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/GETPA_TAG_Charge")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[CH_Code],[Detail] 
                                var CH_Code = val[0];
                                var Detail = val[1];
                                var charge = '<button class="btn btn-info btn-block btnChargeDetail" type="button">Charge</button>';
                                var Edit = '<button class="btn btn-block btn-warning btnEditCharge"  type="button">Edit</button>';
                                 TablePATAG_Charge.row.add([ CH_Code,Detail,charge,Edit]).draw().node();
                            });
                        }
                    }
                });
            }

            function LoadDataPATAGDetail(CH_CODE) {
                var fragment = '';
                $("#ListChargeUpdate").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/GETPA_TAG_Charge_Detail")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ CH_CODE: CH_CODE }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                //[ID],[CH_Desc],[CH_Value],[EffectDate],[CH_Code]
                                var ID = val[0];
                                var CH_desc = val[1];
                                var CH_Value = val[2];
                                var EffectDate = val[3];
                                var code = val[4];
                                fragment += '<tr>';
                                fragment += '<td class="center" data-id="'+ID+'">';
                                fragment += '<input type="text" value="'+CH_desc+'" class="form-control max-wide"  autocomplete="off" disabled >';
                                fragment += '</td>';
                                fragment += '<td class="center">';
                                fragment += '<input type="text" value="'+Currency(CH_Value)+'" class="form-control max-wide"  autocomplete="off" disabled>';
                                fragment += '</td>';
                                fragment += '<td class="center" data-provide="datepicker">';
                                fragment += '<input type="text" value="'+EffectDate+'" class="form-control max-wide" autocomplete="off"  disabled> ';
                                fragment += '</td>';
                                fragment += '<td class="center" >';
                                fragment += '<button class="btn btn-warning  btnEditChargeDetail" data-code="'+code+'" data-id="'+ID+'" data-CH_desc="'+CH_desc+'" data-CH_Value="'+CH_Value+'" data-EffectDate="'+EffectDate+'"  type="button">Edit</button>';
                                fragment += '</td>';
                                fragment += '<td class="center" >';
                                fragment += '<button class="btn btn-danger btnDelete" data-id="'+ID+'" data-code="'+code+'"  type="button">Delete</button>';
                                fragment += '</td>';
                                fragment += '</tr>';
                            });
                        }
                        $("#ListChargeUpdate").append(fragment);
                    }
                });
            }

          
        });

        function Currency(CH_Value) {
            var value = CH_Value.replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
            return value;
        }
          function removeCurrency(text) {
            return text.replace(/,/g, '');
        }

        function removewhitespace(text) {
            return text.replace(/ /g, '');
        }
        function SetinputCurrency() {
            $("input[data-type='currency']").on({
                keyup: function () {
                    formatCurrency($(this));
                },
                blur: function () {
                    formatCurrency($(this), "blur");
                }
            });
        }


    </script>
</asp:Content>
