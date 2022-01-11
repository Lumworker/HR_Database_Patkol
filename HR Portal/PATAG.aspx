<%@ Page Title="PATAG" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PATAG.aspx.cs" Inherits="HR_Portal.WebForm3" %>

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

        input[type=checkbox] {
            -ms-transform: scale(2);
            -moz-transform: scale(2); 
            -webkit-transform: scale(2); 
            -o-transform: scale(2); 
            transform: scale(2);
            padding: 10px;
        }
        .checkboxtext {
            font-size: 110%;
            display: inline;
        }
    </style>
    <div class="page-header">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                    <span>Maintain PA TAG
                 <button id="btnSearchPATAG" class="btn btn-secondary" type="button" data-toggle="modal">
                     <i class="glyphicon glyphicon-search"></i>
                 </button>
                    </span>
                </div>
                <div class="col-md-8 col-xs-8" style="text-align: right">
                </div>
            </div>
        </div>

        <div class="row CheckPermission">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                    <button id="btnNewPATAG" class="btn btn-success" type="button">New</button>
                </div>

                <div class="col-md-8 col-xs-8" style="text-align: right">
                    <button id="btnSubmitPATAG" class="btn btn-warning" type="button">Save</button>
                    <button id="btnSavePATAG" class="btn btn-warning" type="button">Save</button>
                </div>
            </div>
        </div>
    </div>
    <!----End Header---->


        <div class="panel-group">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 style="margin-left: 5px;">ข้อมูลรถยนต์</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <%--<div class="col-md-3 col-xs-12">--%>
                               <%-- <div class="col-md-12 col-sm-12 col-xs-12">--%>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="main-img-preview" style="text-align:center;margin-bottom:20px;">
                                            <a href="javascript:void(0)" id="Car_Image">
                                                <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <div class="carousel-item active">
                                                            <%--<img class="" src="..." alt="First slide">--%>

                                                            <img class="d-block w-100 img-preview rounded img-thumbnail" src="images/car.png" style="height:300px;" alt="IMAGE" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                            <p  style="font-size:18px;">คลิกที่ภาพเพื่ออัพโหลดรูปภาพรถ</p>
                                            
                                            <%--<img class="thumbnail img-preview" src="images/car.png" alt="IMAGE" id="img-show" />--%>
                                            <div>
                                                <input type="file" name="IEmp_Profile" id="InputCar_Image" style="display: none">
                                                <input type="text" name="IEmp_Profile" id="InputCar_Image_OLD" disabled style="display: none">
                                            </div>
                                        </div>
                                         <hr />
                                    </div>
                           
                                <%--</div>--%>
                            <%--</div>--%>
                            <!--- End col-md-3 (Image) --->

                            <%--<div class="col-md-9 col-sm-9 col-xs-12">--%>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">รหัส PA TAG :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="PA_TAG_Code" type="text" class="form-control max-wide" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">ทะเบียนรถ :</label>
                                                </div>
                                                <div class="col-md-4 col-xs-12">
                                                    <input id="PA_TAG_CarID" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">ประเภทการซื้อ :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select id="PA_TAG_Asset_Type" class="form-control max-wide">
                                                        <option value="">===เลือก ประเภทการซื้อ ===</option>
                                                        <option value="เช่า">รถเช่า</option>
                                                        <option value="รถทรัพย์สิน">รถทรัพย์สิน</option>
                                                        <option value="รถส่วนตัว">รถส่วนตัว</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label" id="">ราคาซื้อ/เช่าต่อเดือน :</label>
                                                </div>
                                                <div class="col-md-4 col-xs-12">
                                                    <input id="PA_TAG_Price" type="text" value="0" data-type="currency" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" class="form-control max-wide" >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">วันที่ซื้อ/เช่า :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input placeholder="dd/mm/yyyy" id="PA_TAG_Start_DATE" type="text" class="form-control notText max-wide" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">วันที่ขาย/วันที่สิ้นสุดสัญญาเช่า :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input placeholder="dd/mm/yyyy" id="PA_TAG_End_DATE" type="text" class="form-control notText max-wide" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">เลขที่สัญญา :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="PA_TAG_Contact_ID" value="" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">เลขทะเบียนทรัพย์สิน :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="PA_TAG_Asset_Code" value="" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            <%--</div>--%>

                            <!--- End Col-md-9 --->

                        </div>
                        <!--- End Col-md-12--->

                        <%--<div class="col-md-12 col-sm-12 col-xs-12">--%>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="col-md-12 col-sm-12 col-xs-12">


                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">บริษัทผู้ถือครอง :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select id="PA_TAG_Company_Location" class="form-control max-wide">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">ยี่ห้อ :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select id="PA_TAG_Band" class="form-control max-wide">
                                                        <option value="">=== เลือกยี่ห้อ ===</option>
                                                        <option value="TOYOTA">Toyota</option>
                                                        <option value="NISSAN">Nissan</option>
                                                        <option value="FORD">Ford</option>
                                                        <option value="HONDA">Honda</option>
                                                        <option value="HYUNDAI">Hyundai</option>
                                                        <option value="ISUZU">Isuzu</option>
                                                        <option value="KIA">Kia</option>
                                                        <option value="LEXUS">Lexus</option>
                                                        <option value="MAZDA">Mazda</option>
                                                        <option value="MITSUBISHI">Mitsubishi</option>
                                                        <option value="SUBARU">Subaru</option>
                                                        <option value="SUZUKI">Suzuki</option>
                                                        <option value="BMW">BMW</option>
                                                        <option value="VOlKSWAGEN">Volkswagen</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">รุ่น :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="PA_TAG_Model" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">ประเภทรถ :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select id="PA_TAG_Type_Car" class="form-control max-wide">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">ประเภทภาษี :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select id="PA_TAG_TAX" class="form-control max-wide">
                                                        <option value="">=== เลือกประเภทภาษี ===</option>
                                                        <option value="รย.1 - รถยนต์นั่งส่วนบุคคลไม่เกิน 7">รย.1 - รถยนต์นั่งส่วนบุคคลไม่เกิน 7</option>
                                                        <option value="รย.2 - รถยนต์นั่งส่วนบุคคลเกิน 7 คน">รย.2 - รถยนต์นั่งส่วนบุคคลเกิน 7 คน</option>
                                                        <option value="รย.3 – รถยนต์บรรทุกส่วนบุคคล">รย.3 – รถยนต์บรรทุกส่วนบุคคล</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">ลักษณะ :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select id="PA_TAG_Type_TAX" class="form-control max-wide">
                                                        <option value="">=== เลือกลักษณะ ===</option>
                                                        <option value="กระบะบรรทุก">กระบะบรรทุก</option>
                                                        <option value="กระบะบรรทุก(มีเครื่องทุ่นแรง)">กระบะบรรทุก(มีเครื่องทุ่นแรง)</option>
                                                        <option value="กระบะบรรทุกมีข้างเสริมมีเครื่องทุนแรง">กระบะบรรทุกมีข้างเสริมมีเครื่องทุนแรง</option>
                                                        <option value="กระบะบรรทุก(มีข้างเสริม)ติดหลังคา">กระบะบรรทุก(มีข้างเสริม)ติดหลังคา</option>
                                                        <option value="กระบะบรรทุก มีหลังคา">กระบะบรรทุก มีหลังคา</option>
                                                        <option value="นั่งสองแถว">นั่งสองแถว</option>
                                                        <option value="นั่งสองตอนสองแถว">นั่งสองตอนสองแถว</option>
                                                        <option value="นั่งสองตอนท้ายบรรทุก">นั่งสองตอนท้ายบรรทุก</option>
                                                        <option value="นั่งสามตอน">นั่งสามตอน</option>
                                                        <option value="เก๋งสองตอน">เก๋งสองตอน</option>
                                                        <option value="เก๋งสองตอนแวน">เก๋งสองตอนแวน</option>
                                                        <option value="ตู้นั่งสี่ตอน">ตู้นั่งสี่ตอน</option>
                                                        <option value="ตู้นั่งสามตอน">ตู้นั่งสามตอน</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">Charge :</label>
                                                </div>
                                                <div class="col-md-8  col-xs-12">
                                                    <div class="input-group">
                                                        <input id="PA_TAG_CHARGE" type="text" class="form-control max-wide" disabled>
                                                        <div class="input-group-btn">
                                                            <button id="Browse_PA_TAG_CHARGE" class="btn btn-default" type="button">
                                                                <i class="glyphicon glyphicon-search"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">ชื่อผู้ขาย/เช่า :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="PA_TAG_Name_Sell" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">เลขตัวถัง :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="PA_TAG_MAC" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">เลขเครื่องยนต์ :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="PA_TAG_ENG" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">สถานะรถ :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select id="PA_TAG_Status" class="form-control max-wide">
                                                        <option>Active</option>
                                                        <option>In Active</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">สถานะขาย :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select id="PA_TAG_Car_Status" class="form-control max-wide">
                                                        <option value="">=== เลือกสถานะการขาย ===</option>
                                                        <option value="ขาย (ตัดทรัพย์สินแล้ว)">ขาย (ตัดทรัพย์สินแล้ว)</option>
                                                        <option value="อยู่ระหว่างดำเนินการ">อยู่ระหว่างดำเนินการ</option>
                                                        <option value="ยกเลิกการเช่า">ยกเลิกการเช่า</option>
                                                        <%-- Mockup Data --%>
                                                    </select>
                                                    <%--<input type="checkbox" id="PA_TAG_Car_Status" class="form-check-input" style="margin-top: 7px;">--%>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <%-- <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">บริษัทผู้ถือครอง :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <select  id="PA_TAG_Company_Location" class="form-control max-wide">

                                                    </select>
                                                </div>
                                            </div>--%>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">Fleet No :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="FleetNo" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">Easy Pass No :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="EasypassNo" type="text" class="form-control max-wide">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="display:none">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">รอบต่อประกัน :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input placeholder="dd/mm/yyyy" id="txtDropinsurance_Date" type="text" class="form-control notText max-wide" autocomplete="off" disabled>
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">รอบต่อภาษี :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12  date" data-provide="datepicker">
                                                    <div class="input-group">
                                                        <input placeholder="dd/mm/yyyy" id="txtTax_Date" type="text" class="form-control notText max-wide" autocomplete="off" disabled>
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">รายละเอียด :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <div class="form-group">
                                                        <textarea class="form-control max-wide" id="PA_TAG_DETAIL" rows="3"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <%--<div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">หมายเหตุ :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <div class="form-group">
                                                        <textarea class="form-control max-wide" id="PA_TAG_REMARK" rows="3"></textarea>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <%--<div class="col-md-6 col-xs-12">
                                            <div class="row form-group">
                                                <div class="col-md-3 col-xs-12">
                                                    <label class="control-label">S/N :</label>
                                                </div>
                                                <div class="col-md-8 col-xs-12">
                                                    <input id="PA_TAG_SN" type="text" class="form-control max-wide" value="">
                                                </div>
                                            </div>
                                        </div>--%>
                                </div>
                                <div class="row">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--- End Col-md-12 --->
            </div>
        <%--</div>--%>

    <!---------End Group---------->
    <div class="panel-group" >
        <div class="panel nav-tab panel-default" style="margin-top: 2em;">
            <div class="panel-heading" id="divTab" style="display:none">
                <ul class="nav nav-tabs">
                    <li class="nav-item active">
                        <a href="#TAB1" class="nav-link disabled-tab" role="tab" data-toggle="tab">ผู้ครอบครอง</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB2" class="nav-link disabled-tab" data-toggle="tab" role="tab">ข้อมูลต่อภาษี</a>
                    </li>
                    <li class="nav-item">
                        <a href="#TAB3" class="nav-link disabled-tab" data-toggle="tab" role="tab">ข้อมูลการต่อประกันและพรบ.</a>
                    </li>
                    <li class="nav-item" >
                        <a href="#TAB4" class="nav-link disabled-tab" data-toggle="tab" role="tab">ข้อมูลซ่อมบำรุง</a>
                    </li>
                    <%--    <li class="nav-item ">
                        <a href="#TAB5" class="nav-link" data-toggle="tab" role="tab">ข้อมูลการใช้น้ำมัน</a>
                    </li>
                    <li class="nav-item ">
                        <a href="#TAB6" class="nav-link" data-toggle="tab" role="tab">ข้อมูลการใช้บัตร Easy Pass</a>
                    </li>--%>
                </ul>

                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="TAB1">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">ข้อมูลครอบครอง</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button class="btn btn-success" id="btnNewModalCar_Owner" data-type="New" type="button">New</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="tableCar_owner">
                                                        <thead>
                                                            <tr>
                                                                <th>รหัสพนักงาน</th>
                                                                <th>ชื่อ</th>
                                                                <th>Cost Center</th>
                                                                <th>ชื่อตำแหน่ง	</th>
                                                                <th>ระดับ</th>
                                                                <th>วันที่</th>
                                                                <th>รายละเอียด</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListCar_owner">
                                                            <tr>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!--================End Tab Car_owner ข้อมูลผู้ครอบครอง=====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB2">
                            <div class="panel-group">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">ข้อมูลต่อภาษี</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button id="btnNewModalCar_Tax" class="btn btn-success" data-type="Car_Tax" data-nametype="ข้อมูลต่อภาษี" type="button">New</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="tableCar_Tax">
                                                        <thead>
                                                            <tr>
                                                                <th>รายละเอียด</th>
                                                                <th>ราคา</th>
                                                                <th>วันที่เริ่ม(ภาษี)</th>
                                                                <th>วันที่หมดอายุ(ภาษี)</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListCar_Tax">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab Car_Tax ข้อมูลต่อภาษี=====================-->
                        
                        <div class="tab-pane fade" role="tabpanel" id="TAB3">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">ข้อมูลการต่อประกันและพรบ.</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">

                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button id="btnModalCar_Insurance" data-type="Car_Insurance" data-nametype="ข้อมูลการต่อประกัน" class="btn btn-success" type="button">New</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="tableCar_Insurance">
                                                        <thead>
                                                            <tr>
                                                                <th>รายละเอียด</th>
                                                                <th>วันที่เริ่ม(ประกัน)</th>
                                                                <th>วันที่หมดอายุ(ประกัน)</th>
                                                                <th>วันที่เริ่ม(พรบ.)</th>
                                                                <th>วันที่หมดอายุ(พรบ.)</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListCar_Insurance">
                                                            <tr>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!--================End Tab ข้อมูลการต่อประกัน=====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB4">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">ข้อมูลซ่อมบำรุง</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <%--<button id="btnModalCar_MA" data-type="Car_MA" data-nametype="ข้อมูลซ่อมบำรุง" class="btn btn-success" type="button">New</button>--%>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="tableCar_MA">
                                                        <thead>
                                                            <tr>
                                                                <th>K2 ID</th>
                                                                <th>Subject</th>
                                                                <th>วันที่</th>
                                                                <th>เลขไมล์</th>
                                                                <th>ชื่อ Suppiler</th>
                                                                <th>ประเภทการซ่อม</th>
                                                                <th>ราคา</th>
                                                                <th>แก้ไขข้อมูล</th>
                                                                <th>ไฟล์แนบ</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListCar_MA">
                                                            <tr>
                                                              <%--  <td><a href="http://pk-flow/application_Software_Space/HR-Human%20resource/HR09-CarRepairingRequest.aspx?WT=HR09&Site_Ref=ERP_PK&ID=1506&K2=1837899&TypeK2=K2&FlowType=S" target="_blank">1837899</a></td>
                                                                <td>เปลี่ยน ยาง จำนวน 4 เส้น,เช็คระยะ ถ่ายน้ำมันเครื่อง ตามรอบ </td>
                                                                <td>10/03/2021 11:05:05 AM</td>
                                                                <td>331,368.72</td>
                                                                <td>บี ควิก</td>
                                                                <td>เปลี่ยนยาง</td>
                                                                <td>1,738.32</td>
                                                                <td><button type="button" class="btn btn-success btn-margin-left btnModalMA" data-id="2">Show</button></td>--%>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Tab Car_MA ข้อมูลซ่อมบำรุง=====================-->
                        <%--  <div class="tab-pane fade" role="tabpanel" id="TAB5">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">ข้อมูลการใช้น้ำมัน</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">

                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button id="btnModalCar_Oil" data-type="Car_Refuel" data-nametype="ข้อมูลการใช้น้ำมัน" class="btn btn-success" type="button">New</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="tableCar_Refuel">
                                                        <thead>
                                                            <tr>
                                                                <th>ปี</th>
                                                                <th>เดือน</th>
                                                                <th>ปริมาณ (ลิตร)</th>
                                                                <th>จำนวนเงิน (บาท)</th>
                                                                <th>ภาษีมูลค่าเพิ่ม</th>
                                                                <th>จำนวนเงินรวมภาษีมูลค่าเพิ่ม</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListtableCar_Refuel">
                                                            <tr>
                                                                <td>2013</td>
                                                                <td><a href="PA_TAG_FLEETCARD_REPORT.aspx?ids=PU080002&amp;year=2013&amp;month=2" target="_blank" style="color: Red; font-weight: bold;">February</a></td>
                                                                <td>362.8</td>
                                                                <td>10940</td>
                                                                <td>715.72</td>
                                                                <td>10224.28</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--================End Tab Car_Refuel ข้อมูลการใช้น้ำมัน=====================-->
                        <div class="tab-pane fade" role="tabpanel" id="TAB6">
                            <div class="panel-group">
                                <div class="panel  panel-primary">
                                    <div class="panel-heading">
                                        <h4 style="font-weight: bold;">ข้อมูลการใช้บัตร Easy Pass</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <div class="row form-group">
                                                <div class="col-md-4 col-xs-4" style="text-align: left; font-size: 30px;">
                                                </div>
                                                <div class="col-md-8 col-xs-8" style="text-align: right">
                                                    <button id="btnModalCar_Easypass" data-nametype="ข้อมูลการใช้บัตร Easy Pass" class="btn btn-success" type="button">New</button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-bordered" id="tableCar_Easypass">
                                                        <thead>
                                                            <tr>
                                                                <th>ปี</th>
                                                                <th>เดือน</th>
                                                                <th>จำนวนเงิน (บาท)</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="ListtableCar_Easypass">
                                                            <tr>
                                                                <td>2013</td>
                                                                <td><a href="PA_TAG_EASYPASS_REPORT.aspx?ids=PU080002&amp;year=2013&amp;month=11" target="_blank" style="color: Red; font-weight: bold;">November</a></td>
                                                                <td>505</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <!--================End Tab Car_Easypass ข้อมูลการใช้บัตรEasy Pass=====================-->
                    </div>
                </div>
            </div>
        </div>
    </div>


    
    <%--Modal Car_Owner--%>
    <div class="modal fade" id="ModalCar_Owner" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-sm" style="width: 50%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-8 col-lg-6 col-sm-12">
                            <h4 class="modal-title"><span id="TitleCar_Owner"></span>: ข้อมูลครอบครอง </h4>
                        </div>
                        <div class="col-md-4 col-lg-6 col-sm-12" style="float:right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="float:inherit;margin-left:3px;">Close</button>
                            <button type="button" id="btnSavePE" class="btn btn-warning"  style="float:inherit;margin-left:3px;">Save</button>
                            <button type="button" id="btnSubmitPE" class="btn btn-warning" style="float:inherit;margin-left:3px;">Save</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body">
                    <div class="row">

                        <input id="PA_PE_ID" type="text" class="form-control max-wide" disabled style="display: none">
                        <input id="txtCarOwner_UserAD" type="text" class="form-control max-wide" disabled style="display: none">
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">รหัสพนักงาน:</label>
                            </div>
                            <div class="col-md-9">
                                <div class="input-group">
                                    <input id="txtCarOwner_EmpNum" type="text" class="form-control max-wide" disabled>
                                    <div class="input-group-btn">
                                        <button id="btnmodalBrowseEmployee" class="btn btn-default" type="button">
                                            <i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">ชื่อพนักงาน:</label>
                            </div>
                            <div class="col-md-9">
                                <input id="txtCarOwner_Empname" type="text" class="form-control max-wide" disabled>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">CostCenter:</label>
                            </div>
                            <div class="col-md-9">
                                <input id="txtCarOwner_CostCenter" type="text" class="form-control max-wide" disabled>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">วันที่:</label>
                            </div>
                            <div class="col-md-9 date" data-provide="datepicker">
                                <input placeholder="dd/mm/yyyy" id="txtCarOwner_Date" type="text" class="form-control notText max-wide" autocomplete="off">
                                <%-- <div class="input-group">
                                    <input placeholder="dd/mm/yyyy" id="txtCarOwner_Date" type="text" class="form-control notText max-wide" autocomplete="off">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>--%>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-3">
                                <label class="control-label" style="font-size: 13px">รายละเอียด:</label>
                            </div>
                            <div class="col-md-9 ">
                                <textarea id="txtCarOwner_Detail" class="form-control max-wide" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>


    <%--Modal Car_Tax--%>
    <div class="modal fade" id="ModalCar_Tax" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 90%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title"><span id="TitleCar_Tax"></span>: ข้อมูลต่อภาษี </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">

                            <button type="button" class="btn btn-warning" id="SaveTax">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-7">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">ข้อมูล</h4>
                                </div>
                                <div class="panel-body">

                                    <input id="PA_Tax_ID" type="text" class="form-control max-wide" autocomplete="off" style="display: none;">
                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3">
                                            <label class="control-label" style="font-size: 13px">วันที่เริ่ม (ภาษีรถ) : </label>
                                        </div>
                                        <div class="col-md-9">
                                            <input id="PA_TAX_Start_Date" type="text" class="form-control max-wide" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3">
                                            <label class="control-label" style="font-size: 13px">วันที่หมด(ภาษีรถ) : </label>
                                        </div>
                                        <div class="col-md-9">
                                            <input id="PA_TAX_End_Date" type="text" class="form-control max-wide" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3">
                                            <label class="control-label" style="font-size: 13px">ค่าใช้จ่าย(ภาษีรถ)	: </label>
                                        </div>
                                        <div class="col-md-9">
                                            <input id="PA_TAX_Price" value="0" data-type="currency" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" type="text" class="form-control max-wide" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3">
                                            <label class="control-label" style="font-size: 13px">รายละเอียด : </label>
                                        </div>
                                        <div class="col-md-9">
                                            <textarea class="form-control max-wide" id="PA_TAX_Detail" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-4 col-xs-4" style="text-align: left;">
                                                <h4 style="font-weight: bold;">แนบเอกสาร</h4>
                                            </div>
                                            <div class="col-md-8 col-xs-8" style="text-align: right">
                                                <input type="file" id="addAttach" class="form-control max-wide EmpImg inputFile att-margin" style="display: none">
                                                <button type="button" class="btn btn-info" style="width: 50px;" onclick="document.getElementById('addAttach').click();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row form-group">

                                            <table class="table  table-striped">
                                                <thead>
                                                </thead>
                                                <tbody id="ListAttachTAX">
                                                </tbody>
                                                <tbody id="ListAttachTAX_OLD">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <%--Modal Insurance--%>
    <div class="modal fade" id="ModalCarInsurance" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 90%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title"><span id="TitleCar_Insurance"></span>: ข้อมูลการประกันและพรบ. </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                    <button type="button" class="btn btn-warning" id="SaveINS">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-7">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">ข้อมูล</h4>
                                </div>
                                <div class="panel-body">

                                    <input id="INS_ID" type="text" class="form-control max-wide" autocomplete="off" style="display: none;">

                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">รายละเอียด:</label>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="form-group">
                                                    <textarea id="PA_INS_Detail" class="form-control max-wide" rows="3"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">วันที่เริ่ม(ประกัน) :</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input placeholder="dd/mm/yyyy" id="PA_INS_Start_Date_Insurance" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">วันที่หมด(ประกัน) :</label>
                                            </div>
                                            <div class="col-md-9" data-provide="datepicker">

                                                <input placeholder="dd/mm/yyyy" id="PA_INS_End_Date_Insurance" type="text" class="form-control  max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">หมายเลขกรมธรรม์(ประกัน)</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="PA_INS_Serial_Insurance" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">ค่าใช้จ่าย(ประกัน)</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="PA_INS_Price_Insurance" type="text"  value="0" data-type="currency" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">วันที่เริ่ม(พรบ.)</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input placeholder="dd/mm/yyyy" id="PA_INS_Start_Date_Act" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">วันที่หมด(พรบ.)</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input placeholder="dd/mm/yyyy" id="PA_INS_End_Date_Act" type="text" class="form-control  max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">หมายเลขกรมธรรม์(พรบ.)</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="PA_INS_Serial_Act" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">ค่าใช้จ่าย(พรบ.)</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="PA_INS_Price_Act" type="text" class="form-control  value="0" data-type="currency" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-3">
                                                <label class="control-label" style="font-size: 13px">บริษัทประกัน</label>
                                            </div>
                                            <div class="col-md-9">
                                                <input id="PA_INS_Name_Insurance" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-4 col-xs-4" style="text-align: left;">
                                                <h4 style="font-weight: bold;">แนบเอกสาร</h4>
                                            </div>
                                            <div class="col-md-8 col-xs-8" style="text-align: right">
                                                <input type="file" id="addAttach_INS" class="form-control max-wide EmpImg inputFile att-margin" style="display: none">
                                                <button type="button" class="btn btn-info" style="width: 50px;" onclick="document.getElementById('addAttach_INS').click();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row form-group">

                                            <table class="table  table-striped">
                                                <thead>
                                                </thead>
                                                <tbody id="ListAttachINS">
                                                </tbody>
                                                <tbody id="ListAttachINS_OLD">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <%--Modal Insurance--%>
    <div class="modal fade" id="ModalCarMA" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title"><span id="TitleCar_MA"></span>: ข้อมูลซ่อมบำรุง</h4>
                            <span style="color:red;">*แก้ไขเฉพาะ PATAG ไม่ส่งผลต่อข้อมูลที่ K2*</span>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                    <button type="button" class="btn btn-warning" id="SaveEdit_MA">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height:80%;">
                <%--<div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%; max-height:80%;">--%>
                    <div class="panel-group">
                        <div class="col-md-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">ข้อมูล</h4>
                                </div>
                                <div class="panel-body">

                                    <input id="Edit_MA_ID" type="text" class="form-control max-wide" autocomplete="off" style="display:none">
                                    <input id="Edit_MA_K2" type="text" class="form-control max-wide" autocomplete="off" style="display:none">

                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">ชื่อ Suppiler	</label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <select id="PA_MA_SUPPLIER" class="form-control max-wide">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">ประเภทการซ่อม :</label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <select id="Repair_Type" class="form-control max-wide">
                                                        <option value="">==== Please Select ====</option>
                                                        <option value="Maintenance by distance (ซ่อมบารุงตามระยะทาง)">Maintenance by distance (ซ่อมบารุงตามระยะทาง)</option>
                                                        <option value="Wheel Alignment (ตั้งศูนย์ถ่วงล้อ)">Wheel Alignment (ตั้งศูนย์ถ่วงล้อ)</option>
                                                        <option value="Air conditioning Repair (ซ่อมเครื่องปรับอากาศรถ)">Air conditioning Repair (ซ่อมเครื่องปรับอากาศรถ)</option>
                                                        <option value="Change the Tire (เปลี่ยนยาง)">Change the Tire (เปลี่ยนยาง)</option>
                                                        <option value="Car Insurance Claim">Car Insurance Claim</option>
                                                        <option value="Other(อื่นๆ)">Other(อื่นๆ)</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">ราคา</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="PA_MA_PRICE" value="0" data-type="currency" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">เลขไมล์</label>
                                            </div>
                                            <div class="col-md-10">
                                                <input id="PA_MA_MILE" type="text" class="form-control max-wide" autocomplete="off">
                                            </div>
                                        </div>

                                     
                                          
                                        <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">วันที่ซ่อม :</label>
                                            </div>
                                            <div class="col-md-10">
                                                   <div class="input-group">
                                                       <input placeholder="dd/mm/yyyy" id="PA_MA_DATE" type="text" class="form-control max-wide" autocomplete="off">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                
                                            </div>
                                        </div>
                                           <div class="col-md-12 form-group">
                                            <div class="col-md-2">
                                                <label class="control-label" style="font-size: 13px">รายละเอียด:</label>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="form-group">
                                                    <textarea id="PA_MA_DETAIL" class="form-control max-wide" rows="3"></textarea>
                                                </div>
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
                </div>
            </div>
        </div>
    </div>

    <%--Modal EasyPass--%>
    <div class="modal fade" id="ModalCarEasyPass" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-sm" style="width: 70%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">New: ข้อมูลการใช้EasyPass </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">

                    <div class="panel-group">
                        <div class="col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">ข้อมูล</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3">
                                            <label class="control-label" style="font-size: 13px">สาขาที่ตั้ง : </label>
                                        </div>
                                        <div class="col-md-9">
                                            <input id="txtEasyPass_Location" type="text" class="form-control max-wide" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3">
                                            <label class="control-label" style="font-size: 13px">เวลา : </label>
                                        </div>
                                        <div class="col-md-9">
                                            <input id="txtEasyPass_Time" type="text" class="form-control max-wide" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <div class="col-md-3">
                                            <label class="control-label" style="font-size: 13px">ราคา : </label>
                                        </div>
                                        <div class="col-md-9">
                                            <input id="txtEasyPass_Price" type="text" value="0" data-type="currency" pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" class="form-control max-wide" autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">แนบเอกสาร</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row form-group">
                                            <div style="margin-left: 1rem;" class="row">
                                                <p style="margin: 1rem; float: left;">Add File : </p>
                                                <button type="button" class="btn btn-info" style="width: 50px; margin-bottom: 1rem;" onclick="addAttachEasyPass()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                            </div>
                                            <table class="table  table-striped">
                                                <thead>
                                                </thead>
                                                <tbody id="ListAttach_EasyPass">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="SaveAttch_EasyPass">Save</button>
                </div>
            </div>
        </div>
    </div>
    
    <%--modal PATAG Charge  --%>
    <div class="modal fade" id="modalBrowseCharge" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" style="width: 70%;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">PA TAG Charge</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group col-md-2 col-sm-12">
                            <label class="control-label" style="font-size: 13px">Charge: </label>
                        </div>
                        <div class="form-group col-md-10  col-sm-12">
                            <input type="text" id="SearchCharge" placeholder="Search..." class="form-control max-wide" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListCharge" class="table table-striped table-hover table-bordered table-responsive">
                        <thead>
                            <tr class="header">
                                <th>Charge Code</th>
                                <th>Detail</th>
                                <th>Descption</th>
                                <th>Value</th>
                            </tr>
                        </thead>
                        <tbody id='TBbodyCharge'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    
    <%--modal PATAG  --%>
    <div class="modal fade" id="modalBrowsePATAG" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" style="width: 70%;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 id="browseHeader" class="modal-title">PA TAG Search</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">

                   <%--     <div class="form-group col-md-9  col-sm-12">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <select class="form-control" id="fillterSearch" style="width: 120px;">
                                        <option value="">ALL</option>
                                        <option value="[PA_TAG_Code]">PATAG</option>
                                        <option value="[PA_TAG_CarID]">ทะเบียนรถ</option>
                                    </select>
                                </div>
                                <!-- /btn-group -->
                            <input type="text" id="SearchPATAG" placeholder="Search for Patag.." class="form-control max-wide" autocomplete="off">
                            </div>
                        </div>--%>
                        
                            <input type="text" id="SearchPATAG" placeholder="Search for PATAG,ทะเบียนรถ,รายละเอียด..." class="form-control max-wide" autocomplete="off">
                    </div>
           
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListBrowse" style="width:100%" class="table table-striped table-hover table-bordered table-responsive">
                        <thead>
                            <tr class="header">
                                <th>รหัส PA TAG</th>
                                <th>ทะเบียนรถ	</th>
                                <th style="width: 50%">รายละเอียด	</th>
                                <%--<th>Band</th>--%>
