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
using System.Data;
using System.Configuration;
using BAL.Queries;


namespace Project.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            HomeModel model = new HomeModel();

            ServicesManager manager = new ServicesManager();

            model.ServicesList = manager.GetServiceListingsHot();

            for (int i = 0; i < model.ServicesList.Count; i++)
            {
                model.ServicesList[i].Service_ImageUrl = AppConfigValue.WebBaseUrl + AppConfigValue.ServiceImageDir + model.ServicesList[i].Service_ImageUrl;
            }

           return View(model);
        }
        
        public ActionResult Header()
        {
            return View("_HeaderPartial");
        }

        [HttpPost]
        [ActionName("ServicesLookup")]
        public ActionResult ServicesLookup()
        {
            
            ServicesManager manager = new ServicesManager();

            List<OK_Services> services = manager.GetServicesListForDropDown();

            List<SelectListItem> list = new List<SelectListItem>();

            list.Add(new SelectListItem { Value = "0", Text = "Choose a Service" });
            foreach (OK_Services sv in services)
            {
                list.Add(new SelectListItem { Value = sv.Service_ID_Auto_PK.ToString(), Text = sv.Service_Name });
            }

            JsonResult jResult = Json(list, JsonRequestBehavior.AllowGet);
            return jResult;
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Policies()
        {
            return View();
        }

        public ActionResult FAQ()
        {
            return View();
        }

        public ActionResult Terms()
        {
            return View();
        }

        public ActionResult Services()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ServiceListHomePage()
        {
            HomeModel model = new HomeModel();

            ServicesManager manager = new ServicesManager();
           
            model.ServicesList = manager.GetServiceListings();

            for (int i = 0; i < model.ServicesList.Count; i++)
            {
                model.ServicesList[i].Service_ImageUrl = AppConfigValue.WebBaseUrl + AppConfigValue.ServiceImageDir + model.ServicesList[i].Service_ImageUrl;
            }

            return View(model);
        }
        [HttpPost]
        public ActionResult ServiceListHomePage(string queryText)
        {
            Debug.WriteLine("search list function called . query text is : "+queryText);
           // ModelState.Clear();
            HomeModel model = new HomeModel();

            ServicesManager manager = new ServicesManager();
            
            model.ServicesList = manager.GetServiceListingOnSearch(queryText);

            for (int i = 0; i < model.ServicesList.Count; i++)
            {
                model.ServicesList[i].Service_ImageUrl = AppConfigValue.WebBaseUrl + AppConfigValue.ServiceImageDir + model.ServicesList[i].Service_ImageUrl;
            }
           return RedirectToAction("Index", "Home");
           // return View(model);
        }
        
        [HttpPost]
        public ActionResult AddQueryDetails(QueryModel obj)
        {
            objResponse response = new objResponse();
            QueryManager objqueryManager = new QueryManager();
            MailSender objMailSender = new Utility.Helper.MailSender();
            QueryDetails objQueryDetail = new QueryDetails();
            try
            {
                
               if(ModelState.IsValid)
               {
                    OK_WebQueries  objWebQueries = new Project.Entity.OK_WebQueries();
                                      
                    objWebQueries.Query_PersonName = obj.PersonName;
                    objWebQueries.Query_ContactNumber = obj.ContactNumber;
                    objWebQueries.Query_Email = obj.Email;
                    objWebQueries.Query_Address = obj.Address;
                    objWebQueries.Query_City = obj.City;
                    objWebQueries.Query_State = obj.State;
                    objWebQueries.Query_Service_Id = obj.Service_Id;
                    objWebQueries.Query_Comments = obj.Comments;
                    objWebQueries.CreatedBy = "Admin";
                    objWebQueries.CreatedDate= DateTime.Now;
                    objWebQueries.UpdatedBy = "Admin";
                    objWebQueries.UpdatedDate = DateTime.Now;
                    objWebQueries.Status = "active";
                    objWebQueries.Query_Customer_type = obj.Customer_type;


                    response  =objqueryManager.SaveQueries(objWebQueries);
                   
                   DataTable dt = new DataTable();
                   dt = response.ResponseData.Tables[0];
                   objQueryDetail.Query_PersonName = Convert.ToString(dt.Rows[0]["Query_PersonName"]);
               
                   objQueryDetail.Query_ContactNumber = Convert.ToString(dt.Rows[0]["Query_ContactNumber"]);
                   objQueryDetail.Query_Address = Convert.ToString(dt.Rows[0]["Query_Address"]);
                   objQueryDetail.Query_City = Convert.ToString(dt.Rows[0]["Query_City"]);
                   objQueryDetail.Query_State = Convert.ToString(dt.Rows[0]["Query_State"]);
                   objQueryDetail.Service_Name = Convert.ToString(dt.Rows[0]["Service_Name"]);
                   objQueryDetail.Query_Comments = Convert.ToString(dt.Rows[0]["Query_Comments"]);
                   objQueryDetail.Query_Customer_type = Convert.ToString(dt.Rows[0]["Query_Customer_type"]); 
                    
               }
               if ( (objQueryDetail.Query_PersonName) != "")
               {

                   string msg = "<p>A new customer request is genreated.</p><br /><p><b>Query Details--</b></p><table><tr><th>Customer Name</th><td>" + objQueryDetail.Query_PersonName + "</td></tr><tr><th>Contact Number</th><td>" + objQueryDetail.Query_ContactNumber + "</td></tr><tr><th>Address</th><td>" + objQueryDetail.Query_Address + "</td></tr><tr><th>City</th><td>" + objQueryDetail.Query_City + "</td></tr><tr><th>State</th><td>"+objQueryDetail.Query_State+"</td></tr><tr><th>Services</th><td>" + objQueryDetail.Service_Name + "</td></tr><tr><th>Comments</th><td>" + objQueryDetail.Query_Comments + "</td></tr><tr><th>Customer Type</th><td>"+objQueryDetail.Query_Customer_type+"</td></tr>";
                  // objMailSender.SendMail("abhishekkhemariya29@gmail.com", "Confirmation Mail", msg);
                   BAL.Common.Utilities.SendEmail(ConfigurationManager.AppSettings["Admin_Mail_Id"].ToString(), "Confirmation Mail", msg);
                   return Json("success", JsonRequestBehavior.AllowGet);
               }
               else
               {
                   return Json("error", JsonRequestBehavior.AllowGet);
               }
               
              
            }
            catch(Exception ex)
            {
                return View("500");
                //Save Log
                //Throw error
            }
        }   
     }
  }

