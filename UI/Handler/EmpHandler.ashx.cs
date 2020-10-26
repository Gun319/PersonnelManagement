using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace UI.Handler
{
    /// <summary>
    /// EmpHandler 的摘要说明
    /// </summary>
    public class EmpHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            GetEmpInfo(context);
        }

        public void GetEmpInfo(HttpContext context)
        {
            var EmpInfo = BLL.EmpBLL.GetEmpInfo();
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string json = jss.Serialize(EmpInfo);
            context.Response.Write(json);
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