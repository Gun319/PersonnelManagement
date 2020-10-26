<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fram.aspx.cs" Inherits="UI.Fram" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="title.ico" rel="icon" type="image/x-icon" />
    <title>XXX人事管理系统</title>
    <link href="Content/css/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/css/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="Content/css/css/fullcalendar.css" />
    <link rel="stylesheet" href="Content/css/css/matrix-style.css" />
    <link rel="stylesheet" href="Content/css/css/matrix-media.css" />
    <link href="Content/css/css/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="Content/css/css/jquery.gritter.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css' />
</head>
<body>

    <!--Header-part-->
    <div id="header">
        <h1><a href="dashboard.html">MatAdmin</a></h1>
    </div>
    <!--close-Header-part-->
    <!--top-Header-menu-->
    <div id="user-nav" class="navbar navbar-inverse">
        <ul class="nav">
            <li class=""><a title="" href="#"><i class="icon icon-cog"></i><span class="text">修改密码</span></a></li>
            <li class=""><a title="" href="Login.aspx"><i class="icon icon-share-alt"></i><span class="text">退出</span></a>
            </li>
        </ul>
    </div>
    <!--close-top-Header-menu-->
    <!--start-top-serch-->
    <div id="search">
        <input type="text" placeholder="Search here..." />
        <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
    </div>
    <!--close-top-serch-->
    <!--sidebar-menu-->
    <div id="sidebar">
        <a href="#" class="visible-phone"><i class="icon icon-home"></i></a>
        <ul>
            <!-- 员工管理 -->
            <li class="submenu active"><a href="#"><i class="icon icon-home"></i><span>员工资料管理</span></a>
                <ul>
                    <li><a href="#" target="iframe_a">个人信息</a></li>
                    <li><a href="#" target="iframe_a">查询同事信息</a></li>
                    <li><a href="EmpManager.aspx" target="iframe_a">员工管理</a></li>
                </ul>
            </li>

            <!-- 请假管理 -->
            <li class="submenu "><a href="#"><i class="icon icon-signal"></i><span>请假管理</span></a>
                <ul>
                    <li><a href="#" target="iframe_a">请假申请</a></li>
                    <li><a href="#" target="iframe_a">请假审批</a></li>
                    <li><a href="#" target="iframe_a">请假记录</a></li>
                </ul>
            </li>

            <!-- 考勤管理 -->
            <li class="submenu "><a href="#"><i class="icon icon-inbox"></i><span>考勤管理</span></a>
                <ul>
                    <li><a href="#" target="iframe_a">签到</a></li>
                    <li><a href="#" target="iframe_a">查看本日考勤</a></li>
                </ul>
            </li>

            <!-- 部门管理 -->
            <li><a href="DepartManager.aspx" target="iframe_a"><i class="icon icon-cloud"></i><span>部门管理</span></a></li>

            <!-- 加班管理 -->
            <li class="submenu "><a href="#"><i class="icon icon-th"></i><span>加班管理</span></a>
                <ul>
                    <li><a href="#" target="iframe_a">申请加班</a></li>
                    <li><a href="#" target="iframe_a">加班审核</a></li>
                </ul>
            </li>

            <!-- 业绩评定 -->
            <li class="submenu"><a href="#"><i class="icon icon-tint"></i><span>业绩评定</span></a>
                <ul>
                    <li><a href="#" target="iframe_a">填写业绩报告</a></li>
                    <li><a href="#" target="iframe_a">审核业绩报告</a></li>
                    <li><a href="#" target="iframe_a">部门年度汇总</a></li>
                </ul>
            </li>

            <!-- 薪资管理 -->
            <li class="submenu"><a href="#"><i class="icon icon-file"></i><span>薪资管理</span></a>
                <ul>
                    <li><a href="#" target="iframe_a">查看本月薪资</a></li>
                    <li><a href="#" target="iframe_a">申请加薪</a></li>
                </ul>
            </li>

            <!-- 公告管理 -->
            <li class="submenu"><a href="#"><i class="icon icon-info-sign"></i><span>公告管理</span></a>
                <ul>
                    <li><a href="#" target="iframe_a">通知管理</a></li>
                    <li><a href="#" target="iframe_a">通知列表</a></li>
                </ul>
            </li>
            <li class="content"><span>每个月带宽</span>
                <div class="progress progress-mini progress-danger active progress-striped">
                    <div style="width: 77%;" class="bar"></div>
                </div>
                <span class="percent">77%</span>
                <div class="stat">21419.94 / 14000 MB</div>
            </li>
        </ul>
    </div>
    <!--sidebar-menu-->

    <!--main-container-part-->
    <div id="content">
        <!--breadcrumbs-->
        <div id="content-header">
            <div id="breadcrumb">
                <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>主页</a>
            </div>
        </div>
        <!--End-breadcrumbs-->

        <!--Action boxes-->
        <div class="container-fluid">
            <!-- 子页面内容 -->

            <%--scrolling="no"消除边框     height:calc(100vh) 获取屏幕高度 <100vh>屏幕高度100% --%>
            <iframe src="EmpManager.aspx" name="iframe_a" style="border: 0; width: 100%; height: calc(100vh)"></iframe>
        </div>
    </div>

    <!--end-main-container-part-->

    <!--Footer-part-->

    <div class="row-fluid">
        <div id="footer" class="span12">
            Copyright &copy; 2018.Company name All rights reserved.<a target="_blank"
                href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
        </div>
    </div>

    <!--end-Footer-part-->
    <script src="script/js/jquery.min.js"></script>
    <script src="script/js/jquery.ui.custom.js"></script>
    <script src="script/js/bootstrap.min.js"></script>
    <script src="script/js/matrix.js"></script>

    <script type="text/javascript">
        // This function is called from the pop-up menus to transfer to
        // a different page. Ignore if the value returned is a null string:
        function goPage(newURL) {

            // if url is empty, skip the menu dividers and reset the menu selection to default
            if (newURL != "") {

                // if url is "-", it is this page -- reset the menu:
                if (newURL == "-") {
                    resetMenu();
                }
                // else, send page to designated URL            
                else {
                    document.location.href = newURL;
                }
            }
        }

        // resets the menu selection upon entry to this page:
        function resetMenu() {
            document.gomenu.selector.selectedIndex = 2;
        }
    </script>
</body>
</html>
