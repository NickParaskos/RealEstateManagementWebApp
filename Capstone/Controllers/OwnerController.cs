﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.DAL.Interfaces;
using Capstone.Models;
using Microsoft.AspNetCore.Mvc;

namespace Capstone.Controllers
{
    public class OwnerController : Controller
    {
        private IPropertyDAL propertyDAL;
        private IUnitDAL unitDAL;
        private IApplicationDAL applicationDAL;

        public OwnerController(IPropertyDAL propertyDAL, IUnitDAL unitDAL, IApplicationDAL applicationDAL)
        {
            this.propertyDAL = propertyDAL;
            this.unitDAL = unitDAL;
            this.applicationDAL = applicationDAL;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Property()
        {
            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Property(Property property)
        {
            propertyDAL.AddProperty(property);

            return RedirectToAction("Unit");
        }

        [HttpGet]
        public IActionResult Unit()
        {
            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Unit(Unit unit)
        {
            unitDAL.AddUnit(unit);

            return RedirectToAction("Unit");
        }
<<<<<<< HEAD
        public IActionResult 
=======

        [HttpGet]
        public IActionResult Review()
        {
            List<Application> applications = applicationDAL.GetAllApplications();

            return View(applications);
        }

        //[ValidateAntiForgeryToken]
        //[HttpPost]
        //public IActionResult Review()
        //{

        //}
>>>>>>> deb26b883fd3203288f65e00decfb09b0d4376d6
    }
}