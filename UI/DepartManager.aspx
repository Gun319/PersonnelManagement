<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartManager.aspx.cs" Inherits="UI.DepartManager" %>

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
        .content {
            border: 1px solid #dee2e6;
            height: calc(80vh);
        }
    </style>
</head>
<body>
    <div class="mt-3">
        <div class="ml-3 mr-3 content">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 40px; line-height: 40px">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
                                <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z" />
                                <circle cx="3.5" cy="5.5" r=".5" />
                                <circle cx="3.5" cy="8" r=".5" />
                                <circle cx="3.5" cy="10.5" r=".5" />
                            </svg>
                        </th>
                        <th>部门管理
                            <%-- 添加部门 --%>
                            <button type="button" class="ml-2 btn btn-success" id="addDept">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                </svg>
                            </button>
                            <%-- 删除部门 --%>
                            <button onclick="DelDept()" type="button" class="ml-2 btn btn-danger">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                </svg>

                            </button>
                        </th>
                    </tr>
                    <%-- <tr style="background-color: #D9EDF7; color: #327190; font-size: 13px;">
                        <th colspan="2">注意：基础部门不能删除！</th>
                    </tr>--%>
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
            <%-- 分页 --%>
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
                        <div class="row">
                            <span class="col-3">部门名：</span>
                            <input class="col-8 form-control popover-show" id="deptName" type="text" placeholder="请输入名字" data-placement="top" data-toggle="popover" data-content="部门名已存在，请重新输入" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="AddDept()">提交添加</button>
                    </div>
                </div>
            </div>
        </div>
        <%-- end modal --%>
    </div>
    <script src="script/DepartManager.js"></script>
</body>
</html>
