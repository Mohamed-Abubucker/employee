﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class EMPLOYEEEntities : DbContext
    {
        public EMPLOYEEEntities()
            : base("name=EMPLOYEEEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<departments_master> departments_master { get; set; }
        public virtual DbSet<designations_master> designations_master { get; set; }
        public virtual DbSet<employee> employees { get; set; }
    
        public virtual ObjectResult<createEmployee_Result> createEmployee(string name, Nullable<System.DateTime> doj, string mobile, string email, Nullable<decimal> salary, Nullable<int> design, Nullable<int> dept)
        {
            var nameParameter = name != null ?
                new ObjectParameter("name", name) :
                new ObjectParameter("name", typeof(string));
    
            var dojParameter = doj.HasValue ?
                new ObjectParameter("doj", doj) :
                new ObjectParameter("doj", typeof(System.DateTime));
    
            var mobileParameter = mobile != null ?
                new ObjectParameter("mobile", mobile) :
                new ObjectParameter("mobile", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("email", email) :
                new ObjectParameter("email", typeof(string));
    
            var salaryParameter = salary.HasValue ?
                new ObjectParameter("salary", salary) :
                new ObjectParameter("salary", typeof(decimal));
    
            var designParameter = design.HasValue ?
                new ObjectParameter("design", design) :
                new ObjectParameter("design", typeof(int));
    
            var deptParameter = dept.HasValue ?
                new ObjectParameter("dept", dept) :
                new ObjectParameter("dept", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<createEmployee_Result>("createEmployee", nameParameter, dojParameter, mobileParameter, emailParameter, salaryParameter, designParameter, deptParameter);
        }
    }
}
