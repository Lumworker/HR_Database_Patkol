<%@ Page Title="Import OT Transaction" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoadOTTrans.aspx.cs" Inherits="HR_Portal.LoadOTTrans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2>Import OT Transaction</h2>
    </div>
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-body">
                <div id="smartwizard">
                    <ul>
                        <li class="check" data-step="Step1"><a href="#step-1">Load</a></li>
                        <li class="check" data-step="Step2"><a href="#step-2">Import</a></li>
                        <li class="check" data-step="Step2"><a href="#step-3">Status</a></li>
                    </ul>
                    <div>
                        <div id="step-1" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>OT Transaction</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="file-upload-wrapper" >
                                            <input class="file-upload form-control" style="margin: 0 auto;float: none;" type="file" id="input-file-now"  />
                                        </div>
                                        <div style="float:right;">
                                            <button type="button" class="btn btn-warning" onclick="nextStep()">Load</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="step-2" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <h4>Checking Data</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;">
                                                <label class="text-success">Pass : </label><b class="text-success" style="margin: 0.5rem;" id="pass_data">0</b>
                                                <label class="text-danger">Fail : </label><b class="text-danger" style="margin: 0.5rem;" id="fail_data">0</b>
                                                <%--<div class="col-md-6 col-sm-6 col-xs-12" style="text-align:right;">
                                                    <label class="text-success">Pass : </label>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <p  id="pass_data">0</p>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12" style="text-align:right;">
                                                    <label class="text-danger">Fail : </label>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <p  id="fail_data">0</p>
                                                    <%--<button type="button" class="btn btn-default" id="showToggle">Show</button>--%>
                                                <%--</div>--%>
                                            </div>
                                            
                                        </div>
                                        <div class="toggle-show" style="display:none">
                                            <div class="row" style="margin-bottom:1rem;">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div class="col-md-1 col-sm-1 col-xs-12">
                                                        <label id="txtShow">Show rows:</label>
                                                    </div>
                                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                                        <select class="form-control" name="state" id="maxRows">
                                                            <option value="5000">Show ALL</option>
                                                            <option value="5">5</option>
                                                            <option value="25">25</option>
                                                            <option value="50">50</option>
                                                            <option value="100">100</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="table-responsive" style="max-height: 18em; overflow-y: scroll;margin:1rem;">
                                                <table id="TableExport" class="table table-striped table-bordered table-responsive">
                                                    <thead id="theaderExport">
                                                        <tr class="header">
                                                            <th>ID</th>
                                                            <th>Working Date</th>
                                                            <th>Normal</th>
                                                            <th>OT1</th>
                                                            <th>OT1_5</th>
                                                            <th>OT2_0</th>
                                                            <th>OT3_0</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbodyExport">
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class='pagination-container'>
                                                <nav style="text-align: center;">
                                                    <ul class="pagination">

                                                        <li data-page="prev">
                                                            <span>< <span class="sr-only">(current)</span></span>
                                                        </li>
                                                        <!--	Here the JS Function Will Add the Rows -->
                                                        <li data-page="next" id="prev">
                                                            <span>> <span class="sr-only">(current)</span></span>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div style="float:right;margin:1rem;">
                                        <button type="button" class="btn btn-warning" id="import">Import</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="step-3" class="">
                            <div class="panel-group">
                                <div class="panel panel-default" style="margin-top: 1em;">
                                    <div class="panel-heading">
                                        <%--<h4>Compressor</h4>--%>
                                    </div>
                                    <div class="panel-body" style="text-align:center;">
                                        <h2 class="text-success">Complete</h2>
                                        <div style="float:right;margin:1rem;">
                                            <button type="button" class="btn btn-default" onclick="retry()">Retry</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            
            //$("div#myId").dropzone({ url: "/file/post" });
            $('#smartwizard').smartWizard({
                theme: 'arrows',
                keyNavigation: false,
                showStepURLhash: false,
                selected: 0, //ใส่ 0 จะเริ่มที่ Step แรกสุด
                transitionEffect: 'slide',
                toolbarSettings: { toolbarPosition: 'none', showNextButton: 'false', showPreviousButton: 'false' }
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
                    sessionStorage.setItem('userAD', user);
                    <%--$.ajax({
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
                    });--%>
                }
            });
            //---------END Check user's permission----------

            //----------------------Get Emp Num-----------
            $.ajax({
                type: 'post',
                url: 'MaintainEmployee.aspx/GetUserAD',
                data: JSON.stringify({ user: '', search: sessionStorage.getItem('userAD') }),
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var empNum = val[1];
                            sessionStorage.setItem("empnum", empNum);
                        });
                    }
                }
            });
            //----------------------END--------------

            $("#import").on("click", function () {
                $.ajax({
                    type: 'post',
                    url: 'MaintainEmployee.aspx/importData',
                    data: JSON.stringify({ empnum: sessionStorage.getItem('empnum') }),
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (status) {
                        $('#smartwizard').smartWizard("next");
                    }
                });
            });

        });

        function nextStep() {
            var excel = $("#input-file-now")[0].files[0];
            //LoadFile(excel, "OTMobile_Import_BackUp");

            var extention = excel.name;
            var lastDot = extention.lastIndexOf('.');
            var ext = extention.substring(lastDot + 1);
            var excelExtention = ['xlsx', 'xlsm', 'xlsb', 'xltx', 'xltm', 'xls', 'xlt', 'csv'];
            if (excel = '') {
                alert("Plese select files.");
            }
            else if (!excelExtention.includes(ext)) {
                alert("Plese check files.");
            }
            else {
                excel = $("#input-file-now")[0].files[0];
                LoadFile(excel, "OTMobile_Import_BackUp");
            }
        }
        function LoadFile(data, folderName) {
            //console.log(data);
            var EmpNum = sessionStorage.getItem('empnum');
            ClearData(EmpNum);
            var formData = new FormData();
            formData.append('file', data);
            formData.append('name', (data.name).substr((data.name).lastIndexOf('//') + 1).split('.')[0]);
            formData.append('floderName', folderName);
            $.ajax({
                type: 'post',
                url: './LoadExcel.ashx',
                data: formData,
                async: false,
                processData: false,
                contentType: false,
                success: function (status) {
                    
                    callOTDetail(EmpNum);
                    $('#smartwizard').smartWizard("next");
                },
                error: function () {
                    alert("Whoops something went wrong!");
                }
            });
        }

        function callOTDetail(EmpNum) {
            var fragment = '';
            $.ajax({
                type: 'post',
                url: 'MaintainEmployee.aspx/GetOTDetails',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ empnum: EmpNum }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var empNum = val[0];
                            var workdate = val[1];
                            var time_normal = val[2];
                            var time_OT01 = val[3];
                            var time_OT15 = val[4];
                            var time_OT20 = val[5];
                            var time_OT30 = val[6];

                            fragment += '<tr>';
                            fragment += '<td>' + empNum + '</td>';
                            fragment += '<td>' + workdate + '</td>';
                            fragment += '<td>' + time_normal + '</td>';
                            fragment += '<td>' + time_OT01 + '</td>';
                            fragment += '<td>' + time_OT15 + '</td>';
                            fragment += '<td>' + time_OT20 + '</td>';
                            fragment += '<td>' + time_OT30 + '</td>';
                            fragment += '</tr>';
                        });
                    } else { }
                    $("#tbodyExport").append(fragment);
                    getPagination("#TableExport");
                }
            });
            $.ajax({
                type: 'post',
                url: 'MaintainEmployee.aspx/GetOT',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ empnum: EmpNum }),
                success: function (response) {
                    if (response.d.length > 0) {
                        $.each(response.d, function (index, val) {
                            var TotQtyPass = val[0];
                            var TotQtyFail = val[1];
                            if (TotQtyFail > 0) {
                                console.log("block");
                                $(".toggle-show").css("display", "block");
                            } else {
                                $(".toggle-show").css("display", "none");
                            }
                            $("#pass_data").text(TotQtyPass);
                            $("#fail_data").text(TotQtyFail);
                        });
                    } 
                }

            });
            
        }

        function ClearData(EmpNum) {
            $.ajax({
                type: 'post',
                url: 'MaintainEmployee.aspx/clearData',
                data: JSON.stringify({ empnum: EmpNum }),
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (status) {
                }
            });
        }
        function retry() {
            window.location.href = "LoadOTTrans.aspx";
        }

        function getPagination(table) {
             var lastPage = 1;

             $('#maxRows').on('change', function (evt) {
                 lastPage = 1;
                 $('.pagination')
                     .find('li')
                     .slice(1, -1)
                     .remove();
                 var trnum = 0; // reset tr counter
                 var maxRows = parseInt($(this).val()); // get Max Rows from select option

                 if (maxRows == 5000) {
                     $('.pagination').hide();
                 } else {
                     $('.pagination').show();
                 }

                 var totalRows = $(table + ' tbody tr').length; // numbers of rows
                 $(table + ' tr:gt(0)').each(function () {
                     // each TR in  table and not the header
                     trnum++; // Start Counter
                     if (trnum > maxRows) {
                         $(this).hide(); // fade it out
                     }
                     if (trnum <= maxRows) {
                         $(this).show();
                     } // else fade in Important in case if it ..
                 }); //  was fade out to fade it in
                 if (totalRows > maxRows) {
                     $(".pagination-container").css("display", "block");
                     // if tr total rows gt max rows option
                     var pagenum = Math.ceil(totalRows / maxRows); // ceil total(rows/maxrows) to get ..
                     //	numbers of pages
                     for (var i = 1; i <= pagenum;) {
                         // for each page append pagination li
                         $('.pagination #prev')
                             .before(
                                 '<li data-page="' +i +'">\<span>' +(i++) +'<span class="sr-only">(current)</span></span>\</li>'
                             ).show();
                     } // end for i
                 } else {
                     $(".pagination-container").css("display", "none");
                 }// end if row count > max rows
                 $('.pagination [data-page="1"]').addClass('active'); // add active class to the first li
                 $('.pagination li').on('click', function (evt) {
                     // on click each page
                     evt.stopImmediatePropagation();
                     evt.preventDefault();
                     var pageNum = $(this).attr('data-page'); // get it's number

                     var maxRows = parseInt($('#maxRows').val()); // get Max Rows from select option

                     if (pageNum == 'prev') {
                         if (lastPage == 1) {
                             return;
                         }
                         pageNum = --lastPage;
                     }
                     if (pageNum == 'next') {
                         if (lastPage == $('.pagination li').length - 2) {
                             return;
                         }
                         pageNum = ++lastPage;
                     }

                     lastPage = pageNum;
                     var trIndex = 0; // reset tr counter
                     $('.pagination li').removeClass('active'); // remove active class from all li
                     $('.pagination [data-page="' + lastPage + '"]').addClass('active'); // add active class to the clicked
                     // $(this).addClass('active');					// add active class to the clicked
                     limitPagging();
                     $(table + ' tr:gt(0)').each(function () {
                         // each tr in table not the header
                         trIndex++; // tr index counter
                         // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
                         if (
                             trIndex > maxRows * pageNum ||
                             trIndex <= maxRows * pageNum - maxRows
                         ) {
                             $(this).hide();
                         } else {
                             $(this).show();
                         } //else fade in
                     }); // end of for each tr in table
                 }); // end of on click pagination list
                 limitPagging();
             }).val(5).change();
             // END OF PAGINATION
         }

         function limitPagging() {
             if ($('.pagination li').length > 7) {
                 if ($('.pagination li.active').attr('data-page') <= 3) {
                     $('.pagination li:gt(5)').hide();
                     $('.pagination li:lt(5)').show();
                     $('.pagination [data-page="next"]').show();
                 } if ($('.pagination li.active').attr('data-page') > 3) {
                     $('.pagination li:gt(0)').hide();
                     $('.pagination [data-page="next"]').show();
                     for (let i = (parseInt($('.pagination li.active').attr('data-page')) - 2); i <= (parseInt($('.pagination li.active').attr('data-page')) + 2); i++) {
                         $('.pagination [data-page="' + i + '"]').show();

                     }

                 }
             }
         }

    </script>
</asp:Content>
