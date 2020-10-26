using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL
{
    /// <summary>
    /// 员工
    /// </summary>
    public class EmpDAL
    {
        /// <summary>
        /// 查询员工信息
        /// </summary>
        /// <returns></returns>
        public static List<EmpInfo> GetEmpInfo(int DepartId, string UserName)
        {
            string sql = @"select UserID,UserNumber,UserName,DepartmentName,UserSex,UserAge,UserTel,DimissionTime,BasePay 
                            from UserInfo u,Department d where u.DepartmentID=d.DepartmentID";
            if (DepartId != 0)
                sql += " and u.DepartmentID=@DepartmentID";
            if (!string.IsNullOrWhiteSpace(UserName))
                sql += " and UserName=@UserName";
            SqlParameter[] param = {
                new SqlParameter("DepartmentID",DepartId),
                new SqlParameter("UserName",UserName)
            };
            DataTable dt = Helper.DBHelper.GetDataTable(sql, param);

            List<EmpInfo> userInfos = new List<EmpInfo>();
            foreach (DataRow item in dt.Rows)
            {
                EmpInfo empInfo = new EmpInfo()
                {
                    UserID = Convert.ToInt32(item["UserID"]),
                    UserNumber = item["UserNumber"].ToString(),
                    UserName = item["UserName"].ToString(),
                    DepartmentName = item["DepartmentName"].ToString(),
                    UserSex = Convert.ToInt32(item["UserSex"]),
                    UserAge = Convert.ToInt32(item["UserAge"]),
                    UserTel = item["UserTel"].ToString(),
                    DimissionTime = string.Format("{0:yyyy-MM-dd}", item["DimissionTime"]),
                    BasePay = Convert.ToDouble(item["BasePay"]),
                };
                userInfos.Add(empInfo);
            }
            return userInfos;
        }
    }
}
