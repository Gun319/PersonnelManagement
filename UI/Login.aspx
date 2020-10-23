<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="title.ico" rel="icon" type="image/x-icon" />
    <title>登录</title>
    <link href="Content/Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="script/jquery-3.4.1.min.js"></script>
    <script src="script/BootstrapJS/bootstrap.min.js"></script>
    <style type="text/css">
        * {
            margin: 0 auto;
            padding: 0;
        }

        .main {
            width: calc(100vw);
            height: calc(100vh);
            background: url(/Content/images/Login/bk-login.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
        }

            .main > div {
                margin-top: calc(25vh);
            }

            .main .login {
                width: calc(25vw);
            }
    </style>
</head>
<body>
    <div class="main">
        <div class="container text-center">
            <h1 class="mb-5">人事管理登录</h1>
            <div class="form-group login">
                <div class="mb-3">
                    <input type="text" id="uName" class="form-control d-inline-block" value="" placeholder="用户名" />
                    <span id="nCue" class="text-danger float-lg-right"></span>
                </div>
                <div class="mb-3">
                    <input type="password" id="uPwd" class="form-control" value="" placeholder="密码" />
                    <span id="pCue" class="text-danger float-lg-right"></span>
                </div>
                <div class="mb-3">
                    <label class=" float-left">
                        &nbsp;<input type="checkbox" id="chkTrue" value="" /><span>记住密码</span>
                    </label>
                </div>
                <div>
                    <input type="button" onclick="PostData()" class="btn btn-danger btn-block" value="登录" />
                    <span id="prompt" class="text-danger float-lg-right"></span>
                </div>
            </div>
        </div>
        <div class="align-bottom text-center">
            &copy; 2020 Personnel Management Systems
        </div>
    </div>
</body>
</html>
<script>
    $(function () {
        getCookie();

        $("#uName,#uPwd").keydown((event) => {
            if (event.keyCode == "13") {
                // 调用Ajax方法
                if (($("#uName").val().length != 0) & $("#uPwd").val().length != 0)
                    PostData();
                // 非空提示
                if ($("#uName").val().length == 0)
                    $("#nCue").text("用户名不能为空");

                if ($("#uPwd").val().length == 0)
                    $("#pCue").text("密码不能为空");
            }
        })
    });

    /**
     清除lable标签内容
    */
    $("#uName,#uPwd").focus(() => {
        $("#nCue").text("");
        $("#pCue").text("");
    });

    /**
     登录异步验证
    */
    function PostData() {
        var uName = $("#uName").val();
        var uPwd = $("#uPwd").val();
        var chk1 = $("#chkTrue").is(":checked");
        $.ajax({
            url: '/UserLoginHandler.ashx',
            data: { type: "login", username: uName, userpwd: uPwd, chk1: chk1 },
            type: 'post',
            dataType: 'json',
            success: (data) => {
                if (data == 201) {
                    $("#prompt").text("用户名或密码错误");
                } else {
                    $.each(data, (index, item) => {
                        if (item.RoleID == 1)
                            alert('总经理');
                        //window.location.href = "/Admin/AdminIndex";
                        if (item.RoleID == 2)
                            alert('人事经理');
                        //window.location.href = "/Member/MemberByTeacher";
                        if (item.RoleID == 4)
                            alert('部门经理');
                        //window.location.href = "/Member/MemberByStudent";

                    });
                }
            }
        });
    }

    /**
     有Cookie对象则选中复选框
    */
    function getCookie() {
        $.ajax({
            url: '/UserLoginHandler.ashx',
            data: { type: "cookie" },
            type: 'post',
            dataType: 'json',
            success: (data) => {
                if (data == 200) {
                    $("#chkTrue").prop("checked", true);
                } else {
                    $("#chkTrue").prop("checked", false);
                }
            }
        })
    }
</script>
