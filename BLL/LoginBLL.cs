using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LoginBLL
    {
        /// <summary>
        /// 登录、查询用户名与密码是否匹配
        /// </summary>
        /// <param name="uName">登录名</param>
        /// <param name="uPwd">密码</param>
        /// <returns></returns>
        public static DataTable LoginGetUser(string uName, string uPwd)
        {
            return DAL.LoginDAL.LoginGetUser(uName, uPwd);
        }
    }
}
