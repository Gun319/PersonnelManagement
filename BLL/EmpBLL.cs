using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace BLL
{
    /// <summary>
    /// 员工
    /// </summary>
    public class EmpBLL
    {
        /// <summary>
        /// 查询员工信息
        /// </summary>
        /// <returns></returns>
        public static List<EmpInfo> GetEmpInfo(int DepartId, string UserName)
        {
            return DAL.EmpDAL.GetEmpInfo(DepartId, UserName);
        }
    }
}
