using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace employee
{
    public class EmpModel
    {
        public int ID { get; set; }
        public string NAME { get; set; }
        public Nullable<System.DateTime> DOJ { get; set; }
        public string MOBILE { get; set; }
        public string EMAIL { get; set; }
        public Nullable<decimal> SALARY { get; set; }
        public Nullable<int> DESIGN { get; set; }
        public Nullable<int> DEPT { get; set; }

    }
}