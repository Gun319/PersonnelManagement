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
                        &nbsp;<input type="checkbox" value="" /><span>记住密码</span>
                    </label>
                </div>
                <div>
                    <input type="button" class="btn btn-danger btn-block" value="登录" />
                </div>
            </div>
        </div>
    </div>
    <div class="nav navbar">
    </div>
</body>
</html>
