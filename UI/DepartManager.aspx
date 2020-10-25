<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartManager.aspx.cs" Inherits="UI.DepartManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="title.ico" rel="icon" type="image/x-icon" />
    <link href="Content/Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="script/jquery-3.4.1.min.js"></script>
    <script src="script/BootstrapJS/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-3">
        <div class="mt-2" style="border: 1px solid #D2D2D2; height: calc(80vh);">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 40px;">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
                                <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z" />
                                <circle cx="3.5" cy="5.5" r=".5" />
                                <circle cx="3.5" cy="8" r=".5" />
                                <circle cx="3.5" cy="10.5" r=".5" />
                            </svg>
                        </th>
                        <th>员工管理
                            <button type="button" class="ml-2 btn btn-success" id="addDept">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                </svg>
                            </button>
                            <button onclick="DelDept()" type="button" class="ml-2 btn btn-danger">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                </svg>

                            </button>
                        </th>
                    </tr>
                    <tr style="background-color: #D9EDF7; color: #327190; font-size: 13px;">
                        <th colspan="2">注意：基础部门不能删除！</th>
                    </tr>
                </thead>
            </table>
            <table class="table table-bordered mt-4 mb-5" id="dTab">
                <thead>
                    <tr>
                        <th style="width: 40px;">
                            <input type="checkbox" value="" id="chkAll" /></th>
                        <th>ID</th>
                        <th>部门</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

        <%--添加部门模态框--%>
        <div class="modal fade" id="myModal" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myModalLabel">添加部门</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <label class="col-form-label">
                            <span>部门名：</span>
                            <input class="form-control" id="deptName" type="text" placeholder="请输入名字" />
                        </label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="AddDept()">提交添加</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        SelDept();

        //全选 全不选
        $("#chkAll").click(function () {
            //添加属性  attr 添加自定义的属性       prop 添加DOM的属性（当属性值等于true、false）
            //单个复选框的状态可全选保证一直
            if ($(this).is(":checked")) {
                $('input[name="chkDept"]').prop("checked", true);
            }
            else {
                $('input[name="chkDept"]').prop("checked", false);
            }
        })
        //判断 取消单个复选框的时候 全选取消
        //判断 所有单个复选框被选中 全选被选中
        $("#dTab>tbody").on("click", ".chk1", function () {
            if (!$(this).is(":checked")) {
                $("#chkAll").prop("checked", false);
            }
            if ($('input[name="chkDept"]:checked').length == $('input[name="chkDept"]').length) {
                $("#chkAll").prop("checked", true);
            }
            else {
                $("#chkAll").prop("checked", false);
            }
        })

        //点击添加弹出模态框
        $("#addDept").click(() => {
            $(".modal").modal({ backdrop: "statci" });
        })
    })

    //查看部门信息
    function SelDept() {
        $.ajax({
            url: "/DepartmentHandler.ashx",
            data: {
                type: "dept",
            },
            type: "post",
            dataType: "json",
            success: (data) => {
                $("#dTab tbody tr").remove()
                $.each(data, (index, item) => {
                    $("#dTab tbody").append("<tr>" +
                        "<td>" + "<input name='chkDept' class='chk1' type = 'checkbox' value = '" + item["DepartmentID"] + "' />" + "</td>" +
                        "<td>" + item["DepartmentID"] + "</td>" +
                        "<td>" + item["DepartmentName"] + "</td>" +
                        "</tr>");
                })
            }
        })
    }

    //删除部门信息
    function DelDept() {
        var id = [];
        $('input[type="checkbox"]:checked').each(function (index, item) {
            id += $(this).val() + ",";
        });
        if (confirm("是否确定删除？")) {
            $.ajax({
                url: "/DepartmentHandler.ashx",
                data: {
                    type: "DelDept",
                    id: id
                },
                type: "post",
                dataType: "json",
                success: (data) => {
                    if (data == 200) {
                        SelDept();
                    }
                    else {
                        alert("删除失败！");
                    }
                }
            });
        }
        else {
            $('input[type="checkbox"]:checked').prop("checked", false);
        }
    }

    //添加部门信息
    function AddDept() {
        var deptName = $("#deptName").val().trim();
        if (deptName.length != 0) {
            $.ajax({
                url: "/DepartmentHandler.ashx",
                data: {
                    type: "Adddept",
                    deptName: deptName
                },
                type: "post",
                dataType: "json",
                success: (data) => {
                    if (data == 200) {
                        alert("添加成功！")
                        $(".modal").modal("hide");
                        SelDept();
                    }
                    else if (data == 202) {
                        alert("部门已存在！")
                    }
                    else if (data == 201) {
                        alert("添加失败！");
                    }
                }
            })
        }
        else {
            alert("请输入部门名称！");
        }
    }
</script>
