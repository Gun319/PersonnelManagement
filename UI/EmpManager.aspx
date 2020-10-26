<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpManager.aspx.cs" Inherits="UI.EmpManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="title.ico" rel="icon" type="image/x-icon" />
    <title></title>
    <link href="Content/Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="script/jquery-3.4.1.min.js"></script>
    <script src="script/BootstrapJS/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        .empInfo {
            border: 1px solid #dee2e6;
        }

        img {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div>
        <div class="ml-3 mr-3 mt-3">
            <div>
                <div class="ml-3 d-inline-block">
                    <span>部门&nbsp;</span>
                    <select class="Deptlist">
                        <option value="0">- - 请选择 - -</option>
                    </select>
                </div>
                <div class="ml-3 d-inline-block">
                    <span>姓名&nbsp;</span>
                    <input type="text" id="empName" value="" />
                </div>
                <div class="ml-3 d-inline-block">
                    <button type="button" class="btn btn-light" onclick="Sel()">查询</button>
                </div>
            </div>

            <div class="empInfo text-center mt-2">
                <table class="table table-bordered" id="dTab">
                    <thead>
                        <tr>
                            <th style="width: 40px; line-height: 25px">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
                                    <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z" />
                                    <circle cx="3.5" cy="5.5" r=".5" />
                                    <circle cx="3.5" cy="8" r=".5" />
                                    <circle cx="3.5" cy="10.5" r=".5" />
                                </svg>
                            </th>
                            <th colspan="8">
                                <div class="text-left">
                                    <span>员工管理</span>
                                    <img src="/img/ico/Add.png" alt="" height="25" onclick="Add()" class="bg-success ml-1" />
                                    <img src="/img/ico/Update.png" alt="" height="25" onclick="Add()" class="bg-primary ml-1" />
                                    <img src="/img/ico/Del.png" alt="" height="25" onclick="Add()" class="bg-danger ml-1" />
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <input type="checkbox" value="" id="chkAll" />
                            </th>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>部门</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>联系电话</th>
                            <th>入职时间</th>
                            <th>基本工资</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    $(() => {
        DeptSelect();
        SelEmp();

        //全选 全不选
        $("#chkAll").click(() => {
            if ($("#chkAll").prop("checked") == true)
                $(":checkbox[name = 'chk1']").prop("checked", true);
            else
                $(":checkbox[name = 'chk1']").prop("checked", false)
        })

        //判断 取消单个复选框的时候 全选取消
        //判断 所有单个复选框被选中 全选被选中
        $("#dTab>tbody").on("click", ".chk1", () => {
            if (!$(this).is(":checked")) {
                $("#chkAll").prop("checked", false);
            }
            if ($('input[name="chk1"]:checked').length == $('input[name="chk1"]').length) {
                $("#chkAll").prop("checked", true);
            }
            else {
                $("#chkAll").prop("checked", false);
            }
        })

    });

    /**
     部门下拉列表
     */
    function DeptSelect() {
        $.ajax({
            url: "/Handler/DepartmentHandler.ashx",
            type: "post",
            data: { type: "dept" },
            dataType: "json",
            success: (data) => {
                $.each(data, (index, item) => {
                    $("select").append("<option value=" + item["DepartmentID"] + ">" + item["DepartmentName"] + "</option>");
                });
            }
        });
    }

    function Sel() {
        SelEmp();
    }

    /**
     员工信息 
     */
    function SelEmp() {
        var name = $("#empName").val();
        var Dept = $(".Deptlist").val();
        $.ajax({
            url: "/Handler/EmpHandler.ashx",
            type: "post",
            data: { type: "SelEmp", Dept: Dept, name: name },
            dataType: "json",
            success: (data) => {
                var str = "";
                $.each(data, (index, item) => {
                    str += `<tr>
                                <td><input type="checkbox" class="chk1" name='chk1' value="`+ item["UserID"] + `"/></td>
                                <td>`+ item["UserNumber"] + `</td>
                                <td>`+ item["UserName"] + `</td>
                                <td>`+ item["DepartmentName"] + `</td>
                                <td>`+ (item["UserSex"] == 1 ? "男" : "女") + `</td>
                                <td>`+ item["UserAge"] + `</td>
                                <td>`+ item["UserTel"] + `</td>
                                <td>`+ item["DimissionTime"] + `</td>
                                <td>`+ item["BasePay"] + `</td>
                            </tr>`;

                });
                $("#dTab>tbody>tr").remove();
                $("#dTab>tbody").append(str);
            }
        });
    }

    function Add() {
        alert('添加员工');
    }
</script>
