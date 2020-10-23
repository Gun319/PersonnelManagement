using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Helper;

namespace DAL
{
    public class LoginDAL
    {
        /// <summary>
        /// 登录、查询用户名与密码是否匹配
        /// </summary>
        /// <param name="uName">登录名</param>
        /// <param name="uPwd">密码</param>
        /// <returns></returns>
        public static DataTable LoginGetUser(string uName, string uPwd)
        {
            string sql = @"select UserID,LoginName,LoginPwd,UserName,RoleID from UserInfo where LoginName=@LoginName and LoginPwd=@LoginPwd";
            SqlParameter[] param = {
                new SqlParameter("LoginName",uName),
                new SqlParameter("LoginPwd",uPwd),
            };
            return DBHelper.GetDataTable(sql, param);
        }
    }
}
