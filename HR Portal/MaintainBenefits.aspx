<%@ Page Title="Benefits" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MaintainBenefits.aspx.cs" Inherits="HR_Portal.WebForm1" %>

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
        <h2>Maintain Benefits</h2>

    </div>

    <!----End Header---->

    <%--Start New Rate Modal--%>
    <div class="modal fade" id="modalBenefits" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title" id="TitleBenefits">New Benefits</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <input id="BenefitsID" type="hidden" class="form-control max-wide" disabled>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px" id="textZone">Emp Zone:</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input id="ZoneID" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" id="input1" type="button" data-type="zoneid">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End ZoneID --%>
                    <div class="col-md-12 col-sm-12 col-xs-12" id="divDestination">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Destination Zone :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input type="text" id="Destinationzone" class="form-control max-wide" disabled />
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="Destinationzone">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Destinationzone --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Allowance :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <input type="number" id="Allowance" class="form-control max-wide" />

                            </div>
                        </div>
                    </div>
                    <%--End Allowance --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Accomodation :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <input type="checkbox" id="ActualBenefit" />
                                <label class="control-label" style="font-size: 13px">Actual</label>
                            </div>
                        </div>
                    </div>
                    <%--End ActualBenefit --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <input type="number" id="Accomodation" class="form-control max-wide" />
                            </div>
                        </div>
                    </div>
                    <%--End Accomodation --%>
                          <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Food :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <input type="checkbox" id="Actualfood" />
                                <label class="control-label" style="font-size: 13px">Actual</label>
                            </div>
                        </div>
                    </div>
                    <%--End ActualBenefit --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <input type="number" id="food" class="form-control max-wide" />
                            </div>
                        </div>
                    </div>
                    <%--End Accomodation --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Currency :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input type="text" id="Currency" class="form-control max-wide" disabled />
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="Currency">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Currency --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Effective Date :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <input placeholder="dd/mm/yyyy" type="text" class="form-control  max-wide" id="Effect_Data" autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <%--End Effect_Data --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Employee Level :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <input type="text" id="EmpLevel" class="form-control max-wide" />

                            </div>
                        </div>
                    </div>
                    <%--End EmpLevel --%>
                </div>
                <%--End modal body--%>
                <div class="modal-footer" id="Browsefooter">
                </div>
            </div>
        </div>
    </div>
    <%-- End Rate Modal--%>
    
    <%--Start New Zone Modal--%>
    <div class="modal fade" id="modalZone" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">New Zone</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            
                        <input id="ZoneID_Zone" type="hidden" class="form-control max-wide"disabled >
                        </div>
                    </div>
                </div>
                <%--Start modal body--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <input id="GetZoneID" type="hidden" class="form-control max-wide" disabled>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Zone ID:</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input id="Emp_zone" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="Zone_ZoneID">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Zone_ZoneID --%>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 1em;">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <label class="control-label" style="font-size: 13px">Country :</label>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9">
                                <div class="input-group">
                                    <input type="text" id="Country" class="form-control max-wide" disabled />
                                    <div class="input-group-btn">
                                        <button class="btn btn-default Browse_modal" type="button" data-type="Country">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--End Country --%>
                </div>
                <%--End modal body--%>
                <div class="modal-footer" id="ZoneBrowsefooter" >
                </div>
            </div>
        </div>
    </div>
    <%-- End Zone Modal--%>
    
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
    
    <%--========Start Tab Menu===========--%>
    <div class="panel nav-tab panel-default">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <li class="nav-item active">
                    <a href="#TabRate" class="nav-link" role="tab" data-toggle="tab">Inter Rate</a>
                </li>
                <li class="nav-item ">
                    <a href="#TabDomestic" class="nav-link" data-toggle="tab" role="tab">Domestic Rate</a>
                </li>
                <li class="nav-item ">
                    <a href="#TabZone" class="nav-link" data-toggle="tab" role="tab">Zone</a>
                </li>
            </ul>
            
            <%--========Start Tab Rate===========--%>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="TabRate">
                        <div class="table-responsive">
                            <div class="row">
                                <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                                    <button class="btn btn-info btnModalNew" type="button" id="test" data-type="Rate" data-toggle="modal" style="margin-bottom: 5px;">New </button>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <table id="TableBenefits" class="table" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <%--<th>ID</th>--%>
                                                <th>Emp Zone</th>
                                                <th>Destination Zone</th>
                                                <th>Allowance</th>
                                                <th>Food</th>
                                                <th>Accomodation</th>
                                                <th>Currency</th>
                                                <th>EmpLevel</th>
                                                <th>Effective</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyBenefits'>
                                        </tbody>
                                    </table>
                                </div>
                                <!--- End Col-md-12 --->
                            </div>
                        </div>
                    </div>
                    <!--================End Tab Rate=====================-->
                    <%--------------------Tab Zone-------------------------%>
                     <div class="tab-pane fade" role="tabpanel" id="TabZone">
                        <div class="col-md-12 row">
                                <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                                    <button id="btnModalNewZone" class="btn btn-info" type="button" data-toggle="modal" style="margin-bottom: 5px;">New </button>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <table id="TableZone" class="table" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <%--<th>ID</th>--%>
                                                <th>Zone ID</th>
                                                <th>Country</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyZone' >
                                        </tbody>
                                    </table>
                                </div>
                                <!--- End Col-md-12 --->
                        </div>
                    </div>
                        <!--================End Tab Zone=====================-->
                     <%--------------------Tab Domestic-------------------------%>
                     <div class="tab-pane fade" role="tabpanel" id="TabDomestic">
                        <div class="table-responsive">
                            <div class="row">
                                <div class="col-md-4 col-sm-4 col-xs-4" style="text-align: left;">
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right">
                                    <button class="btn btn-info btnModalNew" data-type="Domestic" id="NewDomestic" type="button" data-toggle="modal" style="margin-bottom: 5px;">New</button>
                                  </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <table id="TableDomestic" class="table" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <%--<th>ID</th>--%>
                                                <th>Country</th>
                                                <th>Allowance</th>
                                                <th>Food</th>
                                                <th>Accomodation</th>
                                                <th>Currency</th>
                                                <th>EmpLevel</th>
                                                <th>Effective</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id='TBbodyDomestic'>
                                        </tbody>
                                    </table>
                                </div>
                                <!--- End Col-md-12 --->
                            </div>
                        </div>
                    </div>
                        <!--================End Tab Domestic=====================-->
                </div>
            </div>
        </div>
    </div>


    <%--========End Tab Rate=============--%>
    <script type="text/javascript">

        $(document).ready(function () {

            var TableBenefits = $('#TableBenefits').DataTable({
                searching: true,
                responsive: true
            });
             var TableZone = $('#TableZone').DataTable({
                searching: true,
                responsive: true
            });
            var TableDomestic = $('#TableDomestic').DataTable({
                searching: true,
                responsive: true
            });
            sessionStorage.setItem('Page_type', 'Benefits');
            LoadData();
            LoadDataZone();
            LoadDomesticData();
            $(".btnModalNew").on("click", function () {
                $("#ActualBenefit").prop('checked', false);
                $("#Actualfood").prop('checked', false);
                $("#Accomodation").prop('disabled', false);
                $("#food").prop('disabled', false);
                $("#ZoneID").val("");
                $("#food").val("");
                $("#Destinationzone").val("");
                $("#Allowance").val("");
                $("#Accomodation").val("");
                $("#Currency").val("");
                $("#Effect_Data").val("");
                $("#EmpLevel").val("");
                $("#Browsefooter").empty();
                var NewType = $(this).attr("data-type");
                if (NewType == "Rate") {
                    $('#input1').attr("data-type", 'zoneid');
                    $("#TitleBenefits").text("New Rate");
                    $('#divDestination').show();
                    $('#textZone').text("Emp Zone");
                     var button = ' <button type="button" class="btn btn-success" id="BenefitsSave" >Save</button>';
                     button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                    
                }
                else if (NewType == "Domestic") {
                    $('#input1').attr("data-type", 'Country');
                    $("#TitleBenefits").text("New Domestic");
                    $('#divDestination').hide();
                    $('#textZone').text("Country");
                      var button = ' <button type="button" class="btn btn-success" id="DomesticSave" >Save</button>';
                     button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                }
                $("#Browsefooter").append(button);
               
                $("#modalBenefits").modal("show");
            });
            
                $("#btnModalNewZone").on("click", function () {
                    $("#Emp_zone").val("");
                    $("#Country").val("");
                    $("#ZoneBrowsefooter").empty();
                    var button = ' <button type="button" class="btn btn-success" id="ZoneSave" >Save</button>';
                    button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                    $("#ZoneBrowsefooter").append(button);
                    $("#modalZone").modal("show");
                });

        
            $(document).on("click", ".btnModalEdit", function () {

                var tr = $(this).closest("tr");
                var ID = $(this).attr("data-id");
                var NewType = $(this).attr("data-type");
                var ActualBenefit =  $(this).attr("data-ActualBenefit");
                var Actualfood = $(this).attr("data-Actualfood");
                var ZoneID = $(this).attr("data-Zone_ID");
                $("#Browsefooter").empty();
                if (NewType == "Rate") {
                    $('#divDestination').show();
                    $('#textZone').text("Emp Zone");
                    var Destinationzone = $(this).attr("data-Destinationzone");
                    $("#Destinationzone").val(Destinationzone);
                    var Allowance = tr.find("td:nth-child(3)").text();
                    var food = tr.find("td:nth-child(4)").text();
                    var Accomodation = tr.find("td:nth-child(5)").text();
                    var Currency = tr.find("td:nth-child(6)").text();
                    var EmpLevel = tr.find("td:nth-child(7)").text();
                    var EffectiveData = tr.find("td:nth-child(8)").text();
                    var button = ' <button type="button" class="btn btn-warning " id="BenefitsEdit" >Save</button>';
                }
                else if (NewType == "Domestic") {
                    $('#divDestination').hide();
                    $('#textZone').text("Country");
                    var Allowance = tr.find("td:nth-child(2)").text();
                    var food = tr.find("td:nth-child(3)").text();
                    var Accomodation = tr.find("td:nth-child(4)").text();
                    var Currency = tr.find("td:nth-child(5)").text();
                    var EmpLevel = tr.find("td:nth-child(6)").text();
                    var EffectiveData = tr.find("td:nth-child(7)").text();
                    var button = ' <button type="button" class="btn btn-warning " id="DomesticEdit" >Save</button>';
                }
                
                $("#BenefitsID").val(ID);
                $("#ZoneID").val(ZoneID);
                $("#Allowance").val(Allowance);
                $("#ActualBenefit").prop('checked', (ActualBenefit == 'True' ? true && $("#Accomodation").prop('disabled', true) : false && $("#Accomodation").prop('disabled', false)));
                $("#Accomodation").val(Accomodation);
                $("#Currency").val(Currency);
                $("#EmpLevel").val(EmpLevel);
                $("#Effect_Data").val(EffectiveData);
                $("#Actualfood").prop('checked', (Actualfood == 'True' ? true && $("#food").prop('disabled', true) : false && $("#food").prop('disabled', false)));
                $("#food").val(food);
                button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';

                $("#Browsefooter").append(button);
                $("#modalBenefits").modal("show");
            });
             $(document).on("click", ".btnModalEditZone", function () {
                var tr = $(this).closest("tr");
                //var ID = tr.find("td:nth-child(1)").text();
                var ID = $(this).attr("data-id");
                var Emp_zone = $(this).attr("data-Emp_zone");
                var Country = $(this).attr("data-Country");
                $("#Emp_zone").val(Emp_zone);
                $("#ZoneID_Zone").val(ID);
                $("#Country").val(Country);
                $("#ZoneBrowsefooter").empty();
                var button = ' <button type="button" class="btn btn-warning " id="ZoneEdit" >Save</button>';
                button += '<button type="button" class="btn btn-default"  data-dismiss="modal">Close</button>';
                $("#ZoneBrowsefooter").append(button);
                $("#modalZone").modal("show");
            });

            //Start Browse Modal
            $(".Browse_modal").on("click", function () {
                $('#SearchBrowse').val("");
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
                if (browse_type == 'zoneid') {
                    $("#browseHeader").text('Zone ID');
                    $('#SearchBrowse').val("");
                    $('#SearchBrowse').attr("id", 'search_zoneid');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });

                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'Zone_ZoneID') {
                    $("#browseHeader").text('Zone ID');
                    $('#SearchBrowse').val("");
                    $('#SearchBrowse').attr("id", 'Zone_search_zoneid');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectZone_ZoneID" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectZone_ZoneID" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });

                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
              
                else if (browse_type == 'zoneid') {
                    $("#browseHeader").text('Zone ID');
                    $('#SearchBrowse').val("");
                    $('#SearchBrowse').attr("id", 'search_zoneid');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });

                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'Destinationzone') {
                    $("#browseHeader").text('Destinationzone');
                    $('#SearchBrowse').val("");
                    $('#SearchBrowse').attr("id", 'search_Destinationzone');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectDestinationzone" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectDestinationzone" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'Country') {
                    $("#browseHeader").text('Country');
                    $('#SearchBrowse').val("");
                    $('#SearchBrowse').attr("id", 'Zone_Country');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetCountry") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectCountry" href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectCountry" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
                else if (browse_type == 'Currency') {
                    $("#browseHeader").text('Currency');
                    $('#SearchBrowse').val("");
                    $('#SearchBrowse').attr("id", 'search_Currency');
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/GetCurrency") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: "" }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectCurrency " href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectCurrency" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                        }
                    });
                }
            });

            //// Search in modal zoneid
            $(document).on("change", "#search_zoneid", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectzoneid" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
             $(document).on("change", "#Zone_search_zoneid", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();

                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectZone_ZoneID" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectZone_ZoneID" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
            $(document).on("change", "#search_Destinationzone", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetZoneID")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectDestinationzone" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectDestinationzone" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
             $(document).on("change", "#Zone_Country", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetCountry")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var name = val[1];
                                var id = val[0];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectCountry" href="javascript:void(0)" >' + id + '</a></td>';
                                fragment += '<td><a class="clickselectCountry" href="javascript:void(0)" >' + name + '</a></td>';
                                fragment += '</tr>';
                            });
                        } else { }
                        $("#TBbodyBrowse").append(fragment);
                    }
                });
            });
             $(document).on("change", "#search_Currency", function () {
                $("#TBbodyBrowse").empty();
                var fragment = '';
                var values = $(this).val().trim();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetCurrency") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ search: values }),
                        success: function (response) {
                            if (response.d.length > 0) {
                                $.each(response.d, function (index, val) {
                                    var name = val[1];
                                    var id = val[0];

                                    fragment += '<tr>';
                                    fragment += '<td><a class="clickselectCurrency " href="javascript:void(0)" >' + id + '</a></td>';
                                    fragment += '<td><a class="clickselectCurrency" href="javascript:void(0)" >' + name + '</a></td>';
                                    fragment += '</tr>';
                                });
                            } else { }
                            $("#TBbodyBrowse").append(fragment);
                            $("#modalBrowse").modal("show");
                    }
                });
            });
            $(document).on("change", "#ActualBenefit", function () {
                if ($('#ActualBenefit').is(':checked')) {
                    $("#Accomodation").prop('disabled', true);
                    $("#Accomodation").val('0');
                } else {
                    $("#Accomodation").prop('disabled', false);
                }
            });
            $(document).on("change", "#Actualfood", function () {
                if ($('#Actualfood').is(':checked')) {
                    $("#food").prop('disabled', true);
                    $("#food").val('0');
                } else {
                    $("#food").prop('disabled', false);
                }
            });
            //End search
            //-------select zoneid------
            $(document).on("click", ".clickselectzoneid", function () {
                var ZoneID = $(this).closest("tr").find("td:nth-child(1)").text();
                $('#search_zoneid').attr("id", 'SearchBrowse');
                $("#SearchBrowse").val("");
                $("#ZoneID").val(ZoneID);
                $("#modalBrowse").modal("hide");
            });
            //-------select Destinationzone------
            $(document).on("click", ".clickselectDestinationzone", function () {
                var Destinationzone = $(this).closest("tr").find("td:nth-child(1)").text();
                $('#search_Destinationzone').attr("id", 'SearchBrowse');
                $("#SearchBrowse").val("");
                $("#Destinationzone").val(Destinationzone);
                $("#modalBrowse").modal("hide");
            });
       
            //-------select clickselectCurrency------
            $(document).on("click", ".clickselectCurrency", function () {
                var Currency = $(this).closest("tr").find("td:nth-child(1)").text();
                $('#search_Currency').attr("id", 'SearchBrowse');
                $("#SearchBrowse").val("");
                $("#Currency").val(Currency);
                $("#modalBrowse").modal("hide");
            });

            //-------select Zone_ZoneID------
            $(document).on("click", ".clickselectZone_ZoneID", function () {
                var ZoneID = $(this).closest("tr").find("td:nth-child(1)").text();
                $('#Zone_search_zoneid').attr("id", 'SearchBrowse');
                $("#SearchBrowse").val("");
                $("#Emp_zone").val(ZoneID);
                $("#modalBrowse").modal("hide");
            });
            //-------select  Country------
            $(document).on("click", ".clickselectCountry", function () {
                var Country = $(this).closest("tr").find("td:nth-child(1)").text();
                //alert(Destinationzone);
                $('#Zone_Country').attr("id", 'SearchBrowse');
                $("#SearchBrowse").val("");
                $("#ZoneID").val(Country);
                $("#modalBrowse").modal("hide");
            });
            
            //End select

            $(document).on("click", "#BenefitsSave", function () {
                var ZoneID = $("#ZoneID").val();
                var Destinationzone = $("#Destinationzone").val();
                var Allowance = $("#Allowance").val();
                var ActualBenefit = $("#ActualBenefit").is(':checked') ? 1 : 0;
                var Accomodation = $("#Accomodation").val();
                var Actualfood = $("#Actualfood").is(':checked') ? 1 : 0;
                var food = $("#food").val();
                var Currency = $("#Currency").val();
                var Effect_Data = $("#Effect_Data").val();
                var EmpLevel = $("#EmpLevel").val();

                if (ZoneID != "" && Destinationzone != "" && Allowance != "" && Accomodation != "" && Currency != ""  && food!="") {
                    //alert(ZoneID + "\n" + Destinationzone + "\n" + Allowance + "\n" + Accomodation + "\n" + Currency + "\n"+Effect_Data + "\n"+EmpLevel)
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Maintain_InterBenefit")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: 0,
                            ZoneID: ZoneID,
                            Country: Destinationzone,
                            Allowance: Allowance,
                            Actualfood: Actualfood,
                            food: food,
                            ActualBenefit: ActualBenefit,
                            Accomodation: Accomodation,
                            Currency: Currency,
                            Effect_Data: Effect_Data,
                            EmpLevel: EmpLevel,
                            Action: "Insert"
                        }),
                        success: function (response) {
                            $("#modalBenefits").modal("hide");
                            LoadData();
                            alert("Insert Complete");
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });
            $(document).on("click", "#DomesticSave", function () {
                var ZoneID = $("#ZoneID").val();
                var Allowance = $("#Allowance").val();
                var ActualBenefit = $("#ActualBenefit").is(':checked') ? 1 : 0;
                var Accomodation = $("#Accomodation").val();
                var Actualfood = $("#Actualfood").is(':checked') ? 1 : 0;
                var food = $("#food").val();
                var Currency = $("#Currency").val();
                var Effect_Data = $("#Effect_Data").val();
                var EmpLevel = $("#EmpLevel").val();

                if (ZoneID != "" && Allowance != "" && Accomodation != "" && Currency != ""  && food!="") {
                    //alert(ZoneID + "\n" +  Allowance + "\n" + Accomodation + "\n" + Currency + "\n"+Effect_Data + "\n"+EmpLevel)
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Maintain_Domestic")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: 0,
                            ZoneID: ZoneID,
                            Allowance: Allowance,
                            Actualfood: Actualfood,
                            food: food,
                            ActualBenefit: ActualBenefit,
                            Accomodation: Accomodation,
                            Currency: Currency,
                            Effect_Data: Effect_Data,
                            EmpLevel: EmpLevel,
                            Action: "Insert"
                        }),
                        success: function (response) {
                            $("#modalBenefits").modal("hide");
                            LoadDomesticData();
                            alert("Insert Complete");
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });

            $(document).on("click", "#BenefitsEdit", function () {
                var ID = $("#BenefitsID").val();
                var ZoneID = $("#ZoneID").val();
                var Destinationzone = $("#Destinationzone").val();
                var Allowance = $("#Allowance").val();
                var ActualBenefit = $("#ActualBenefit").is(':checked') ? 1 : 0;
                var Accomodation = $("#Accomodation").val();
                var Actualfood = $("#Actualfood").is(':checked') ? 1 : 0;
                var food = $("#food").val();
                var Currency = $("#Currency").val();
                var Effect_Data = $("#Effect_Data").val();
                var EmpLevel = $("#EmpLevel").val();
                if (ZoneID != "" && Destinationzone != "" && Allowance != "" && Accomodation != "" && Currency != "" && food!="") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Maintain_InterBenefit")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID,
                            ZoneID: ZoneID,
                            Country: Destinationzone,
                            Allowance: Allowance,
                            Actualfood: Actualfood,
                            food: food,
                            ActualBenefit: ActualBenefit,
                            Accomodation: Accomodation,
                            Currency: Currency,
                            Effect_Data: Effect_Data,
                            EmpLevel: EmpLevel,
                            Action: "Update"
                        }),
                        success: function (response) {
                            $("#modalBenefits").modal("hide");
                            LoadData();
                            alert("Update Complete");
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });

            $(document).on("click", "#DomesticEdit", function () {
                var ID = $("#BenefitsID").val();
                var ZoneID = $("#ZoneID").val();
                var Allowance = $("#Allowance").val();
                var ActualBenefit = $("#ActualBenefit").is(':checked') ? 1 : 0;
                var Accomodation = $("#Accomodation").val();
                var Actualfood = $("#Actualfood").is(':checked') ? 1 : 0;
                var food = $("#food").val();
                var Currency = $("#Currency").val();
                var Effect_Data = $("#Effect_Data").val();
                var EmpLevel = $("#EmpLevel").val();
                if (ZoneID != ""  && Allowance != "" && Accomodation != "" && Currency != "" && food!="") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Maintain_Domestic")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID,
                            ZoneID: ZoneID,
                            Allowance: Allowance,
                            Actualfood: Actualfood,
                            food: food,
                            ActualBenefit: ActualBenefit,
                            Accomodation: Accomodation,
                            Currency: Currency,
                            Effect_Data: Effect_Data,
                            EmpLevel: EmpLevel,
                            Action: "Update"
                        }),
                        success: function (response) {
                            $("#modalBenefits").modal("hide");
                            LoadDomesticData();
                            alert("Update Complete");
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });

             $(document).on("click", "#ZoneSave", function () {
                var Emp_zone = $("#Emp_zone").val();
                var Country = $("#Country").val();

                if (Emp_zone != "" && Country != "" ) {
                   $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Zone")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: 0,
                            Emp_zone: Emp_zone,
                            Country: Country,
                            Action: "Insert"
                        }),
                        success: function (response) {
                            $("#modalZone").modal("hide");
                            LoadDataZone();
                            alert("Save Complete");
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });
             $(document).on("click", "#ZoneEdit", function () {
                var ID = $("#ZoneID_Zone").val();
                var Emp_zone = $("#Emp_zone").val();
                var Country = $("#Country").val();
               
                if (ZoneID != "" && Destinationzone != "" && Allowance != "" && Accomodation != "" && Currency != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_Zone")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID,
                            Emp_zone: Emp_zone,
                            Country: Country,
                            Action: "Update"
                        }),
                        success: function (response) {
                            $("#modalZone").modal("hide");
                            alert("Edit Complete");
                            LoadDataZone();
                        }
                    });//End ajax
                } else { alert("Please check data") }
            });
            $('#Effect_Data').datepicker({ dateFormat: "dd/mm/yy" });

            function LoadData() {
                TableBenefits.clear().draw();
                var type = "Rate";
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetInterBenefit")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var fragment = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Zone_ID = val[1];
                                var Destinationzone = val[2];
                                var Allowance = val[3];
                                var ActualBenefit = val[4];
                                var Accomodation = val[5];
                                var Currency = val[6];
                                var EmpLevel = val[7];
                                var EffectiveData = val[8];
                                var Actualfood = val[9];
                                var food = val[10];
                                var Zone_ID_desc = val[11];
                                var Country_desc = val[12];
                                EffectiveData = EffectiveData.substring(0, 10);
                                var Zone_name = Zone_ID + ":" + Zone_ID_desc;
                                var Zone_Country = Destinationzone + ":" + Country_desc;

                                TableBenefits.row.add([ Zone_name, Zone_Country, Allowance,food,Accomodation, Currency, EmpLevel, EffectiveData
                                    , '<button class="btn btn-warning btnModalEdit" data-type="'+type+'"  data-Zone_ID="'+Zone_ID+'" data-Destinationzone="'+Destinationzone+'"  data-Actualfood="'+Actualfood+'" data-ActualBenefit="'+ActualBenefit+'" data-id="'+ID+'" type="button">Edit</button>']).draw().node();
                            });
                        }
                    }
                });
            }
            function LoadDomesticData() {
                TableDomestic.clear().draw();
                var type = "Domestic";
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetTB_Domestic")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var fragment = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Zone_ID = val[1];
                                var Allowance = val[2];
                                var ActualBenefit = val[3];
                                var Accomodation = val[4];
                                var Currency = val[5];
                                var EmpLevel = val[6];
                                var EffectiveData = val[7];
                                var Actualfood = val[8];
                                var food = val[9];
                                var Country_desc = val[10];
                                EffectiveData = EffectiveData.substring(0, 10);
                                var Zone_name = Zone_ID + ":" + Country_desc;

                                TableDomestic.row.add([ Zone_name, Allowance,food,Accomodation, Currency, EmpLevel, EffectiveData
                                    , '<button class="btn btn-warning btnModalEdit" data-type="'+type+'" data-Zone_ID="'+Zone_ID+'"  data-Actualfood="'+Actualfood+'" data-ActualBenefit="'+ActualBenefit+'" data-id="'+ID+'" type="button">Edit</button>']).draw().node();
                            });
                        }
                    }
                });
            }

             function LoadDataZone() {
                 TableZone.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetTB_Zone")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                   data: JSON.stringify({
                            value: ''
                        }),
                    success: function (response) {
                        var fragment = "";
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Emp_zone = val[1];
                                var Country = val[2];
                                var zone_description = val[3]
                                var Uf_CountryTH = val[4]
                                var Zone_name = Emp_zone + ":" + zone_description;
                                var Country_name = Country + ' (' + Uf_CountryTH+')';
                                TableZone.row.add([Zone_name, Country_name
                                    , '<button class="btn btn-warning btnModalEditZone" data-Emp_zone="' + Emp_zone + '" data-Country="' + Country + '" data-id="' + ID + '" type="button">Edit</button>']).draw().node();
                            });
                        }
                    }
                });
             }


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
                        data: JSON.stringify({ user : user, page : 'Benefits' }),
                        success: function (response) {
                            if (response.d.length > 0 && response.d[0][4] == 'True') {
                                $('.btnModalEdit').prop('disabled', false);
                                $('.btnModalNew').prop('disabled', false);
                                $('#btnModalNewZone').prop('disabled', false);
                                $('.btnModalEditZone').prop('disabled', false);
                            } else {
                                $('.btnModalEdit').prop('disabled', true);
                                $('.btnModalNew').prop('disabled', true);
                                $('#btnModalNewZone').prop('disabled', true);
                                $('.btnModalEditZone').prop('disabled', true);
                            }
                        }
                    });
                }
            });
            //---------END Check user's permission----------
        });


    </script>

</asp:Content>
    
  