using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CPFrameWork.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            //return View();
            return RedirectToAction("Login", "Portal");
        }

        public ActionResult ViewSession()
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            foreach (string key in HttpContext.Session.Keys) {
                dic.Add(key, HttpContext.Session.GetString(key));
            }
            ViewData["dic"] = dic;
            return View();
        }
    }
}