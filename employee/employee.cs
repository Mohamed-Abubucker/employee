//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace employee
{
    using System;
    using System.Collections.Generic;
    
    public partial class employee
    {
        public int ID { get; set; }
        public string NAME { get; set; }
        public Nullable<System.DateTime> DOJ { get; set; }
        public string MOBILE { get; set; }
        public string EMAIL { get; set; }
        public Nullable<decimal> SALARY { get; set; }
        public Nullable<int> DESIGN { get; set; }
        public Nullable<int> DEPT { get; set; }
    
        public virtual departments_master departments_master { get; set; }
        public virtual designations_master designations_master { get; set; }
    }
}
