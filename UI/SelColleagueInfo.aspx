<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelColleagueInfo.aspx.cs" Inherits="UI.SelColleagueInfo" %>

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
        }

        .ico {
            line-height: 30px;
            border-right: 1px solid #DEDEDE;
        }
    </style>
</head>
<body>
    <div>
        <div class="ml-3 mr-3 mt-3">
            <div class="empInfo text-center mt-2">
                <div>
                    <div class="ico float-left mt-2 mb-2 ml-3 pr-3">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
                            <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z" />
                            <circle cx="3.5" cy="5.5" r=".5" />
                            <circle cx="3.5" cy="8" r=".5" />
                            <circle cx="3.5" cy="10.5" r=".5" />
                        </svg>
                    </div>
                    <div class=" float-left mt-2 mb-2">
                        <div class="ml-3 d-inline-block">
                            <span style="font-weight: bold;">同事信息&nbsp;</span>
                            <input type="text" id="empName" value="" placeholder="查询同事姓名" />
                        </div>
                        <div class="ml-3 d-inline-block">
                            <button type="button" class="btn border" onclick="SelColleagueInfo()">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                                    <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                <table class="table table-bordered" id="dTab">
                    <thead>
                        <tr>
                            <th style="width: 150px;">编号</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>电话</th>
                            <th>工资</th>
                            <th>地址</th>
                            <th>入职日期</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        SelColleagueInfo();
    })

    /**
     查看同事信息
     */
    function SelColleagueInfo() {
        var empName = $("#empName").val();
        $.ajax({
            url: "/Handler/EmpHandler.ashx",
            data: {
                type: "ColleagueInfo",
                empName: empName
            },
            type: "post",
            dataType: "json",
            success: (data) => {
                var str = "";
                $.each(data, (index, item) => {
                    str += "<tr>" +
                        "<td>" + item["UserNumber"] + "</td>" +
                        "<td>" + item["UserName"] + "</td>" +
                        "<td>" + item["UserAge"] + "</td>" +
                        "<td>" + item["UserSex"] + "</td>" +
                        "<td>" + item["UserTel"] + "</td>" +
                        "<td>" + item["BasePay"] + "</td>" +
                        "<td>" + item["UserAddress"] + "</td>" +
                        "<td>" + date(item["EntryTime"]) + "</td>" +
                        "</tr>";
                })
                $("#dTab>tbody>tr").remove();
                $("#dTab>tbody").append(str);
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
</script>
