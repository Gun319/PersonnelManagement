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
    </style>
</head>
<body>
    <div>
        <div class="ml-3 mr-3 mt-3">
            <div>
                <div class="ml-3 d-inline-block">
                    <span>部门&nbsp;</span>
                    <select>
                        <option value="0">- - 请选择 - -</option>
                    </select>
                </div>
                <div class="ml-3 d-inline-block">
                    <span>姓名&nbsp;</span>
                    <input type="text" id="empName" value="" />
                </div>
                <div class="ml-3 d-inline-block">
                    <button type="button" class="btn btn-light">查询</button>
                </div>
            </div>

            <div class="empInfo text-center mt-2">
                <table class="table table-bordered" id="dTab">
                    <thead>
                        <tr>
                            <th style="width: 40px">
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
                                    <a href="#" onclick="Add()">
                                        <img src="/img/ico/Add.png" alt="" height="25" />
                                    </a>
                                    <a href="#" onclick="UpDate()">
                                        <img src="/img/ico/Update.png" alt="" height="25" />
                                    </a>
                                    <a href="#" onclick="Del()">
                                        <img src="/img/ico/Del.png" alt="" height="25" />
                                    </a>
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

    /**
     员工信息 
     */
    function SelEmp() {
        $.ajax({
            url: "/Handler/EmpHandler.ashx",
            type: "post",
            data: {},
            dataType: "json",
            success: (data) => {
                var str = "";
                $.each(data, (index, item) => {
                    str += `<tr>
                                <td><input type="checkbox" value="`+ item["UserID"] + `" class="chk1" /></td>
                                <td>`+ item["UserID"] + `</td>
                            </tr>`;
                });
                $("#dTab>tbody>tr").remove();
                $("#dTab>tbody").append(str);
            }
        });
    }
</script>
