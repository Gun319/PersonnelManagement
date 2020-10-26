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
                sql += @" and u.DepartmentID=@DepartmentID";
            if (!string.IsNullOrWhiteSpace(UserName))
                sql += @" and UserName=@UserName";
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

        /// <summary>
        /// 查看同事信息（可根据同事姓名查询）
        /// </summary>
        /// <param name="Name"></param>
        /// <returns></returns>
        public static List<UserInfo> SelColleagueInfo(string Name)
        {
            string sql = @"select UserNumber,UserName,UserAge,UserSex,UserTel,BasePay,UserAddress,EntryTime from UserInfo";
            if (!string.IsNullOrWhiteSpace(Name))
                sql += @" where UserName=@UserName";
            SqlParameter[] param = {
                new SqlParameter("UserName",Name)
            };
            DataTable dt = Helper.DBHelper.GetDataTable(sql, param);

            List<UserInfo> info = new List<UserInfo>();
            foreach (DataRow item in dt.Rows)
            {
                UserInfo userInfo = new UserInfo()
                {
                    UserNumber = item["UserNumber"].ToString(),
                    UserName = item["UserName"].ToString(),
                    UserAge = Convert.ToInt32(item["UserAge"]),
                    UserSex = Convert.ToByte(item["UserSex"]),
                    UserTel = item["UserTel"].ToString(),
                    BasePay = Convert.ToDecimal(item["BasePay"]),
                    UserAddress = item["UserAddress"].ToString(),
                    EntryTime = Convert.ToDateTime(item["EntryTime"])
                };
                info.Add(userInfo);
            }
            return info;
        }
    }
}
