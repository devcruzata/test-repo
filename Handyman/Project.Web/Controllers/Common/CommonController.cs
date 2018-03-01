using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project.Web.Models;
using BAL.Services;
using Utility.Helper;
using Project.ViewModel;
using Project.Entity;
using BAL.Constants;
using System.Diagnostics;
using BAL.Common;
using System.Data;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Security.Principal;
using System.Web.Routing;
using BAL.User;
using System.Configuration;
namespace Project.Web.Controllers
{
    public class CommonController : Controller
    {

        //Commom action for manging active/Deactive status for all modules.*******

        [Authorize]
        [HttpPost]
        public ActionResult ManageStatus(string tbl_id_auto_pk , string tbl_tbl_name)
        {
            Debug.WriteLine("function called . query id is: " + tbl_id_auto_pk + "and table name is : "+tbl_tbl_name);
            BAL.Common.CommonTaskManager objCommonManager = new CommonTaskManager();
            try
            {
                string response = objCommonManager.changeStatus(tbl_id_auto_pk, tbl_tbl_name);
                return Json(response, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                //save logs
                return Json("Failed", JsonRequestBehavior.AllowGet);
            }
        }



        //Action for managing service type(Hot/Normal)*******

        [Authorize]
        [HttpPost]
        public ActionResult ManageServiceType(string tbl_id_auto_pk, string tbl_tbl_name)
        {
            Debug.WriteLine("function called . query id is: " + tbl_id_auto_pk + "and table name is : " + tbl_tbl_name);
            BAL.Common.CommonTaskManager objCommonManager = new CommonTaskManager();
            try
            {
                string response = objCommonManager.changeServiceType(tbl_id_auto_pk, tbl_tbl_name);
                return Json(response, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                //save logs
                return Json("Failed", JsonRequestBehavior.AllowGet);
            }
        }


        //Commomn action for deleting db data for all modules******

        [Authorize]
        [HttpPost]
        public ActionResult DeleteDBData(string tbl_id_auto_pk, string tbl_tbl_name, string tbl_img_url)
        {
            Debug.WriteLine("function called . query id is: " + tbl_id_auto_pk + "and table name is : " + tbl_tbl_name);
            BAL.Common.CommonTaskManager objCommonManager = new CommonTaskManager();
            if (tbl_tbl_name == "service")
            {
                string fullPath = Request.MapPath(ConfigurationManager.AppSettings["ServiceImageDir"]+tbl_img_url);
               
                if (System.IO.File.Exists(fullPath))
                {
                    System.IO.File.Delete(fullPath);
                }
            }
            if (tbl_tbl_name == "category")
            {
                string fullPath = Request.MapPath(ConfigurationManager.AppSettings["CategoryImageDir"] + tbl_img_url);

                if (System.IO.File.Exists(fullPath))
                {
                    System.IO.File.Delete(fullPath);
                }
            }
            try
            {
                string response = objCommonManager.deleteTblData(tbl_id_auto_pk, tbl_tbl_name);
                return Json(response, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                //save logs
                return Json("Failed", JsonRequestBehavior.AllowGet);
            }
        }
    }
}