using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;

namespace UI.Ashx
{
    /// <summary>
    /// Department 的摘要说明
    /// </summary>
    public class Department : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["type"]== "dept")
            {
                SelDeptInfo(context);
            }
            if (context.Request["type"] == "DelDept")
            {
                DelDeptInfo(context);
            }
            if (context.Request["type"] == "Adddept")
            {
                AddDept(context);
            }
        }
        /// <summary>
        /// 总经理查看部门信息
        /// </summary>
        /// <param name="context"></param>
        public static void SelDeptInfo(HttpContext context)
        {
            var deptInfo = BLL.DepartmentBLL.GetDepartInfo();
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string json = jss.Serialize(deptInfo);
            context.Response.Write(json);
        }

        /// <summary>
        /// 总经理删除部门信息
        /// </summary>
        public static void DelDeptInfo(HttpContext context)
        {
            int code = 201;
            string id = context.Request["id"];
            id = id.Substring(0, id.Length - 1);
            if (BLL.DepartmentBLL.DelDeptByID(id))
                code = 200;
            context.Response.Write(code);
        }

        public static void AddDept(HttpContext context)
        {
            string deptName = context.Request["deptName"];
            //判断部门名称是否存在
            if (BLL.DepartmentBLL.SelDeptByDname(deptName).Rows.Count==0)
            {
                if (BLL.DepartmentBLL.AddDept(deptName))
                {
                    //部门添加成功
                    context.Response.Write(200);
                }
                else
                {
                    //201：请求失败
                    context.Response.Write(201);                   
                }
            }
            else
            {
                //202：部门已存在
                context.Response.Write(202);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}