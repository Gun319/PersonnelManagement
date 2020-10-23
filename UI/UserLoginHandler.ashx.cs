using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace UI
{
    /// <summary>
    /// UserLoginHandler 的摘要说明
    /// </summary>
    public class UserLoginHandler : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            if (context.Request["type"] == "login")
                UserLogin(context);
            if (context.Request["type"] == "cookie")
                GetCookie(context);
        }

        /// <summary>
        /// 登录、查询用户名与密码是否匹配
        /// </summary>
        /// <param name="context"></param>
        public void UserLogin(HttpContext context)
        {
            string uName = context.Request["username"];
            string uPwd = context.Request["userpwd"];
            string chk1 = context.Request["chk1"];

            DataTable dt = BLL.LoginBLL.LoginGetUser(uName, uPwd);
            if (dt.Rows.Count == 1)
            {

                //记住密码
                Cookies(context, dt, chk1);
                //存Session
                context.Session["UserID"] = dt.Rows[0]["UserID"].ToString();
                context.Session["UserName"] = dt.Rows[0]["UserName"];
                string RoleID = dt.Rows[0]["RoleID"].ToString();


                context.Response.Write(new { code = 200, RoleID });
            }
            else
            {
                context.Response.Write(201);
            }
        }

        /// <summary>
        /// 存Cookie（记住密码）
        /// </summary>
        /// <param name="context"></param>
        /// <param name="dt"></param>
        /// <param name="chk1"></param>
        private void Cookies(HttpContext context, DataTable dt, string chk1)
        {
            //如果勾选免登录 加Cookie
            if (chk1 == "true")
            {
                //实例化Cookie对象
                HttpCookie user = new HttpCookie("User");
                //设置该对象的key值
                user.Values["name"] = dt.Rows[0]["LoginName"].ToString();
                user.Values["pwd"] = dt.Rows[0]["LoginPwd"].ToString();
                //设置过期时间
                user.Expires = DateTime.Now.AddDays(7);
                //将该对象添加到Cookie对象集合
                context.Response.Cookies.Add(user);
            }
            else
            {
                var user = context.Request.Cookies["User"];
                if (user != null)
                {
                    //设置过期时间
                    user.Expires = DateTime.Now.AddDays(-1);
                    context.Response.Cookies.Add(user);
                }
            }
        }

        /// <summary>
        /// cookie
        /// </summary>
        /// <returns></returns>
        public void GetCookie(HttpContext context)
        {
            int code = 201;
            var user = context.Request.Cookies["User"];
            if (user != null)
            {
                code = 200;
            }
            context.Response.Write(code);
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