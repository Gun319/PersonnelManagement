using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DepartmentBLL
    {
        /// <summary>
        /// 总经理查看部门信息
        /// </summary>
        /// <returns></returns>
        public static List<Department> GetDepartInfo()
        {
            return DAL.DepartmentDAL.GetDepartInfo();
        }

        /// <summary>
        /// 总经理根据部门id删除部门
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool DelDeptByID(string id)
        {
            return DAL.DepartmentDAL.DelDeptByID(id);
        }

        /// <summary>
        /// 根据部门名称查询部门（判度部门名称是否重复）
        /// </summary>
        /// <param name="deptName"></param>
        /// <returns></returns>
        public static DataTable SelDeptByDname(string deptName)
        {
            return DAL.DepartmentDAL.SelDeptByDname(deptName);
        }

        /// <summary>
        /// 添加部门
        /// </summary>
        /// <param name="deptName"></param>
        /// <returns></returns>
        public static bool AddDept(string deptName)
        {
            return DAL.DepartmentDAL.AddDept(deptName);
        }
    }
}
