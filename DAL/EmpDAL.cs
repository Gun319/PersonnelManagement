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
    public class EmpDAL
    {
        public static List<dynamic> GetEmpInfo()
        {
            string sql = @"";
            DataTable dt = Helper.DBHelper.GetDataTable(sql, null);
            List<dynamic> userInfos = new List<dynamic>();
            foreach (DataRow item in dt.Rows)
            {
                dynamic obj = new ExpandoObject();

                obj.UserID = Convert.ToInt32(item["UserID"]);
                obj.UserName = item["UserName"].ToString();
                //obj.DepartmentName 
                userInfos.Add(obj); 
            }
            return userInfos;
        }
    }
}
