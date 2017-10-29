using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace employee.Controllers
{
    public class HomeController : Controller
    {
        EMPLOYEEEntities empdb;
        public HomeController()
        {
            empdb = new EMPLOYEEEntities();
        }
        //public ActionResult Index()
        //{
        //    ViewBag.Title = "Home Page";

        //    var employees = empdb.employees.ToList();
        //    return View(employees);
        //}
        public ActionResult Index(string word = null)
        {
            ViewBag.Title = "Home Page";
            if (word == null)
            {
                var employees = empdb.employees.ToList();
                return View(employees);
            }
            else
            {
                var employees = empdb.employees.Where(emp => emp.NAME.Contains(word) || emp.EMAIL.Contains(word) || emp.MOBILE.Contains(word) || emp.departments_master.DEPT_NAME.Contains(word) || emp.designations_master.DESIGNATION.Contains(word)).ToList();
                return View(employees);
            }
        }
        public ActionResult Edit(int id)
        {
            ViewBag.Departments = empdb.departments_master.ToList();
            ViewBag.Designation = empdb.designations_master.ToList();
            var employee = empdb.employees.Where(e => e.ID == id).First();
            return View(employee);
        }

        public ActionResult Create()
        {
            ViewBag.Departments = empdb.departments_master.ToList();
            ViewBag.Designation = empdb.designations_master.ToList();
            return View();
        }

    }
}
