using System;
using System.Collections.Generic;
using System.Data;
using System.Dynamic;
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
        public static List<dynamic> GetEmpInfo()
        {
            string sql = @"select UserID,UserName,DepartmentName,UserSex,UserAge,UserTel,DimissionTime,BasePay 
                            from UserInfo u,Department d where u.DepartmentID=d.DepartmentID";
            DataTable dt = Helper.DBHelper.GetDataTable(sql, null);
            List<dynamic> userInfos = new List<dynamic>();
            foreach (DataRow item in dt.Rows)
            {
                dynamic obj = new ExpandoObject();

                obj.UserID = Convert.ToInt32(item["UserID"]);
                obj.UserName = item["UserName"].ToString();
                obj.DepartmentName = item["DepartmentName"].ToString();
                obj.UserSex = Convert.ToInt32(item["UserSex"]);
                obj.UserAge = Convert.ToInt32(item["UserAge"]);
                obj.UserTel = item["UserTel"].ToString();
                obj.DimissionTime = item["DimissionTime"];
                obj.BasePay = item["BasePay"].ToString();

                userInfos.Add(obj);
            }
            return userInfos;
        }
    }
}
