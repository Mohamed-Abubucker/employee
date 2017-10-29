using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Newtonsoft.Json;

namespace employee.Controllers
{
    public class EmployeeController : ApiController
    {
        EMPLOYEEEntities empdb;
        public EmployeeController()
        {
            empdb = new EMPLOYEEEntities();
        }
        // GET api/values
        public IEnumerable<employee> Get()
        {
            return empdb.employees.ToList();
        }

        // GET api/values/5
        public employee Get(int id)
        {
            return empdb.employees.Where(emp => emp.ID == id).First();
        }
        public IEnumerable<employee> Get(string word)
        {
            return empdb.employees.Where(emp => emp.NAME.Contains(word) || emp.SALARY == decimal.Parse(word) || emp.EMAIL == word || emp.MOBILE == word || emp.departments_master.DEPT_NAME == word || emp.designations_master.DESIGNATION == word).ToList();
        }
        [HttpPost]
        // POST api/values
        public employee Post(employee newemp)
        {
            empdb.employees.Attach(newemp);
            empdb.Entry(newemp).State = System.Data.Entity.EntityState.Added;
            empdb.SaveChanges();
            //var emp = empdb.createEmployee(newemp.NAME, newemp.DOJ, newemp.MOBILE, newemp.EMAIL, newemp.SALARY, newemp.DESIGN, newemp.DEPT);
            return newemp;
        }

        // PUT api/values/5
        [HttpPut]
        public employee Put(employee newemp)
        {
            empdb.employees.Attach(newemp);
            empdb.Entry(newemp).State = System.Data.Entity.EntityState.Modified;
            empdb.SaveChanges();
            return newemp;
        }

        // DELETE api/values/5
        [HttpDelete]
        public employee Delete(int id)
        {
            var emp = empdb.employees.Where(e => e.ID == id).First();
            empdb.Entry(emp).State = System.Data.Entity.EntityState.Deleted;
            empdb.SaveChanges();
            return emp;
        }
    }
}
