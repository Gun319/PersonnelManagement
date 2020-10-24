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
    <link href="Content/css/Login.css" rel="stylesheet" />
</head>
<body>
    <div class="main">
        <div class="container text-center">
            <div class="content">
                <h1 class="pt-4 mb-5">人事管理登录</h1>
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
                    <div class="pb-5">
                        <input type="button" onclick="PostData()" class="btn btn-danger btn-block" value="登录" />
                        <span id="prompt" class="text-danger float-lg-right"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="footer0 text-center">
            &copy; 2020 Personnel Management Systems
        </div>
    </div>
    <script src="script/Login.js"></script>
</body>
</html>
