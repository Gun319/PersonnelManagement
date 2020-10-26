using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DepartmentDAL
    {
        /// <summary>
        /// 总经理查看部门信息
        /// </summary>
        /// <returns></returns>
        public static List<Department> GetDepartInfo()
        {
            string sql = @"select DepartmentID,DepartmentName from Department";
            DataTable dt = Helper.DBHelper.GetDataTable(sql, null);
            List<Department> dept = new List<Department>();
            foreach (DataRow item in dt.Rows)
            {
                Department department = new Department
                {
                    DepartmentID = Convert.ToInt32(item["DepartmentID"]),
                    DepartmentName = item["DepartmentName"].ToString()
                };

                dept.Add(department);
            }
            return dept;
        }

        /// <summary>
        /// 总经理根据部门id删除部门
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool DelDeptByID(string id)
        {
            string sql = @"exec('delete Department where DepartmentID in (' +@DepartmentID+ ')')";
            SqlParameter[] param = {
                new SqlParameter("DepartmentID",id),
            };
            return Helper.DBHelper.GetExcuteNonQuery(sql, param);
        }

        /// <summary>
        /// 根据部门名称查询部门（判度部门名称是否重复）
        /// </summary>
        /// <param name="deptName"></param>
        /// <returns></returns>
        public static DataTable SelDeptByDname(string deptName)
        {
            string sql = @" select DepartmentName from Department where DepartmentName=@DepartmentName ";
            SqlParameter[] param = {
                new SqlParameter("DepartmentName",deptName),
            };
            return Helper.DBHelper.GetDataTable(sql, param);
        }

        /// <summary>
        /// 添加部门
        /// </summary>
        /// <param name="deptName"></param>
        /// <returns></returns>
        public static bool AddDept(string deptName)
        {
            string sql = @" insert into Department (DepartmentName) values(@DepartmentName) ";
            SqlParameter[] param = {
                new SqlParameter("DepartmentName",deptName),
            };
            return Helper.DBHelper.GetExcuteNonQuery(sql, param);
        }
    }
}
