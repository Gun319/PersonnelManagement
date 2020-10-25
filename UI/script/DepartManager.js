$(function () {
    SelDept();

    $("#deptName").focus(() => {
        $("#deptName").popover("hide");
    })

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
        $("#myModal").modal({ backdrop: "static" });
    })
})

//查看部门信息
function SelDept() {
    $.ajax({
        url: "/Handler/DepartmentHandler.ashx",
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
    if (id.length != 0) {
        if (confirm("是否确定删除？")) {
            $.ajax({
                url: "/Handler/DepartmentHandler.ashx",
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
    } else {
        alert('请选择要删除的部门！');
    }
}

//添加部门信息
function AddDept() {
    var deptName = $("#deptName").val().trim();
    if (deptName.length != 0) {
        $.ajax({
            url: "/Handler/DepartmentHandler.ashx",
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
                    $("#deptName").popover("show");
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