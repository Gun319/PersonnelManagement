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

        /// <summary>
        /// 查看同事信息（可根据同事姓名查询）
        /// </summary>
        /// <param name="Name"></param>
        /// <returns></returns>
        public static List<UserInfo> SelColleagueInfo(string Name)
        {
            return DAL.EmpDAL.SelColleagueInfo(Name);
        }

        /// <summary>
        /// 查看个人信息
        /// </summary>
        /// <returns></returns>
        public static List<EmpInfo> SelPersonalInfo(int userID)
        {
            return DAL.EmpDAL.SelPersonalInfo(userID);
        }

        /// <summary>
        /// 修改个人信息
        /// </summary>
        /// <param name="userInfo"></param>
        /// <returns></returns>
        public static bool EditPersonalInfo(UserInfo userInfo)
        {
            return DAL.EmpDAL.EditPersonalInfo(userInfo);
        }
    }
}
