using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace employee.Controllers
{
    public class DesignationController : ApiController
    {
        EMPLOYEEEntities empdb;
        public DesignationController()
        {
            empdb = new EMPLOYEEEntities();
        }
        // GET: api/Designation
        public IEnumerable<designations_master> Get()
        {
            return empdb.designations_master.ToList();
        }

        // GET: api/Designation/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Designation
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Designation/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Designation/5
        public void Delete(int id)
        {
        }
    }
}
