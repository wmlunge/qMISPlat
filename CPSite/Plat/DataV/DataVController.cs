using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CPFrameWork.Global;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CPFrameWork.Plat.DataV
{ 
    public class DataVController : CPMVCBaseController
    {
        public IActionResult ManaConfig()
        {
            base.SetGlobalViewBag();
            return View();
        }
        // GET: /<controller>/
        public IActionResult DataVView()
        {
            base.SetGlobalViewBag();
            if (CPAppContext.HostingEnvironment.IsDevelopment())
            {
                ViewBag.EChartJS = "echarts.js";
            }
            else
            {
                ViewBag.EChartJS = "echarts.common.min.js";
            }
            return View();
        }

        public IActionResult LayoutDesigner()
        {
            base.SetGlobalViewBag();
            return View();
        }
    }
}
