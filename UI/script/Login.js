$(function () {
    getCookie();
    //默认选中
    $("#uName").focus();

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
    $("#prompt").text("");
});

/**
 登录异步验证
*/
function PostData() {
    var uName = $("#uName").val();
    var uPwd = $("#uPwd").val();
    var chk1 = $("#chkTrue").is(":checked");
    $.ajax({
        url: '/Handler/UserLoginHandler.ashx',
        data: { type: "login", username: uName, userpwd: uPwd, chk1: chk1 },
        type: 'post',
        dataType: 'json',
        success: (data) => {
            if (data != 201) {
                $.each(data, (index, item) => { //角色 RoleID (1.总经理 2.人事经理 3.人事助理 4.部门经理 5.员工)
                    if (item["RoleID"] == 1)
                        //alert('总经理');
                        //window.location.href("PersonalInfo.aspx");
                    if (item["RoleID"] == 2)
                        alert('人事经理');
                    if (item["RoleID"] == 3)
                        alert('人事助理');
                    if (item["RoleID"] == 4)
                        alert('部门经理');
                    if (item["RoleID"] == 5)
                        alert('员工');
                });
            } else {
                $("#prompt").text("用户名或密码错误");
            }
        }
    });
}

/**
 有Cookie对象则选中复选框
*/
function getCookie() {
    $.ajax({
        url: '/Handler/UserLoginHandler.ashx',
        data: { type: "cookie" },
        type: 'post',
        dataType: 'json',
        success: (data) => {
            if (data != 201) {
                $.each(data, (index, item) => {
                    $("#uName").val(item["uName"]);
                    $("#uPwd").val(item["uPwd"]);
                });
                $("#chkTrue").prop("checked", true);
            } else {
                $("#chkTrue").prop("checked", false);
            }
        }
    })
}