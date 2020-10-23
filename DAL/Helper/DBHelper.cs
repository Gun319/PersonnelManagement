using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DAL.Helper
{
    public class DBHelper
    {
        //连接字符串
        public static string connStr = ConfigurationManager.ConnectionStrings["PersonnelManagementDBEntities"].ConnectionString;
        /// <summary>
        /// 查询方法
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数列表</param>
        /// <returns></returns>
        public static DataTable GetDataTable(string sql, params SqlParameter[] param)
        {
            try
            {
                SqlDataAdapter dap = new SqlDataAdapter(sql, connStr);
                if (param != null)
                {
                    dap.SelectCommand.Parameters.AddRange(param);
                }
                DataTable dt = new DataTable();
                dap.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        } 
        /// <summary>
        /// 增删改
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <param name="param">参数列表</param>
        /// <returns></returns>
        public static bool GetExcuteNonQuery(string sql, params SqlParameter[] param)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    if (param != null)
                    {
                        cmd.Parameters.AddRange(param);
                    }
                    int i = cmd.ExecuteNonQuery();
                    return i > 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
