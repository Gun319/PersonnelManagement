using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class EmpInfo
    {
        public int UserID { get; set; }
        public string UserNumber { get; set; }
        public string UserName { get; set; }
        public string DepartmentName { get; set; }
        public int UserSex { get; set; }
        public int UserAge { get; set; }
        public string UserTel { get; set; }
        public string DimissionTime { get; set; }
        public double BasePay { get; set; }
        public string UserAddress { get; set; }
        public DateTime EntryTime { get; set; }
        public string UserRemarks { get; set; }
    }
}