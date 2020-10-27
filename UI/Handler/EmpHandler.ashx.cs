using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace UI.Handler
{
    /// <summary>
    /// EmpHandler 的摘要说明
    /// </summary>
    public class EmpHandler : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            if (context.Request["type"] == "SelEmp")
                GetEmpInfo(context);
            if (context.Request["type"] == "ColleagueInfo")
                SelColleagueInfo(context);
            if (context.Request["type"] == "PersonalInfo")
                SelPerInfo(context);
            if (context.Request["type"] == "EditPerInfo")
                EditPerInfo(context);
        }

        /// <summary>
        /// 查询员工信息&条件查询
        /// </summary>
        /// <param name="context"></param>
        public void GetEmpInfo(HttpContext context)
        {
            int Dept = Convert.ToInt32(context.Request["Dept"]);
            string name = context.Request["name"];
            var EmpInfo = BLL.EmpBLL.GetEmpInfo(Dept, name);
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string json = jss.Serialize(EmpInfo);
            context.Response.Write(json);
        }

        /// <summary>
        /// 查询同事信息
        /// </summary>
        /// <param name="context"></param>
        public void SelColleagueInfo(HttpContext context)
        {
            string name = context.Request["empName"];
            var UserInfo = BLL.EmpBLL.SelColleagueInfo(name);
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string json = jss.Serialize(UserInfo);
            context.Response.Write(json);
        }

        /// <summary>
        /// 查看个人信息
        /// </summary>
        /// <param name="context"></param>
        public void SelPerInfo(HttpContext context)
        {
            //int id = Convert.ToInt32(context.Session["UserID"]);
            int userID = Convert.ToInt32(context.Request["userID"]);
            var perInfo = BLL.EmpBLL.SelPersonalInfo(userID);
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string json = jss.Serialize(perInfo);
            context.Response.Write(json);
        }

        /// <summary>
        /// 修改个人信息
        /// </summary>
        /// <param name="context"></param>
        public void EditPerInfo(HttpContext context)
        {
            UserInfo userInfo = new UserInfo()
            {
                //int id = Convert.ToInt32(context.Session["UserID"]);
                UserID = Convert.ToInt32(context.Request["userID"]),
                UserName = context.Request["uName"],
                UserAge = Convert.ToInt32(context.Request["uAge"]),
                UserSex = Convert.ToByte(context.Request["uSex"]),
                UserTel = context.Request["uTel"],
                UserAddress = context.Request["uAddress"],
                UserRemarks = context.Request["uRemarks"]
            };
            bool flag = BLL.EmpBLL.EditPersonalInfo(userInfo);
            if (flag)
            {
                context.Response.Write(200);
                return;
            }
            else
            {
                context.Response.Write(201);
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