<%--                                <th>Model</th>--%>
                            </tr>
                        </thead>
                        <tbody id='TBbodyBrowse'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%--Start Employee--%>
    <div class="modal fade" id="modalBrowseEmployee" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-xs">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12" style="margin-bottom: 1em;">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Search Employee</h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="form-group col-md-12 col-lg-12 col-sm-12">
                            <input type="text" id="search_username" placeholder="Search.." class="form-control max-wide" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <table id="TbListBrowseEmployee" class="table table-striped table-bordered table-responsive">
                        <thead>
                            <tr class="header">
                                <th style="width: 20%">EmpNum</th>
                                <th>Name</th>
                                <th>CostCenter</th>
                            </tr>
                        </thead>
                        <tbody id='TBbodyBrowseEmployee'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--End Browse Modal--%>
    
    <%--Modal Car_MA--%>
    <div class="modal fade" id="ModalMA" role="dialog" data-backdrop="static" data-keyboard="false" style="align-content: center; margin-top: 15px;">
        <div class="modal-dialog modal-lg" style="width: 90%; margin: auto;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="col-md-9 col-lg-9 col-sm-12">
                            <h4 class="modal-title">Car Service Attach File </h4>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12" style="text-align: right;">
                            
                            <button type="button" class="btn btn-warning" id="SaveMA">Save</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
                <%--End modal Header--%>
                <div class="modal-body" style="overflow-y: auto; max-height: 28em; max-width: 100%;">
                    <div class="panel-group">
                        <div class="col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 style="font-weight: bold;">K2</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row form-group">
                                            <table class="table  table-striped">
                                                <thead>
                                                </thead>
                                                <tbody id="ListAttachMA_K2">
                                                    <%--http://pkflow01/PathDownload/" + getWorkflowTYPE + "-" + getWorkflowID + "/" + FileName--%>
                                                    <tr><td><a href="http://pkflow01/PathDownload/PJ02-131039/WI-IT-189%20%E0%B8%84%E0%B8%B9%E0%B9%88%E0%B8%A1%E0%B8%B7%E0%B8%AD%20Weekly%20Report%20Safety.doc" target="_blank">WI-IT-189 คู่มือ Weekly Report Safety.pdf</a></td></tr>
                                                    <tr><td><a href="http://pkflow01/PathDownload/SG02_01-213/Content%20PKT-09.jpg" target="_blank">Content PKT-09.jpg</a></td></tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <input id="MA_ID" type="text" class="form-control max-wide"  style="display: none">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-md-4 col-xs-4" style="text-align: left;">
                                                <h4 style="font-weight: bold;">แนบเอกสาร</h4>
                                            </div>
                                            <div class="col-md-8 col-xs-8" style="text-align: right">
                                                <input type="file" id="addAttachMA" class="form-control max-wide EmpImg inputFile att-margin" style="display: none">
                                                <button type="button" class="btn btn-info" style="width: 50px;" onclick="document.getElementById('addAttachMA').click();"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row form-group">
                                            <table class="table  table-striped">
                                                <thead>
                                                </thead>
                                                <tbody id="ListAttachMA">
                                                </tbody>
                                                <tbody id="ListAttachMA_OLD">
                                                    <tr><td><a href="" target="_blank">เอกสารใบเสร็จเพิ่มเติม.png</a></td></tr>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Modal Body --%>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {
            SetDatePicker();
            GetSieteRef();
            GetPA_TAG_Type_Car();
            GetPA_TAG_ServiceCenter();
            SetinputCurrency();
            Checkpermission();

            var TbListBrowse = $('#TbListBrowse').DataTable({
                searching: false,
                lengthChange: false,
                responsive: true
            });

            var GETParams_PATAG = getAllUrlParams("PATAG");
            var GETParams_NewPATAG = getAllUrlParams("NewPATAG");

            
            //======Have Get ParamPatag?======
            if (GETParams_PATAG) {
                GETPATAG(GETParams_PATAG);
                GETPATAG_PE(GETParams_PATAG);
                GETPATAG_TAX(GETParams_PATAG);
                GETPATAG_INS(GETParams_PATAG);
                GET_PATAG_MA(GETParams_PATAG);
                $("#divTab").css("display", "block");
                $("#btnSubmitPATAG").css("display", "none");
                console.log(GETParams_PATAG)
            } else if(GETParams_NewPATAG) {
                $('.nav li').not('.active').addClass('disabled');
                $('.nav li').not('.active').find('a').removeAttr("data-toggle");
                $("#btnNewModalCar_Owner").css("display", "none");
                $("#btnSavePATAG").css("display", "none");
                console.log(GETParams_NewPATAG)
            }else {
                $('.nav li').not('.active').addClass('disabled');
                $('.nav li').not('.active').find('a').removeAttr("data-toggle");
                $("#btnNewModalCar_Owner").css("display", "none");
                $("#btnSavePATAG").css("display", "none");
                showSearch('');
                console.log('Normal')
            }
            

            $("#btnSearchPATAG").on("click", function () {
                $("#SearchPATAG").val('');
                //$("#fillterSearch").val('');
                showSearch('');
            });
            $("#SearchPATAG").on("change", function () {
                var SearchPATAG = $("#SearchPATAG").val();
                //var fillterSearch = $("#fillterSearch").val();
                showSearch(SearchPATAG);
            });
          
            $("#PA_TAG_Price").on("focus", function () {
                $("#PA_TAG_Price").val(removeCurrency($("#PA_TAG_Price").val()));
            });
            $("#PA_TAG_Price").on("focusout", function () {
                $("#PA_TAG_Price").val(Currency($("#PA_TAG_Price").val()));
            }); 

            $("#btnNewPATAG").on("click", function () {
                window.location.href = "PATAG.aspx?NewPATAG=NEW";
            });
            $("#Browse_PA_TAG_CHARGE").on("click", function () {
                $("#SearchCharge").val('');
                GetCharge('');
                $("#modalBrowseCharge").modal("show");
            });
            $("#btnNewModalCar_Tax").on("click", function () {
                $("#PA_Tax_ID").val('0');
                $("#PA_TAX_Detail").val('');
                $("#PA_TAX_Start_Date").val('');
                $("#PA_TAX_End_Date").val('');
                $("#PA_TAX_End_Date").val('');
                $("#PA_TAX_Price").val('');
                $("#ListAttachTAX").empty();
                $("#ListAttachTAX_OLD").empty();
                $("#TitleCar_Tax").text("NEW");
                $("#ModalCar_Tax").modal("show");
            });

              //$("#btnModalCar_Oil").on("click", function () {
            //    $("#ModalCarOil").modal("show");
            //});
            //$("#btnModalCar_Easypass").on("click", function () {
            //    $("#ModalCarEasyPass").modal("show");
            //});

            $("#btnModalCar_Insurance").on("click", function () {
                $("#PA_INS_Detail").val('');
                $("#PA_INS_Start_Date_Insurance").val('');
                $("#PA_INS_End_Date_Insurance").val('');
                $("#PA_INS_Start_Date_Act").val('');
                $("#PA_INS_End_Date_Act").val('');
                $("#PA_INS_Price_Insurance").val('');
                $("#PA_INS_Name_Insurance").val('');
                $("#PA_INS_Serial_Insurance").val('');
                $("#PA_INS_Price_Act").val('');
                $("#INS_ID").val(0);
                $("#ListAttachINS").empty();
                $("#ListAttachINS_OLD").empty();
                $("#TitleCar_Insurance").text("NEW");
                $("#ModalCarInsurance").modal("show");
            });

            $(document).on("click", ".btnEditModalCar_INS", function () {
                $("#TitleCar_Insurance").text("Edit");
                $("#ListAttachINS").empty();
                $("#ListAttachINS_OLD").empty();
                var INS_ID = $(this).attr("data-id");
                var PA_INS_Detail = $(this).closest("tr").find("td:nth-child(1)").text();
                var PA_INS_Start_Date_Insurance = $(this).closest("tr").find("td:nth-child(2)").text();
                var PA_INS_End_Date_Insurance = $(this).closest("tr").find("td:nth-child(3)").text();
                var PA_INS_Start_Date_Act = $(this).closest("tr").find("td:nth-child(4)").text();
                var PA_INS_End_Date_Act = $(this).closest("tr").find("td:nth-child(5)").text();
                var PA_INS_Name_Insurance = $(this).attr("data-PA_INS_Name_Insurance");
                var PA_INS_Serial_Insurance = $(this).attr("data-PA_INS_Serial_Insurance");
                var PA_INS_Price_Insurance = $(this).attr("data-PA_INS_Price_Insurance");
                var PA_INS_Price_Act = $(this).attr("data-PA_INS_Price_Act");
                $("#PA_INS_Detail").val(PA_INS_Detail);
                $("#PA_INS_Start_Date_Insurance").val(PA_INS_Start_Date_Insurance);
                $("#PA_INS_End_Date_Insurance").val(PA_INS_End_Date_Insurance);
                $("#PA_INS_Start_Date_Act").val(PA_INS_Start_Date_Act);
                $("#PA_INS_End_Date_Act").val(PA_INS_End_Date_Act);
                $("#PA_INS_Price_Insurance").val(PA_INS_Price_Insurance);
                $("#PA_INS_Name_Insurance").val(PA_INS_Name_Insurance);
                $("#PA_INS_Serial_Insurance").val(PA_INS_Serial_Insurance);
                $("#PA_INS_Price_Act").val(PA_INS_Price_Act);
                $("#INS_ID").val(INS_ID);
                GETPATAG_INS_IMAGE(INS_ID);
                $("#ModalCarInsurance").modal("show");
            });

            $(document).on("click", ".btnEditModalCar_MA", function () {;
                $("#TitleCar_MA").text("Edit");
                var ID = $(this).attr("data-id");
                var PA_MA_SUPPLIER = $(this).attr("data-PA_MA_SUPPLIER_ID"); 
                var K2ID = $(this).closest("tr").find("td:nth-child(1)").text();
                var PA_MA_DETAIL = $(this).closest("tr").find("td:nth-child(2)").text();
                var PA_MA_DATE = $(this).closest("tr").find("td:nth-child(3)").text();
                var PA_MA_MILE = $(this).closest("tr").find("td:nth-child(4)").text();
                var Repair_Type = $(this).closest("tr").find("td:nth-child(6)").text();
                var PA_MA_PRICE = $(this).closest("tr").find("td:nth-child(7)").text();
                $("#Edit_MA_ID").val(ID);
                $("#Edit_MA_K2").val(K2ID);
                $("#PA_MA_DETAIL").val(PA_MA_DETAIL);
                $("#PA_MA_DATE").val(PA_MA_DATE);
                $("#PA_MA_MILE").val(PA_MA_MILE);
                $("#PA_MA_SUPPLIER").val(PA_MA_SUPPLIER);
                $("#Repair_Type").val(Repair_Type);
                $("#PA_MA_PRICE").val(removeCurrency(PA_MA_PRICE));
                $("#ModalCarMA").modal("show");
            });



            $(document).on("click", ".btnModalMA", function () {
                var MA_ID = $(this).attr('data-id');
                var Flow_ID = $(this).attr('data-Flow_ID');
                $("#MA_ID").val(MA_ID);
                GETPATAG_MA_IMAGE(MA_ID);
                GETK2_MA_IMAGE(Flow_ID);
                $("#ListAttachMA").empty();
                $("#ModalMA").modal("show");
            });

            $("#SearchCharge").on("keyup", function () {
                var search = $("#SearchCharge").val();
                GetCharge(search);
                $("#modalBrowseCharge").modal("show");
            });

            $("#btnSubmitPATAG").on('click', function () {
                swal({
                    title: "ยืนยันการบันทึกข้อมูล",
                    icon: "info",
                    buttons: ['ยกเลิก', 'บันทึก'],
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        var Stauts = "Insert";
                        savePATAG(Stauts);; // <--- submit form programmatically
                    } else {
                    }
                })
                
            });
            $("#btnSavePATAG").on('click', function () {
                var Stauts = "Update";
                savePATAG(Stauts);
            });

            $(document).on("click", ".clickselectGetCharge", function () {
                var ChargeCode = $(this).closest("tr").find("td:nth-child(1)").text();
                $("#SearchCharge").val("");
                $("#PA_TAG_CHARGE").val(ChargeCode);
                $("#modalBrowseCharge").modal("hide");
            });

            $(document).on("click", ".clickselectPATAGBROWSE", function () {
                var PATAG = $(this).closest("tr").find("td:nth-child(1)").text();
                window.location.href = "PATAG.aspx?PATAG=" + PATAG;
            });

            $("#Car_Image").on('click', function () {
                $("#InputCar_Image").click();
            });

            $("#InputCar_Image").change(function () {
                var file_name = $(this).val().replace(/\\/g, '/').replace(/.*\//, '');
                var fileNameIndex = file_name.lastIndexOf("/") + 1;
                var dotIndex = file_name.lastIndexOf('.');
                var file_type = file_name.substr(dotIndex + 1, (file_name.length - 1) - dotIndex);
                var arr_type = ['jpg', 'jpeg', 'png'];

                file_name = file_name.substr(fileNameIndex, dotIndex < fileNameIndex ? file_name.length : dotIndex);
                if (arr_type.includes(file_type)) {
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) { $('#Car_Image .img-preview').attr('src', e.target.result); };
                        reader.readAsDataURL(this.files[0]);
                    }
                } else {
                    $("#InputCar_Image").val('');
                    swal("ไฟล์ไม่ถูกต้อง", "ประเภทไฟล์ที่ใช้ได้ jpg, jpeg และ png  เท่านั้น");
                }

            });



            $("#btnNewModalCar_Owner").on("click", function () {
                $("#TitleCar_Owner").text("NEW");
                $("#PA_PE_ID").val(0);
                $("#txtCarOwner_EmpNum").val('');
                $("#txtCarOwner_Empname").val('');
                $("#txtCarOwner_CostCenter").val('');
                $("#txtCarOwner_Date").val('');
                $("#txtCarOwner_Detail").val('');
                $("#btnSubmitPE").css("display", "none");
                $("#btnSavePE").css("display", "block");
                $("#ModalCar_Owner").modal("show");
            });


            $(document).on("click", ".btnEditModalCar_Owner", function () {
                $("#TitleCar_Owner").text("Edit");
                $("#btnSubmitPE").css("display", "block");
                $("#btnSavePE").css("display", "none");
                var empnum = $(this).closest("tr").find("td:nth-child(1)").text();
                var date = $(this).closest("tr").find("td:nth-child(6)").text();
                var UserAD = $(this).attr("data-userad");
                var Detail = $(this).attr("data-detail");
                var ID = $(this).attr("data-id");
                inputCarOwner(empnum);
                $("#PA_PE_ID").val(ID);
                $("#txtCarOwner_UserAD").val(UserAD);
                $("#txtCarOwner_EmpNum").val(empnum);
                $("#txtCarOwner_Date").val(date);
                $("#txtCarOwner_Detail").val(Detail);
                $("#ModalCar_Owner").modal("show");
            });



            $(document).on("click", ".btnEditModalCar_Tax", function () {
                var TaxID = $(this).attr("data-id");
                var PA_TAX_Detail = $(this).closest("tr").find("td:nth-child(1)").text();
                var PA_TAX_Price = $(this).closest("tr").find("td:nth-child(2)").text();
                var PA_TAX_Start_Date = $(this).closest("tr").find("td:nth-child(3)").text();
                var PA_TAX_End_Date = $(this).closest("tr").find("td:nth-child(4)").text();
                $("#PA_Tax_ID").val(TaxID);
                $("#PA_TAX_Detail").val(PA_TAX_Detail);
                $("#PA_TAX_Price").val(removeCurrency(PA_TAX_Price));
                $("#PA_TAX_Start_Date").val(PA_TAX_Start_Date);
                $("#PA_TAX_End_Date").val(PA_TAX_End_Date);
                $("#TitleCar_Tax").text("Edit");
                GETPATAG_TAX_IMAGE(TaxID);

                $("#ListAttachTAX").empty();
                $("#ModalCar_Tax").modal("show");
            });


          

            $("#btnSavePE").on("click", function () {
                var PA_PE_ID = 0;
                var PA_TAG_Code = $("#PA_TAG_Code").val();
                var PA_PE_Date = $("#txtCarOwner_Date").val();
                var PA_PE_Detail = $("#txtCarOwner_Detail").val();
                //var PA_PE_User = $("#txtCarOwner_UserAD").val();
                var PA_PE_User = $("#txtCarOwner_EmpNum").val();
                if (PA_TAG_Code != "" && txtCarOwner_EmpNum != "" && PA_PE_Date != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%=ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_PE") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: PA_PE_ID, PA_TAG_Code: PA_TAG_Code, PA_PE_User: PA_PE_User, PA_PE_Date: PA_PE_Date, PA_PE_Detail: PA_PE_Detail }),
                        success: function (response) {
                            var returnPATAG = response.d;
                            var name = $("#txtCarOwner_Empname").val();
                            swal("Complete", "บันทึกข้อมูล(" + PA_TAG_Code + ") ครอบครองโดย" + name + "", "success").then(function () {
                                GETPATAG_PE(PA_TAG_Code);
                                $("#ModalCar_Owner").modal("hide");
                            });
                        }
                    });
                } else {
                    swal("กรุณาข้อมูลให้ครบถ้วน", "", "warning");
                }
            });
            $("#btnSubmitPE").on("click", function () {
                var PA_PE_ID = $("#PA_PE_ID").val();
                var PA_TAG_Code = $("#PA_TAG_Code").val();
                var PA_PE_Date = $("#txtCarOwner_Date").val();
                var PA_PE_Detail = $("#txtCarOwner_Detail").val();
                //var PA_PE_User = $("#txtCarOwner_UserAD").val();
                var PA_PE_User = $("#txtCarOwner_EmpNum").val();
                if (PA_TAG_Code != "" && txtCarOwner_EmpNum != "" && PA_PE_Date != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%=ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_PE") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: PA_PE_ID, PA_TAG_Code: PA_TAG_Code, PA_PE_User: PA_PE_User, PA_PE_Date: PA_PE_Date, PA_PE_Detail: PA_PE_Detail }),
                        success: function (response) {
                            var returnPATAG = response.d;
                            var name = $("#txtCarOwner_Empname").val();
                            swal("Complete", "บันทึกข้อมูล(" + PA_TAG_Code + ") ครอบครองโดย" + name + "", "success").then(function () {
                                GETPATAG_PE(PA_TAG_Code);
                                $("#ModalCar_Owner").modal("hide");
                            });
                        }
                    });
                } else {
                    swal("กรุณาข้อมูลให้ครบถ้วน", "", "warning");
                }
            });

            $("#SaveEdit_MA").on("click", function () {
                var PA_TAG_Code = $("#PA_TAG_Code").val();
                var ID = $("#Edit_MA_ID").val();
                var K2 = $("#Edit_MA_K2").val();
                var Repair_Type = $("#Repair_Type").val();
                var PA_MA_DETAIL = $("#PA_MA_DETAIL").val();
                var PA_MA_DATE = $("#PA_MA_DATE").val();
                var PA_MA_SUPPLIER = $("#PA_MA_SUPPLIER").val();
                var PA_MA_PRICE = $("#PA_MA_PRICE").val();
                var PA_MA_MILE = $("#PA_MA_MILE").val();
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%=ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_MA") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: ID, Repair_Type: Repair_Type, PA_MA_DETAIL: PA_MA_DETAIL,
                            PA_MA_DATE: PA_MA_DATE, PA_MA_SUPPLIER: PA_MA_SUPPLIER,
                            PA_MA_PRICE: PA_MA_PRICE, PA_MA_MILE: PA_MA_MILE
                        }),
                        success: function (response) {
                            var returnPATAG = response.d;
                            swal("Complete", "แก้ไขประวัติการซ่อม K2 หมายเลข " + K2 + " (" + returnPATAG + ")  เสร็จสิ้น", "success").then(function () {
                                GET_PATAG_MA(PA_TAG_Code);
                                $("#ModalCarMA").modal("hide");
                            });
                        }
                    });
                
            });


            $(document).on("click", ".btnDeleteTAX_Image", function () {
                var ID = parseInt($(this).attr("data-id"));
                if (ID != 0) {
                    var TotalPath = $(this).attr("data-Path");
                    //Path = Path.replace('../', '\\');
                    //Path = Path.replace(/\s+|[,\/]/g, "\\");
                    //var TotalPath =  Path;
                }
                console.log(ID);
                console.log(TotalPath);
                if (confirm('Confrim Delete?')) {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Tax_IMG")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Tax_ID: 0, Path: TotalPath }),
                        success: function (response) {
                            swal("Complete", "ลบไฟล์แนบเสร็จสิ้น", "success");
                            UpLoadFileDelete(TotalPath);
                        }
                    });

                    $(this).closest("tr").remove();
                }
            });
            $(document).on("click", ".btnDeleteINS_Image", function () {
                var ID = parseInt($(this).attr("data-id"));
                if (ID != 0) {
                    var TotalPath = $(this).attr("data-Path");
                    //Path = Path.replace('../', '\\');
                    //Path = Path.replace(/\s+|[,\/]/g, "\\");
                    //var TotalPath =  Path;
                    //var TotalPath = "D:\\HRDatabase_Test" + Path;
                }
                console.log(ID);
                console.log(TotalPath);

                if (confirm('Confrim Delete?')) {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Insurance_IMG")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, Insurance_ID: 0, Path: TotalPath }),
                        success: function (response) {
                            swal("Complete", "ลบไฟล์แนบเสร็จสิ้น", "success");
                            UpLoadFileDelete(TotalPath);
                        }
                    });

                    $(this).closest("tr").remove();
                }
            });
            $(document).on("click", ".btnDeleteMA_Image", function () {
                var ID = parseInt($(this).attr("data-id"));
                if (ID != 0) {
                    var TotalPath = $(this).attr("data-Path");
                    //Path = Path.replace('../', '\\');
                    //Path = Path.replace(/\s+|[,\/]/g, "\\");
                    //var TotalPath =  Path;
                    //var TotalPath = "D:\\HRDatabase_Test" + Path;
                }
                console.log(ID);
                console.log(TotalPath);

                if (confirm('Confrim Delete?')) {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_MA_IMG")%>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ ID: ID, MA_ID: 0, Path: TotalPath }),
                        success: function (response) {
                            swal("Complete", "ลบไฟล์แนบเสร็จสิ้น", "success");
                            UpLoadFileDelete(TotalPath);
                        }
                    });

                    $(this).closest("tr").remove();
                }
            });

            $("#btnmodalBrowseEmployee").on("click", function () {
                $("#search_username").val("");
                $("#TBbodyBrowseEmployee").empty();
                $("#search_box").empty();
                var fragment = '';
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUsernamePE") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: "" }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var EmpNum = val[0];
                                var username = val[1];
                                var UserAD = val[2];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + EmpNum + '</a></td>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + username + '</a></td>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + UserAD + '</a></td>';
                                fragment += '</tr>';
                            });

                        } else { }
                        $("#TBbodyBrowseEmployee").append(fragment);
                        $("#modalBrowseEmployee").modal("show");
                    }
                });
            });

            $(document).on("change", "#search_username", function () {
                $("#TBbodyBrowseEmployee").empty();
                var fragment = '';
                var values = $("#search_username").val();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUsernamePE")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: values }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var EmpNum = val[0];
                                var username = val[1];
                                var UserAD = val[2];
                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + EmpNum + '</a></td>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + username + '</a></td>';
                                fragment += '<td><a class="clickselectusername" href="javascript:void(0)" >' + UserAD + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                        $("#TBbodyBrowseEmployee").append(fragment);
                    }
                });
            });

            $(document).on("click", ".clickselectusername", function () {
                var EmpNum = $(this).closest("tr").find("td:nth-child(1)").text();
                inputCarOwner(EmpNum);
                $("#search_username").val("");
                $("#txtCarOwner_EmpNum").val(EmpNum);
                $("#modalBrowseEmployee").modal("hide");
            });

            function GetCharge(search) {
                $("#TBbodyCharge").empty();
                var fragment = '';
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/VW_PA_TAG_Charge") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: search }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var CH_Code = val[0];
                                var Detail = val[1];
                                var CH_Desc = val[2];
                                var CH_Value = val[3];

                                fragment += '<tr>';
                                fragment += '<td><a class="clickselectGetCharge" href="javascript:void(0)" >' + CH_Code + '</a></td>';
                                fragment += '<td><a class="clickselectGetCharge" href="javascript:void(0)" >' + Detail + '</a></td>';
                                fragment += '<td><a class="clickselectGetCharge" href="javascript:void(0)" >' + CH_Desc + '</a></td>';
                                fragment += '<td><a class="clickselectGetCharge" href="javascript:void(0)" >' + CH_Value + '</a></td>';
                                fragment += '</tr>';
                            });
                        }
                        $("#TBbodyCharge").append(fragment);
                    }
                });
            }
            function GetSieteRef() {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/GetSiteRef")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '<option value="">== เลือกบริษัทผู้ถือครอง == </option>';
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var company = val[2];
                                fragment += '<option value="' + ID + '">' + company + '</option>';
                            });
                        }

                        $("#PA_TAG_Company_Location").append(fragment);
                    }
                });
            }
            function GetPA_TAG_Type_Car() {
                $.ajax({
                    type: "post",
                    async: false,
                    url: "<%=ResolveUrl("MaintainEmployee.aspx/GetPA_TAG_Type_Car")%>",
                    contentType: "application/json; charset = utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '<option value=" ">=== เลือกประเภทรถ ===</option>';
                            $.each(response.d, function (index, val) {
                                var Group_Code = val[0];
                                var Group_Detail = val[1];
                                fragment += '<option value="' + Group_Code + '">' + Group_Detail + '</option>';
                            });
                        }

                        $("#PA_TAG_Type_Car").append(fragment);
                    }
                });
            }
            function GetPA_TAG_ServiceCenter() {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GETPA_TAG_ServiceCenterofRepairing")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        
                            var fragment = '<option value=" ">=== เลือก Suppiler ===</option>';
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var NameStatus = val[1];
                                fragment += '<option value="' + ID + '">' + NameStatus + '</option>';
                            });
                            
                        $("#PA_MA_SUPPLIER").append(fragment);
                        }
                    }
                });
                
            }

            


            function savePATAG(Stauts) {
                var Stauts = Stauts
                var PA_TAG_Code = $("#PA_TAG_Code").val();
                var PA_TAG_CarID = removewhitespace($("#PA_TAG_CarID").val());
                var PA_TAG_Asset_Type = $("#PA_TAG_Asset_Type").val() != null ? $("#PA_TAG_Asset_Type").val() : ''; 
                var PA_TAG_Price = $("#PA_TAG_Price").val() != '' ? $("#PA_TAG_Price").val() : 0;
                var PA_TAG_Price = removeCurrency(PA_TAG_Price);
                var PA_TAG_Start_DATE = $("#PA_TAG_Start_DATE").val();
                var PA_TAG_End_DATE = $("#PA_TAG_End_DATE").val();
                var PA_TAG_Contact_ID = $("#PA_TAG_Contact_ID").val();
                var PA_TAG_Asset_Code = $("#PA_TAG_Asset_Code").val();
                var PA_TAG_Band = $("#PA_TAG_Band").val() != null  ? $("#PA_TAG_Band").val() : '';
                var PA_TAG_Model = $("#PA_TAG_Model").val();
                var PA_TAG_Type_Car = $("#PA_TAG_Type_Car").val() != null ? $("#PA_TAG_Type_Car").val() : '';
                var PA_TAG_TAX = $("#PA_TAG_TAX").val();
                var PA_TAG_Type_TAX = $("#PA_TAG_Type_TAX").val();
                var PA_TAG_CHARGE = $("#PA_TAG_CHARGE").val();
                var PA_TAG_Name_Sell = $("#PA_TAG_Name_Sell").val();
                var PA_TAG_MAC = $("#PA_TAG_MAC").val();
                var PA_TAG_ENG = $("#PA_TAG_ENG").val();
                var PA_TAG_Status = $("#PA_TAG_Status").val();
                var PA_TAG_Car_Status = $("#PA_TAG_Car_Status").val();
                var PA_TAG_Company_Location = $("#PA_TAG_Company_Location").val();
                var FleetCardNo = $("#FleetNo").val();
                var EasypassNo = $("#EasypassNo").val();
                var PA_TAG_DETAIL = $("#PA_TAG_DETAIL").val();
                var PA_TAG_SN = ''
                //var PA_TAG_REMARK = $("#PA_TAG_REMARK").val();
                var PA_TAG_IMAGE = '';
                if (PA_TAG_Start_DATE != "" && PA_TAG_Type_Car != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%=ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Master") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            PA_TAG_Code: PA_TAG_Code, PA_TAG_Type_Car: PA_TAG_Type_Car, PA_TAG_Band: PA_TAG_Band, PA_TAG_Model: PA_TAG_Model
                            , PA_TAG_Start_DATE: PA_TAG_Start_DATE, PA_TAG_End_DATE: PA_TAG_End_DATE, PA_TAG_CarID: PA_TAG_CarID
                            , PA_TAG_Price: PA_TAG_Price, PA_TAG_Name_Sell: PA_TAG_Name_Sell, PA_TAG_IMAGE: PA_TAG_IMAGE, PA_TAG_SN: PA_TAG_SN
                            , PA_TAG_DETAIL: PA_TAG_DETAIL, PA_TAG_REMARK: '', PA_TAG_Company_Location: PA_TAG_Company_Location
                            , PA_TAG_Status: PA_TAG_Status, PA_TAG_Car_Status: PA_TAG_Car_Status, PA_TAG_Contact_ID: PA_TAG_Contact_ID
                            , PA_TAG_TAX: PA_TAG_TAX, PA_TAG_CHARGE: PA_TAG_CHARGE, PA_TAG_MAC: PA_TAG_MAC, PA_TAG_ENG: PA_TAG_ENG, PA_TAG_Asset_Type: PA_TAG_Asset_Type
                            , PA_TAG_Asset_Code: PA_TAG_Asset_Code, FleetCardNo: FleetCardNo, EasypassNo: EasypassNo, Stauts: Stauts ,PA_TAG_Type_TAX:PA_TAG_Type_TAX
                        }),
                        success: function (response) {
                            var returnPATAG = response.d;

                            if ($("#InputCar_Image")[0].files[0]) {
                                var PATH = "/" + returnPATAG + "/CarImage/PATAG.PNG";
                                console.log(PATH)
                                $.ajax({
                                    type: "post",
                                    async: false,
                                    url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Master_IMG")%>",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    data: JSON.stringify({ PA_TAG_Code: returnPATAG, PA_TAG_IMAGE: PATH }),
                                    success: function (response) { }
                                });
                            }
                            swal("Complete", "บันทึก PA TAG " + returnPATAG + " เสร็จสิ้น", "success").then(function () {

                                saveAttachPATAG(returnPATAG);
                                window.location.href = "PATAG.aspx?PATAG=" + returnPATAG;


                            });
                        }
                    });
                } else {
                    swal("กรุกรอกข้อมูลวันที่ซื้อ/เริ่มต้นสัญญา, ประเภทรถให้ครบถ้วน", "", "warning");
                }
            }
            //index Action

            function inputCarOwner(EmpNum) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GetUsernamePE")%>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ search: EmpNum }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var EmpNum = val[0];
                                var username = val[1];
                                var Costcenter = val[2];
                                var UserAD = val[3];
                                $("#txtCarOwner_EmpNum").val(EmpNum);
                                $("#txtCarOwner_Empname").val(username);
                                $("#txtCarOwner_CostCenter").val(Costcenter);
                                $("#txtCarOwner_UserAD").val(UserAD);
                            });
                        }
                    }
                });
            }

            $("#SaveTax").on("click", function () {
                var PA_Tax_ID = $("#PA_Tax_ID").val();
                var PATAG = $("#PA_TAG_Code").val();
                var PA_TAX_Detail = $("#PA_TAX_Detail").val();
                var PA_TAX_Start_Date = $("#PA_TAX_Start_Date").val();
                var PA_TAX_End_Date = $("#PA_TAX_End_Date").val();
                var PA_TAX_Price = $("#PA_TAX_Price").val();
                if (PATAG != "" && PA_TAX_Start_Date != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%=ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Tax") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: PA_Tax_ID, PA_TAG_Code: PATAG, PA_TAX_Detail: PA_TAX_Detail, PA_TAX_Start_Date: PA_TAX_Start_Date
                            , PA_TAX_End_Date: PA_TAX_End_Date, PA_TAX_Price: removeCurrency(PA_TAX_Price)
                        }),
                        success: function (response) {
                            var TAXID = response.d;
                            saveAttachTAX(PATAG, TAXID);
                            swal("Complete", "บันทึกข้อมูลภาษี(" + TAXID + ") เสร็จสิ้น", "success").then(function () {
                                GETPATAG_TAX(PATAG);
                                $("#ModalCar_Tax").modal("hide");
                            });

                        }
                    });
                } else {
                    swal("กรุกรอกข้อมูลให้ครบถ้วน", "", "warning");
                }

            });
            $("#SaveINS").on("click", function () {
                var INS_ID = $("#INS_ID").val();
                var PA_TAG_Code = $("#PA_TAG_Code").val();
                var PA_INS_Detail = $("#PA_INS_Detail").val();
                var PA_INS_Start_Date_Insurance = $("#PA_INS_Start_Date_Insurance").val();
                var PA_INS_End_Date_Insurance = $("#PA_INS_End_Date_Insurance").val();
                var PA_INS_Price_Insurance = $("#PA_INS_Price_Insurance").val();
                var PA_INS_Price_Insurance = removeCurrency(PA_INS_Price_Insurance);
                var PA_INS_Name_Insurance = $("#PA_INS_Name_Insurance").val();
                var PA_INS_Serial_Insurance = $("#PA_INS_Serial_Insurance").val();
                var PA_INS_Start_Date_Act = $("#PA_INS_Start_Date_Act").val();
                var PA_INS_End_Date_Act = $("#PA_INS_End_Date_Act").val();
                var PA_INS_Serial_Act = $("#PA_INS_Serial_Act").val();
                var PA_INS_Price_Act = $("#PA_INS_Price_Act").val();
                var PA_INS_Price_Act = removeCurrency(PA_INS_Price_Act)
                if (PA_INS_Start_Date_Insurance != "") {
                    $.ajax({
                        type: "POST",
                        async: false,
                        url: "<%=ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Insurance") %>",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            ID: INS_ID, PA_TAG_Code: PA_TAG_Code, PA_INS_Detail: PA_INS_Detail, PA_INS_Name_Insurance: PA_INS_Name_Insurance
                            , PA_INS_Serial_Insurance: PA_INS_Serial_Insurance, PA_INS_Start_Date_Insurance: PA_INS_Start_Date_Insurance,
                            PA_INS_End_Date_Insurance: PA_INS_End_Date_Insurance, PA_INS_Price_Insurance: PA_INS_Price_Insurance
                            , PA_INS_Start_Date_Act: PA_INS_Start_Date_Act, PA_INS_End_Date_Act: PA_INS_End_Date_Act, PA_INS_Price_Act: PA_INS_Price_Act
                            ,PA_INS_Serial_Act :PA_INS_Serial_Act
                        }),
                        success: function (response) {
                            var INSID = response.d;
                            saveAttachINS(PA_TAG_Code, INSID);
                            swal("Complete", "บันทึกข้อมูลประกัน,พรบ.(" + INSID + ") เสร็จสิ้น", "success").then(function () {
                                GETPATAG_INS(PA_TAG_Code);
                                $("#ModalCarInsurance").modal("hide");
                            });

                        }
                    });
                } else {
                    swal("กรุกรอกข้อมูลให้ครบถ้วน", "", "warning");
                }

            });

            $("#SaveMA").on("click", function () {
                var PA_TAG_Code = $("#PA_TAG_Code").val();
                var MA_ID = $("#MA_ID").val();
                saveAttachMA(PA_TAG_Code, MA_ID);

                 swal("Complete", "บันทึกข้อมูลเสร็จสิ้น", "success")

                $("#ModalMA").modal("hide");
            });

            //$("#SaveAttch_EasyPass").on("click", function () {
            //    saveAttachEasyPass('Test001');
            //    var Location = $("#txtEasyPass_Location").val();
            //    var Time = $("#txtEasyPass_Time").val();
            //    var Price = $("#txtEasyPass_Price").val();
            //    console.log(Location);
            //    console.log(Time);
            //    console.log(Price);
            //    $("#ModalCarEasyPass").modal("hide");
            //});

            //Tab Action

            function saveAttachPATAG(PATAG) {
                if ($("#InputCar_Image").val() != "") {
                    var image = $("#InputCar_Image")[0].files[0];
                    var imgName = 'PATAG';
                    var PATAG = PATAG + '/CarImage';
                    var Type = 'PNG';
                    insertFilePATAG(image, imgName, PATAG, Type);
                }
            }

            function GETPATAG_PE(PATAG) {
                $("#ListCar_owner").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GETPATAG_PE") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ PATAG: PATAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                                //[ID],[PA_TAG_Code],[PA_PE_User],[Emp_Num],[Fullname],[CostCenter],[JobTitle],[Level],[PA_PE_Date],[PA_PE_Detail]
                                var ID = val[0];
                                var PA_TAG_Code = val[1];
                                var PA_PE_User = val[2];
                                var Emp_Num = val[3];
                                var Fullname = val[4];
                                var CostCenter = val[5];
                                var JobTitle = val[6];
                                var Level = val[7];
                                var PA_PE_Date = val[8];
                                var PA_PE_Detail = val[9];

                                fragment += '<tr>';
                                fragment += '<td>' + Emp_Num + '</td>';
                                fragment += '<td>' + Fullname + '</td>';
                                fragment += '<td>' + CostCenter + '</td>';
                                fragment += '<td>' + JobTitle + '</td>';
                                fragment += '<td>' + Level + '</td>';
                                fragment += '<td>' + PA_PE_Date + '</td>';
                                fragment += '<td>' + PA_PE_Detail + '</td>';
                                fragment += '<td><button type="button" class="btn btn-warning btnEditModalCar_Owner" data-id="' + ID + '" data-userad="' + PA_PE_User + '"data-detail="' + PA_PE_Detail + '" >Edit</button></td>';
                                fragment += '</tr>';

                            });
                            $("#ListCar_owner").append(fragment);
                        }
                    }
                });
            }
            function GETPATAG_TAX(PATAG) {
                $("#ListCar_Tax").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GETPA_TAX") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ PATAG: PATAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                                //[ID],[PA_TAG_Code],[PA_TAX_Detail],[PA_TAX_Start_Date],[PA_TAX_End_Date],[PA_TAX_Price],[CreateDate],[CreateBy],[UpdateDate],[UpdateBy]
                                var ID = val[0];
                                var PA_TAG_Code = val[1];
                                var PA_TAX_Detail = val[2];
                                var PA_TAX_Start_Date = val[3];
                                var PA_TAX_End_Date = val[4];
                                var PA_TAX_Price = val[5];
                                var CreateDate = val[6];
                                var CreateBy = val[7];
                                var UpdateDate = val[8];
                                var UpdateBy = val[9];

                                fragment += '<tr>';
                                fragment += '<td>' + PA_TAX_Detail + '</td>';
                                fragment += '<td>' + Currency(PA_TAX_Price) + '</td>';
                                fragment += '<td>' + PA_TAX_Start_Date + '</td>';
                                fragment += '<td>' + PA_TAX_End_Date + '</td>';
                                fragment += '<td><button type="button" class="btn btn-warning btnEditModalCar_Tax" data-id="' + ID + '">รายละเอียด</button></td>';
                                fragment += '</tr>';

                            });
                            $("#ListCar_Tax").append(fragment);
                        }
                    }
                });
            }
            function GETPATAG_INS(PATAG) {
                $("#ListCar_Insurance").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GET_PATAG_Insurance") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ PATAG: PATAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                                //[ID],[PA_TAG_Code],[PA_INS_Detail],[PA_INS_Name_Insurance],[PA_INS_Serial_Insurance],[PA_INS_Start_Date_Insurance]
                                //, [PA_INS_End_Date_Insurance], [PA_INS_Price_Insurance], [PA_INS_Start_Date_Act], [PA_INS_End_Date_Act]
                                //, [PA_INS_Price_Act], [CreateDate], [CreateBy], [UpdateDate], [UpdateBy]
                                var ID = val[0];
                                var PA_TAG_Code = val[1];
                                var PA_INS_Detail = val[2];
                                var PA_INS_Name_Insurance = val[3];
                                var PA_INS_Serial_Insurance = val[4];
                                var PA_INS_Start_Date_Insurance = val[5];
                                var PA_INS_End_Date_Insurance = val[6];
                                var PA_INS_Price_Insurance = val[7];
                                var PA_INS_Start_Date_Act = val[8];
                                var PA_INS_End_Date_Act = val[9];
                                var PA_INS_Price_Act = val[10];
                                var CreateDate = val[11];
                                var CreateBy = val[12];
                                var UpdateDate = val[13];
                                var UpdateBy = val[14];

                                fragment += '<tr>';
                                fragment += '<td>' + PA_INS_Detail + '</td>';
                                fragment += '<td>' + PA_INS_Start_Date_Insurance + '</td>';
                                fragment += '<td>' + PA_INS_End_Date_Insurance + '</td>';
                                fragment += '<td>' + PA_INS_Start_Date_Act + '</td>';
                                fragment += '<td>' + PA_INS_End_Date_Act + '</td>';
                                fragment += '<td><button type="button" class="btn btn-warning btnEditModalCar_INS" data-id="' + ID + '" data-PA_INS_Name_Insurance="' + PA_INS_Name_Insurance +
                                    '" data-PA_INS_Serial_Insurance="' + PA_INS_Serial_Insurance + '" data-PA_INS_Price_Insurance="' + PA_INS_Price_Insurance +
                                    '" data-PA_INS_Price_Act="' + PA_INS_Price_Act + '">รายละเอียด</button></td>';
                                fragment += '</tr>';

                            });
                            $("#ListCar_Insurance").append(fragment);
                        }
                    }
                });
            }
            function GET_PATAG_MA(PATAG) {
                $("#ListCar_MA").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GET_PATAG_MA") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ PATAG: PATAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                              //[ID],[PA_TAG_Code],[K2ID],[Repair_Type],[PA_MA_DETAIL],[PA_MA_DATE],[PA_MA_SUPPLIER],[PA_MA_PRICE],[PA_MA_MILE],[CreateDate],[CreateBy],[site_ref],[Flow_ID],[PA_MA_SUPPLIER_ID]
                                var ID = val[0];
                                var PA_TAG_Code = val[1];
                                var K2ID = val[2];
                                var Repair_Type = val[3];
                                var PA_MA_DETAIL = val[4];
                                var PA_MA_DATE = val[5];
                                var PA_MA_SUPPLIER = val[6];
                                var PA_MA_PRICE = val[7];
                                var PA_MA_MILE = val[8];
                                var CreateDate = val[9];
                                var CreateBy = val[10];
                                var site_ref = val[11];
                                var Flow_ID = val[12];
                                var PA_MA_SUPPLIER_ID = val[13];
                             
                                var link = 'http://portalapp01/WorkflowV2_Dev/HR-Human%20Resource/HR09_02_CarRepairingRequest.aspx?WT=HR09_02&Site_Ref=' + site_ref + '&ID=' + Flow_ID + '&K2=' + K2ID;
                                fragment += '<tr>';
                                fragment += '<td><a href="'+link+'" target="_blank">' + K2ID + '</td>';
                                fragment += '<td>'+PA_MA_DETAIL+'</td>';
                                fragment += '<td>'+PA_MA_DATE.substr(0,10)+'</td>';
                                fragment += '<td>'+PA_MA_MILE+'</td>';
                                fragment += '<td>'+PA_MA_SUPPLIER+'</td>';
                                fragment += '<td>' + Repair_Type + '</td>';
                                fragment += '<td>' + Currency(PA_MA_PRICE) + '</td>';
                                fragment += '<td><button type="button" class="btn btn-warning btnEditModalCar_MA" data-id="' + ID + '" data-PA_MA_SUPPLIER_ID ="' + PA_MA_SUPPLIER_ID + '">Edit</button></td>';
                                fragment += '<td><button type="button" data-id="'+ID+'" data-PA_TAG_Code="'+PA_TAG_Code+'" data-Flow_ID="'+Flow_ID+'" class="btn btn-info btn-margin-left btnModalMA">Show</button></td>';
                               
                                fragment += '</tr>';

                            });
                            $("#ListCar_MA").append(fragment);
                        }
                    }
                });
            }
            

            function GETPATAG(GETParams_PATAG) {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/TB_PA_TAG_MASTER") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ PATAG: GETParams_PATAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                                var PA_TAG_Code = val[0];
                                var PA_TAG_Type_Car = val[1];
                                var PA_TAG_Band = val[2];
                                var PA_TAG_Model = val[3];
                                var PA_TAG_Start_DATE = val[4];
                                var PA_TAG_End_DATE = val[5];
                                var PA_TAG_CarID = removewhitespace(val[6]);
                                var PA_TAG_Price = Currency(val[7]);
                                var PA_TAG_Name_Sell = val[8];
                                var PA_TAG_IMAGE = val[9];
                                var PA_TAG_SN = val[10];
                                var PA_TAG_DETAIL = val[11];
                                var PA_TAG_REMARK = val[12];
                                var PA_TAG_Company_Location = val[13];
                                var PA_TAG_Status = val[14];
                                var PA_TAG_Car_Status = val[15];
                                var PA_TAG_Contact_ID = val[16];
                                var PA_TAG_TAX = val[17];
                                var PA_TAG_TYPE_TAX = val[18];
                                var PA_TAG_CHARGE = val[19];
                                var PA_TAG_MAC = val[20];
                                var PA_TAG_ENG = val[21];
                                var PA_TAG_Asset_Type = val[22];
                                var PA_TAG_Asset_Code = val[23];
                                var FleetCardNo = val[24];
                                var EasypassNo = val[25];
                                var CREATE_DATE = val[26];
                                var CREATE_By = val[27];
                                var UPDATE_DATE = val[28];
                                var UPDATE_By = val[29];

                                $("#PA_TAG_Code").val(PA_TAG_Code);
                                $("#PA_TAG_CarID").val(PA_TAG_CarID);
                                $("#PA_TAG_Asset_Type").val(PA_TAG_Asset_Type);
                                $("#PA_TAG_Price").val(PA_TAG_Price);
                                $("#PA_TAG_Start_DATE").val(PA_TAG_Start_DATE);
                                $("#PA_TAG_End_DATE").val(PA_TAG_End_DATE);
                                $("#PA_TAG_Contact_ID").val(PA_TAG_Contact_ID);
                                $("#PA_TAG_Asset_Code").val(PA_TAG_Asset_Code);
                                $("#PA_TAG_Band").val(PA_TAG_Band);
                                $("#PA_TAG_Model").val(PA_TAG_Model);
                                $("#PA_TAG_Type_Car").val(PA_TAG_Type_Car);
                                $("#PA_TAG_TAX").val(PA_TAG_TAX);
                                $("#PA_TAG_Type_TAX").val(PA_TAG_TYPE_TAX);
                                $("#PA_TAG_CHARGE").val(PA_TAG_CHARGE);
                                $("#PA_TAG_Name_Sell").val(PA_TAG_Name_Sell);
                                $("#PA_TAG_MAC").val(PA_TAG_MAC);
                                $("#PA_TAG_ENG").val(PA_TAG_ENG);
                                $("#PA_TAG_Status").val(PA_TAG_Status);
                                $("#PA_TAG_Car_Status").val(PA_TAG_Car_Status);
                                $("#PA_TAG_Company_Location").val(PA_TAG_Company_Location);
                                $("#FleetNo").val(FleetCardNo);
                                $("#EasypassNo").val(EasypassNo);
                                $("#PA_TAG_DETAIL").val(PA_TAG_DETAIL);
                                //$("#PA_TAG_SN").val(PA_TAG_SN);
                                //$("#PA_TAG_REMARK").val('');
                                $("#InputCar_Image_OLD").val(PA_TAG_IMAGE);
                                //$('#Car_Image .img-preview').attr('src', "http:\\\\PATAG_Attach\\"+PA_TAG_IMAGE);
                                var dt = new Date();
                                var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
                                $('#Car_Image .img-preview').attr('src', PA_TAG_IMAGE + "?xxx=" + time);
                            });
                        }
                    }
                });
            }

            function showSearch(search) {
                GETITTAGBROWSE(search);
                $("#modalBrowsePATAG").modal("show");
            }

            function GETITTAGBROWSE(SearchPATAG) {
                
                TbListBrowse.clear().draw();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/TB_PA_TAG_MASTER_Search") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ SearchPATAG: SearchPATAG }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                                var PA_TAG_Code = val[0];
                                var PA_TAG_Type_Car = val[1];
                                var PA_TAG_Band = val[2];
                                var PA_TAG_Model = val[3];
                                var PA_TAG_Start_DATE = val[4];
                                var PA_TAG_End_DATE = val[5];
                                var PA_TAG_CarID = val[6];
                                var PA_TAG_Price = val[7];
                                var PA_TAG_Name_Sell = val[8];
                                var PA_TAG_IMAGE = val[9];
                                var PA_TAG_SN = val[10];
                                var PA_TAG_DETAIL = val[11];
                                var PA_TAG_REMARK = val[12];
                                var PA_TAG_Company_Location = val[13];
                                var PA_TAG_Status = val[14];
                                var PA_TAG_Car_Status = val[15];
                                var PA_TAG_Contact_ID = val[16];
                                var PA_TAG_TAX = val[17];
                                var PA_TAG_CHARGE = val[18];
                                var PA_TAG_MAC = val[19];
                                var PA_TAG_ENG = val[20];
                                var PA_TAG_Asset_Type = val[21];
                                var PA_TAG_Asset_Code = val[22];
                                var FleetCardNo = val[23];
                                var EasypassNo = val[24];
                                var CREATE_DATE = val[25];
                                var CREATE_By = val[26];
                                var UPDATE_DATE = val[27];
                                var UPDATE_By = val[28];


                                
                                TbListBrowse.row.add(['<a class="clickselectPATAGBROWSE" href="javascript:void(0)" >' + PA_TAG_Code + '</a>'
                                    , '<a class="clickselectPATAGBROWSE" href="javascript:void(0)" >' + removewhitespace(PA_TAG_CarID) + '</a>'
                                    , '<a class="clickselectPATAGBROWSE" href="javascript:void(0)" >' + PA_TAG_DETAIL + '</a>']).draw().node();

                                //fragment += '<tr>';
                                //fragment += '<td><a class="clickselectPATAGBROWSE" href="javascript:void(0)" >' + PA_TAG_Code + '</a></td>';
                                //fragment += '<td><a class="clickselectPATAGBROWSE" href="javascript:void(0)" >' + removewhitespace(PA_TAG_CarID) + '</a></td>';
                                //fragment += '<td><a class="clickselectPATAGBROWSE" href="javascript:void(0)" >' + PA_TAG_DETAIL + '</a></td>';
                                ////fragment += '<td><a class="clickselectPATAGBROWSE" href="javascript:void(0)" >' + PA_TAG_Band + '</a></td>';
                                ////fragment += '<td><a class="clickselectPATAGBROWSE" href="javascript:void(0)" >' + PA_TAG_Model + '</a></td>';
                                //fragment += '</tr>';

                            });
                        }
                    }
                });
            }

            function GETPATAG_TAX_IMAGE(TAX_ID) {
                $("#ListAttachTAX_OLD").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GETPA_TAX_IMAGE") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ TAX_ID: TAX_ID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var TAX_ID = val[1];
                                var Path = val[2];
                                var showName = Path.substring(29);
                                fragment += '<tr>';
                                fragment += '<td><a href="http://portalapp01/' + Path.substr(3) + '" target="_blank">' + showName + '</a></td>';
                                fragment += '<td></td>';
                                //fragment += '<td><button type="button" class="btn btn-danger btnDeleteTAX_Image" data-id="'+ID+'" onclick="deleteRow(this)"><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                                fragment += '<td><button type="button" class="btn btn-danger btnDeleteTAX_Image"  data-id="' + ID + '" data-Path="'+Path+'" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                                fragment += '</tr>';

                            });
                            $('#ListAttachTAX_OLD').append(fragment);
                        }
                    }
                });
            }

            function GETPATAG_INS_IMAGE(INS_ID) {
                $("#ListAttachINS_OLD").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GETPA_INS_IMAGE") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Insurance_ID: INS_ID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                                var ID = val[0];
                                var Insurance_ID = val[1];
                                var Path = val[2];
                                var showName = Path.substring(29);
                                fragment += '<tr>';
                                fragment += '<td><a href="http://portalapp01/' + Path.substr(3) + '" target="_blank">' + showName + '</a></td>';
                                fragment += '<td></td>';
                                //fragment += '<td><button type="button" class="btn btn-danger btnDeleteTAX_Image" data-id="'+ID+'" onclick="deleteRow(this)"><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                                fragment += '<td><button type="button" class="btn btn-danger btnDeleteINS_Image" data-id="' + ID + '" data-Path="'+Path+'" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                                fragment += '</tr>';

                            });
                            $('#ListAttachINS_OLD').append(fragment);
                        }
                    }
                });
            }

            function GETPATAG_MA_IMAGE(MA_ID) {
                $("#ListAttachMA_OLD").empty();
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/GETPA_MA_IMAGE") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ MA_ID: MA_ID }),
                    success: function (response) {
                        if (response.d.length > 0) {
                            var fragment = '';
                            $.each(response.d, function (index, val) {
                                //ID],[MA_ID],[Path],[CreateDate],[CreateBy] 
                                var ID = val[0];
                                var MA_ID = val[1];
                                var Path = val[2];
                                var showName = Path.substring(28);
                                fragment += '<tr>';
                                fragment += '<td><a href="http://portalapp01/' + Path.substr(3) + '" target="_blank">' + showName + '</a></td>';
                                fragment += '<td></td>';
                                //fragment += '<td><button type="button" class="btn btn-danger btnDeleteTAX_Image" data-id="'+ID+'" onclick="deleteRow(this)"><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                                fragment += '<td><button type="button" class="btn btn-danger btnDeleteMA_Image" data-id="' + ID + '" data-Path="'+Path+'" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
                                fragment += '</tr>';

                            });
                            $('#ListAttachMA_OLD').append(fragment);
                        }
                    }
                });
            }
            function GETK2_MA_IMAGE(Flow_ID) {
                $("#ListAttachMA_K2").empty();
                var fragment = "";
                var WorkflowType = 'HR09_02';
                //Mockup
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "<%= ResolveUrl("MaintainEmployee.aspx/getAttactmentFile") %>",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ WorkflowType: WorkflowType ,WorkflowID: Flow_ID   }),
                    success: function (response) {
                        console.log(response.d);
                        if (response.d.length > 0) {
                            $.each(response.d, function (index, val) {
                               /*ตัวอย่างลิงค์ http://pkflow01/PathDownload/getWorkflowTYPE-getWorkflowID/FileName*/
                                var ID = val[0];
                                var Site_ref = val[1];
                                var ProcInsID = val[2];
                                var WorkflowType = val[3];
                                var WorkflowID = val[4];
                                var Attachment = val[5];
                                fragment += '<tr>';
                                fragment += '<td><a href="http://pkflow01/PathDownload/'+WorkflowType+'-'+WorkflowID+'/' + Attachment+'"  target="_blank">' + Attachment + '</a></td>';
                                fragment += '</tr>';

                            });
                        }
                        
                    $('#ListAttachMA_K2').append(fragment);
                    }
                });
            }


            function saveAttachTAX(PATAG, TAXID) {
                var arrName = [];
                var num = "(copy)";
                var TYPE = 'TAX';
                var PATAG = PATAG + '/TAX';
                $("#ListAttachTAX tr").each(function () {
                    if ($(this).find("td:nth-child(2)").find("input[type=file]").val() != "") {
                        var image = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0];
                        var imgName = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0]["name"];
                        var PATH = "../PATAG_Attach/" + PATAG + "/" + imgName;
                        console.log(image);
                        if (arrName.includes(imgName)) {
                            arrName.push(imgName);
                            imgName = imgName + num;
                        } else {
                            arrName.push(imgName);
                        }
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Tax_IMG")%>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: 0, Tax_ID: TAXID, Path: PATH }),
                            success: function (response) {
                                insertFilePATAG(image, imgName, PATAG, TYPE);
                            }
                        });
                    }

                });
            }
            function saveAttachINS(PATAG, Insurance_ID) {
                var arrName = [];
                var num = "(copy)";
                var TYPE = 'INS';
                var PATAG = PATAG + '/INS';
                $("#ListAttachINS tr").each(function () {
                    if ($(this).find("td:nth-child(2)").find("input[type=file]").val() != "") {
                        var image = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0];
                        var imgName = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0]["name"];
                        var PATH = "../PATAG_Attach/" + PATAG + "/" + imgName;
                        console.log(image);
                        if (arrName.includes(imgName)) {
                            arrName.push(imgName);
                            imgName = imgName + num;
                        } else {
                            arrName.push(imgName);
                        }
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_Insurance_IMG")%>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: 0, Insurance_ID: Insurance_ID, Path: PATH }),
                            success: function (response) {
                                insertFilePATAG(image, imgName, PATAG, TYPE);
                            }
                        });
                    }

                });
            }
            function saveAttachMA(PATAG,MA_ID) {
                var arrName = [];
                var num = "(copy)";
                var TYPE = 'MA';
                var PATAG = PATAG + '/MA';
                $("#ListAttachMA tr").each(function () {
                    if ($(this).find("td:nth-child(2)").find("input[type=file]").val() != "") {
                        var image = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0];
                        var imgName = $(this).find("td:nth-child(2)").find("input[type=file]")[0].files[0]["name"];
                        var PATH = "../PATAG_Attach/" + PATAG + "/" + imgName;
                        if (arrName.includes(imgName)) {
                            arrName.push(imgName);
                            imgName = imgName + num;
                        } else {
                            arrName.push(imgName);
                        }
                        $.ajax({
                            type: "post",
                            async: false,
                            url: "<%= ResolveUrl("MaintainEmployee.aspx/SP_PA_TAG_MA_IMG")%>",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ ID: 0, MA_ID: MA_ID, Path: PATH }),
                            success: function (response) {
                                insertFilePATAG(image, imgName, PATAG, TYPE);
                            }
                        });
                        

                    }

                });
            }
            function SetDatePicker() {
                $('#PA_TAG_Start_DATE').datepicker({ dateFormat: "dd/mm/yy" });
                $('#PA_TAG_End_DATE').datepicker({ dateFormat: "dd/mm/yy" });
                $('#txtCarOwner_Date').datepicker({ dateFormat: "dd/mm/yy" });
                $('#PA_TAX_Start_Date').datepicker({ dateFormat: "dd/mm/yy" });
                $('#PA_TAX_End_Date').datepicker({ dateFormat: "dd/mm/yy" });
                $('#txtCarTax_EndDate').datepicker({ dateFormat: "dd/mm/yy" });
                $('#PA_INS_Start_Date_Insurance').datepicker({ dateFormat: "dd/mm/yy" });
                $('#PA_INS_End_Date_Insurance').datepicker({ dateFormat: "dd/mm/yy" });
                $('#PA_INS_Start_Date_Act').datepicker({ dateFormat: "dd/mm/yy" });
                $('#PA_INS_End_Date_Act').datepicker({ dateFormat: "dd/mm/yy" });
                $('#PA_MA_DATE').datepicker({ dateFormat: "dd/mm/yy" });
            }

            

            function saveAttachEasyPass(PATAG) {
                var arrName = [];
                var num = "(copy)";
                var TYPE = 'EasyPass';
                var PATAG = PATAG + '/EAsyPass';
                $("#ListAttach_EasyPass tr").each(function () {
                    if ($(this).find("td:nth-child(1)").find("input[type=file]").val() != "") {
                        var image = $(this).find("td:nth-child(1)").find("input[type=file]")[0].files[0];
                        var imgName = $(this).find("td:nth-child(2)").find("input[type=text]").val();
                        if (arrName.includes(imgName)) {
                            arrName.push(imgName);
                            imgName = imgName + num;
                        } else {
                            arrName.push(imgName);
                        }
                        insertFilePATAG(image, imgName, PATAG, TYPE);

                    }

                });
            }

            $(document).on('change', ".EmpImg", function () {
                var file_name = $(this).val().replace(/\\/g, '/').replace(/.*\//, '');
                var fileNameIndex = file_name.lastIndexOf("/") + 1;
                var dotIndex = file_name.lastIndexOf('.');
                var file_type = file_name.substr(dotIndex + 1, (file_name.length - 1) - dotIndex);
                var arr_type = ['jpg', 'jpeg', 'png', 'pdf'];

                file_name = file_name.substr(fileNameIndex, dotIndex < fileNameIndex ? file_name.length : dotIndex);
                if (arr_type.includes(file_type)) {
                    $(this).closest('tr').find('.ImgName').val(file_name);
                } else {
                    $(this).closest('tr').find('.EmpImg').val('');
                    $(this).closest('tr').find('.ImgName').val('');
                    swal("ไฟล์ไม่ถูกต้อง", "ประเภทไฟล์ที่ใช้ได้ jpg, jpeg, png และ pdf เท่านั้น");
                }
            });

            
        function Checkpermission() {
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
                        data: JSON.stringify({ user: user, page: 'PATAG' }),
                        success: function (response) {
                            if (response.d.length > 0 && response.d[0][4] == 'True') {
                                $('.CheckPermission').show();
                            } else {
                                $('.CheckPermission').hide();

                            }
                        }
                    });
                }
            });
            //---------END Check user's permission----------
        }

            //End Document Ready
        });

        function insertFilePATAG(data, name, PA_TAG, TYPE) {
            var formData = new FormData();
            formData.append('file', data);
            formData.append('name', name);
            formData.append('folderName', PA_TAG);
            formData.append('TYPE', TYPE);
            $.ajax({
                type: 'post',
                url: './UpLoadFilePATAG.ashx',
                //ต้องสร้างใหม่เป็นของ PATAG
                data: formData,
                async: false,
                success: function (status) {
                    //alert("Upload Complete");
                },
                processData: false,
                contentType: false,
                error: function () {
                    alert("Whoops something went wrong!");
                }
            });
        }


         function UpLoadFileDelete(path) {
            var formData = new FormData();
            formData.append('folderName', path);
            $.ajax({
                type: 'post',
                url: './UpLoadfileDelete.ashx',
                //ต้องสร้างใหม่เป็นของ PATAG
                data: formData,
                async: false,
                success: function (status) {
                    //alert("Upload Complete");
                },
                processData: false,
                contentType: false,
                error: function () {
                }
            });
        }

        var filenum = 1;
        $(document).on("change", "#addAttach", function () {
            var fragment = '';
            var clone = $("#addAttach").clone();
            var filename = clone[0].files[0]["name"];
            clone.attr("id", "XXXXXXX" + filenum);
            //console.log(filename);
            fragment += '<tr>';
            fragment += '<td>' + filename + '</td> ';
            fragment += '<td id="fileTAX' + filenum + '"></td> ';
            fragment += '<td><button type="button" class="btn btn-danger att-margin" onclick="deleteRow(this)" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
            fragment += '</tr>';
            $('#ListAttachTAX').append(fragment);
            $("#fileTAX" + filenum).append(clone);
            //readURL(this, filenum);
            filenum++;
        });

        var filenum_INS = 1;
        $(document).on("change", "#addAttach_INS", function () {
            var fragment = '';
            var clone = $("#addAttach_INS").clone();
            var filename = clone[0].files[0]["name"];
            clone.attr("id", "XXXXXXX_INS" + filenum_INS);
            //console.log(filename);
            fragment += '<tr>';
            fragment += '<td>' + filename + '</td> ';
            fragment += '<td id="fileINS' + filenum_INS + '"></td> ';
            fragment += '<td><button type="button" class="btn btn-danger att-margin" onclick="deleteRow(this)" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
            fragment += '</tr>';
            $('#ListAttachINS').append(fragment);
            $("#fileINS" + filenum_INS).append(clone);
            //readURL(this, filenum);
            filenum_INS++;
        });

        var filenum_MA = 1;
        $(document).on("change", "#addAttachMA", function () {
            var fragment = '';
            var clone = $("#addAttachMA").clone();
            var filename = clone[0].files[0]["name"];
            clone.attr("id", "XXXXXXX" + filenum_MA);
            //console.log(filename);
            fragment += '<tr>';
            fragment += '<td>' + filename + '</td> ';
            fragment += '<td id="fileMA' + filenum_MA + '"></td> ';
            fragment += '<td><button type="button" class="btn btn-danger att-margin" onclick="deleteRow(this)" ><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
            fragment += '</tr>';
            $('#ListAttachMA').append(fragment);
            $("#fileMA" + filenum_MA).append(clone);
            //readURL(this, filenum);
            filenum_MA++;
        });
        //function readURL(input, filenum) {
        //        if (input.files && input.files[0]) {
        //            var reader = new FileReader();
        //            //console.log(imagenum);
        //            reader.onload = function (e) {
        //                $('#file' + filenum).attr('src', e.target.result);
        //            }
        //            reader.readAsDataURL(input.files[0]);
        //        }
        //}

        //function addAttachTAX() {
        //    var fragment = '';
        //    fragment += '<tr id="attachClone">';
        //    fragment += '<td><input type="file"  class="form-control max-wide EmpImg" text="อัพโหลด"></td>';
        //    fragment += '<td><input type="text"  class="form-control max-wide ImgName" placeholder="ชื่อเอกสาร" disabled></td>';
        //    fragment += '<td><button type="button" class="btn btn-danger" onclick="deleteRow(this)"><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
        //    fragment += '</tr>';
        //    $('#ListAttachTAX').append(fragment);
        //}

        //function addAttachEasyPass() {
        //    var fragment = '';
        //    fragment += '<tr id="attachClone">';
        //    fragment += '<td><input type="file"  class="form-control max-wide EmpImg" text="อัพโหลด"></td>';
        //    fragment += '<td><input type="text"  class="form-control max-wide ImgName" placeholder="ชื่อเอกสาร"></td>';

        //    fragment += '<td><button type="button" class="btn btn-danger" onclick="deleteRow(this)"><i class="glyphicon glyphicon-trash" aria-hidden="true" style="color:white"></i></button></td>';
        //    fragment += '</tr>';
        //    $('#ListAttach_EasyPass').append(fragment);
        //}

     
        function deleteRow(btn) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }


        function Currency(input) {
           var check = input.indexOf(".");
            if (check != -1) {
                var value = input.replace(/(\d)(?=(\d{3})+(?!\d)+.+$)/g, '$1,');
            } else {
                var value = input.replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
            }
            return value;
        }


        function removewhitespace(text) {
            return text.replace(/ /g, '');
        }
        function removeCurrency(text) {
            return text.replace(/,/g, '');
        }
        function validate(evt) {
            var theEvent = evt || window.event;

            // Handle paste
            if (theEvent.type === 'paste') {
                key = event.clipboardData.getData('text/plain');
            } else {
                // Handle key press
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
            }
            var regex = /[0-9]|\./;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) theEvent.preventDefault();
            }
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
