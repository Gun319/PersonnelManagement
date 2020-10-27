<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalInfo.aspx.cs" Inherits="UI.PersonalInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="script/jquery-3.4.1.min.js"></script>
    <script src="script/BootstrapJS/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        .empInfo {
            border: 1px solid #dee2e6;
            height: 900px;
        }

        .ico {
            line-height: 25px;
            border-right: 1px solid #DEDEDE;
        }

        .ico-emp {
            font-weight: bold;
            color: #7D7D79;
        }

        .txt {
            color: #7D7D79;
        }

        .pic {
            width: 90%;
            height: 300px;
            border: 1px solid #DEDEDE;
            border-radius: 5px;
        }

        .pic-dash {
            width: 30%;
            border: 1px dashed #DEDEDE;
            height: 265px;
            border-radius: 5px;
        }

        .photo {
            border: 1px solid #DEDEDE;
            height: 200px;
        }

        #fileImg {
            width: 83%;
        }

        .txtInput {
            width: 90%;
            border: 1px solid #D4D4D4;
        }
    </style>
</head>
<body>
    <div class="empInfo mt-4 ml-4">
        <div class=" d-inline-block">
            <div class="ico float-left mt-2 mb-2 ml-3 pr-3">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
                    <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z" />
                    <circle cx="3.5" cy="5.5" r=".5" />
                    <circle cx="3.5" cy="8" r=".5" />
                    <circle cx="3.5" cy="10.5" r=".5" />
                </svg>
            </div>
            <div class="ico-emp float-left ml-3 mt-2">
                <span>员工信息&nbsp;</span>
            </div>
        </div>
        <div class="container">
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>图片上传</span>
                </div>
                <div class="col-10">
                    <div class="pic">
                        <div class="pic-dash mt-3 mr-3 mb-3 ml-3">
                            <div class="photo mt-2 mr-2 mb-2 ml-2">
                                <form id="frm1" method="post" enctype="multipart/form-data">
                                    <span id="spanImgInfo">
                                        <img src="img/Upload/default.png" width="188" height="200" />
                                    </span>
                                </form>
                            </div>
                            <div class="photo-ico">
                                <div class=" float-left">
                                    <button class="btn btn-light">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                        </svg>
                                    </button>
                                </div>
                                <div class=" float-right">
                                    <button class="btn btn-light">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                        </svg>
                                    </button>
                                    <button class="btn btn-light">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-zoom-in" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                                            <path d="M10.344 11.742c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1 6.538 6.538 0 0 1-1.398 1.4z" />
                                            <path fill-rule="evenodd" d="M6.5 3a.5.5 0 0 1 .5.5V6h2.5a.5.5 0 0 1 0 1H7v2.5a.5.5 0 0 1-1 0V7H3.5a.5.5 0 0 1 0-1H6V3.5a.5.5 0 0 1 .5-.5z" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div class="mt-2">
                        <form method="post" enctype="multipart/form-data" action="/Handler/EmpHandler.ashx">
                            <input type="file" name="fileName" id="fileImg" />
                            <input id="btUpload" type="submit" value="上传" />
                        </form>
                    </div>--%>
                </div>
            </div>
            <input type="text" name="name" value="" hidden="hidden" />
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>姓名</span>
                </div>
                <div class="col-10">
                    <input id="userName" type="text" class="txtInput" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>部门</span>
                </div>
                <div class="col-10">
                    <input id="deptName" type="text" class="txtInput" value="" readonly="true" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>年龄</span>
                </div>
                <div class="col-10">
                    <input id="age" type="text" class="txtInput" value="" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>性别</span>
                </div>
                <div class="col-10">
                    <select id="sex" class="txtInput">
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>电话</span>
                </div>
                <div class="col-10">
                    <input id="tel" type="text" class="txtInput" value="" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>地址</span>
                </div>
                <div class="col-10">
                    <input id="address" type="text" class="txtInput" value="" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>入职时间</span>
                </div>
                <div class="col-10">
                    <input id="entryTime" type="text" class="txtInput" value="" readonly="true" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>薪资</span>
                </div>
                <div class="col-10">
                    <input id="salary" type="text" class="txtInput" value="" readonly="true" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2 txt">
                    <span>个人介绍</span>
                </div>
                <div class="col-10">
                    <textarea id="remarks" class="txtInput" rows="2" cols="2" placeholder="这家伙很懒什么也没留下！"></textarea>
                </div>
            </div>
            <div class="row mt-3 text-center">
                <div class="col">
                    <button class="btn btn-primary" onclick="EditPerInfo()">保存</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        SelPerInfo();
    })

    /**查看个人信息 */
    function SelPerInfo() {
        $.ajax({
            url: "/Handler/EmpHandler.ashx",
            data: { type: "PersonalInfo", userID: 9 },
            type: "post",
            dataType: "json",
            success: (data) => {
                $.each(data, (index, item) => {
                    $("#userName").attr("value", item["UserName"]);
                    $("#deptName").attr("value", item["DepartmentName"]);
                    $("#age").attr("value", item["UserAge"]);
                    //设置value值的项为当前选中项(1：男生  0：女生)
                    $("#sex").val(item["UserSex"]);
                    $("#tel").attr("value", item["UserTel"]);
                    $("#address").attr("value", item["UserAddress"]);
                    $("#entryTime").attr("value", date(item["EntryTime"]));
                    $("#salary").attr("value", item["BasePay"]);
                    $("#remarks").append(item["UserRemarks"]);
                })
            }
        })
    }

    /**
     日期格式转换
    */
    function date(item) {
        var datalist = Number(item.substring(6, item.length - 2));
        if (datalist.length == 10) {
            datalist = datalist * 1000;
        }
        var date = new Date(datalist);
        var y = date.getFullYear() + "-";
        var m = ((date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-";
        var d = date.getDate();
        return q = y + m + d;
    }

    /**修改个人信息 */
    function EditPerInfo() {
        var uName = $("#userName").val();
        var uAge = $("#age").val();
        var uSex = $("#sex").val();
        var uTel = $("#tel").val();
        var uAddress = $("#address").val();
        var uRemarks = $("#remarks").val();
        //年龄：1-100范围内的数字
        var retAge = /^([1-9][0-9]{0,1}|100)$/;
        //电话：
        var retTel =/^1[3456789]\d{9}$/;
        if (uName != "" && uAge != "" && uTel != "" && uName != "" && uAddress != "" && uRemarks != "") {
            if (retAge.test(uAge)) {
                if (retTel.test(uTel)) {
                    $.ajax({
                        url: "/Handler/EmpHandler.ashx",
                        data: { type: "EditPerInfo", userID: 9, uName: uName, uAge: uAge, uSex: uSex, uTel: uTel, uAddress: uAddress, uRemarks: uRemarks },
                        type: "post",
                        dataType: "json",
                        success: (data) => {
                            if (data == 200) {
                                alert("保存成功！")
                                SelPerInfo();
                                return;
                            }
                            if (data == 201) {
                                alert('失败');
                            }

                        }
                    })
                }
                else {
                    alert("电话不符合要求！");
                }
            }
            else {
                alert("年龄不符合要求！");
            }
        }
        else {
            alert("不能为空！");
        }

    }
</script>
