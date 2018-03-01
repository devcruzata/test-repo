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
using System.IO;
using BAL.Queries;

namespace Project.Web.Controllers
{
    public class AdminController : Controller
    {
        
        
        public IFormsAuthenticationService FormsService { get; set; }      
        JavaScriptSerializer objJavaScriptSerializer = new JavaScriptSerializer();

        //protected override void Initialize(RequestContext requestContext)
        //{
        //    if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
        //   // if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

        //    base.Initialize(requestContext);
        //}
       
        //Admin Home Page*****

        [Authorize]
        public ActionResult SUPADMIN()
        {
           // Response.AddHeader("Refresh", "15");
            QueryModel objQuery = new QueryModel();
            QueryManager objQueryManager = new QueryManager();

            objQuery.Query_list = objQueryManager.GetQueryDetails();

            return View(objQuery);
        }

        [Authorize]
        public ActionResult ManageCustomer()
        {
            UserModel objUserModel = new UserModel();
            QueryManager objQueryManager = new QueryManager();

           objUserModel.User_List = objQueryManager.GetCustomerDetails();

           return View(objUserModel);
        }

        [Authorize]
        public ActionResult ManageProvider()
        {
            UserModel objUserModel = new UserModel();
            QueryManager objQueryManager = new QueryManager();

            objUserModel.User_List = objQueryManager.GetProviderDetails();

            return View(objUserModel);
        }


        public ActionResult Header()
        {
            return View("_HeaderPartialAdmin");
        }


        //Login For Admin******

        public ActionResult Login()
        {
            LogOnModel objModel = new LogOnModel();
            if (Request.Cookies["OK_Cookies"] != null)
            {
                HttpCookie getCookie = Request.Cookies["OK_Cookies"];
                objModel.UserName = Convert.ToString(getCookie.Values["UserName"]);
                objModel.Password = Convert.ToString(getCookie.Values["Password"]);
                objModel.RememberMe = true;               
                return View(objModel);
            }
            return View(objModel);
         
        }


        //Authrnticating admin by validating username and password*******

        public ActionResult UserAuthentication(LogOnModel model)
        {           
            AunthenticationManager objAuthManager = new AunthenticationManager();
          
            if (ModelState.IsValid)
            {
                OK_User objUser = new Project.Entity.OK_User();
                objUser.Username = model.UserName;
                objUser.User_Password = model.Password;

              
                if (model.RememberMe == true)
                {
                    Response.Cookies["OK_Cookies"]["UserName"] = model.UserName;
                    Response.Cookies["OK_Cookies"]["Password"] = model.Password;
                    Response.Cookies["OK_Cookies"].Expires = DateTime.Now.AddDays(28);
                }
                else
                {
                    Response.Cookies["OK_Cookies"].Expires = DateTime.Now.AddDays(-1);
                }

                DataTable responseTable = objAuthManager.Authenticate(objUser);
                if (Convert.ToString(responseTable.Rows[0][0]) == "Invalid password" || Convert.ToString(responseTable.Rows[0][0]) == "Invalid Email id" || Convert.ToString(responseTable.Rows[0][0]) == "Inactive account, Please contact to admin to activate your account.")
                {
                    return Json("error", JsonRequestBehavior.AllowGet);
                }
                else
                {                 
                    objUser.User_ID_Auto_PK = Convert.ToInt32(responseTable.Rows[0]["User_ID_Auto_PK"]);
                    objUser.User_FirstName = Convert.ToString(responseTable.Rows[0]["User_FirstName"]);
                    objUser.User_LastName = Convert.ToString(responseTable.Rows[0]["User_LastName"]);
                    objUser.User_ID_Auto_PK = Convert.ToInt32(responseTable.Rows[0]["User_ID_Auto_PK"]);
                    objUser.Username = Convert.ToString(responseTable.Rows[0]["Username"]);
                    objUser.User_Type = Convert.ToString(responseTable.Rows[0]["User_Type"]);
                   
                    if (objUser.User_Type != null)
                    {
                        FormsAuthentication.SetAuthCookie(objUser.Username, false);
                        Session["User"] = objUser.User_FirstName+" "+objUser.User_LastName;
                        Session["UserName"] = objUser.Username;
                      //  FormsService.SignIn(objJavaScriptSerializer.Serialize(objUser), model.RememberMe);
                        return Json("success,"+objUser.User_Type, JsonRequestBehavior.AllowGet);                      
                    }
                    else{
                        Debug.WriteLine("login unsuccess ");
                        return Json("error", JsonRequestBehavior.AllowGet);
                    }                   
                }                   
            }
            else
            {               
                return Json("error", JsonRequestBehavior.AllowGet);
            }           
        }


        //Logout action******

        [HttpGet]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();           
           return RedirectToAction("Login", "Admin");
        }
              
        //Action For ServiceList*******

        [Authorize]
        public ActionResult ManageServices()
        {
            HomeModel model = new HomeModel();

            ServicesManager manager = new ServicesManager();

            model.ServicesList = manager.GetServiceListings();
            return View(model);
        }

        //Action For Service Orders******

        [Authorize]
        public ActionResult ManageServiceOrder()
        {
            ServiceOrderListingViewModel model = new ServiceOrderListingViewModel();

            BAL.ServiceOrder.ServiceOrderManager manager = new BAL.ServiceOrder.ServiceOrderManager();

            model.service_Order = manager.GetServiceOrderListings();
            if (model.service_Order.Count == 0)
            {
                ViewBag.RowFlag = "0";
            }
            else
            {
                ViewBag.RowFlag = "1";
            }
            return View(model);
        }


        //Action for adding new Service Get Method******

        [Authorize]
        public ActionResult AddNewService()
        {
            //Geting Categories for dropdown**********
            BAL.Category.CategoryManager manager = new BAL.Category.CategoryManager();

            List<OK_Categories> services = manager.GetCategoriesListForDropDown();

            List<SelectListItem> list = new List<SelectListItem>();

            list.Add(new SelectListItem { Value = "0", Text = "Choose a Category" });
            foreach (OK_Categories cg in services)
            {
                list.Add(new SelectListItem { Value = cg.Category_ID_Auto_PK.ToString(), Text = cg.Category_Name });
            }
            ViewBag.category_List = list;

            //Fetching Basefare from DB for Dropdown************
            BAL.Services.ServicesManager manager1 = new ServicesManager();

            List<OK_BaseFare> baseFare = manager1.GetBaseFareForDropDown();

            List<SelectListItem> list1 = new List<SelectListItem>();

            list1.Add(new SelectListItem { Value = "", Text = "Choose a Base Fare" });
            foreach (OK_BaseFare bf in baseFare)
            {
                list1.Add(new SelectListItem { Value = bf.BaseFare_ID_Auto_PK.ToString(), Text = bf.Base_Fare.ToString() });
            }
            ViewBag.BaseFare_List = list1;
           
            return View();
        }


        //Action for adding new Service Post Method******

        [HttpPost]
        [Authorize]
        public ActionResult AddNewService(ServiceModel model)
        {
            BAL.Services.ServicesManager objServiceManager = new ServicesManager();
            OK_Services objServices = new OK_Services();
           
            try
            {

                //Geting Categories for dropdown**********
                BAL.Category.CategoryManager manager = new BAL.Category.CategoryManager();

                List<OK_Categories> services = manager.GetCategoriesListForDropDown();

                List<SelectListItem> list = new List<SelectListItem>();

                list.Add(new SelectListItem { Value = "0", Text = "Choose a Category" });
                foreach (OK_Categories cg in services)
                {
                    list.Add(new SelectListItem { Value = cg.Category_ID_Auto_PK.ToString(), Text = cg.Category_Name });
                }
                ViewBag.category_List = list;

                //Fetching Basefare from DB for Dropdown************
                BAL.Services.ServicesManager manager1 = new ServicesManager();

                List<OK_BaseFare> baseFare = manager1.GetBaseFareForDropDown();

                List<SelectListItem> list1 = new List<SelectListItem>();

                list1.Add(new SelectListItem { Value = "", Text = "Choose a Base Fare" });
                foreach (OK_BaseFare bf in baseFare)
                {
                    list1.Add(new SelectListItem { Value = bf.BaseFare_ID_Auto_PK.ToString(), Text = bf.Base_Fare.ToString() });
                }
                ViewBag.BaseFare_List = list1;


                // Adding New service into db****

                objServices.Service_Name = model.Name;
                objServices.Service_Category_ID_FK = model.Category_ID_FK;
                
                objServices.CreatedBy = "admin";
                objServices.UpdatedBy = "admin";
                objServices.CreatedDate = DateTime.Now;
                objServices.UpdatedDate = DateTime.Now;
                objServices.Status = "active";
                objServices.Service_Type = "normal";
                objServices.IsQuestionnare = true;
                if ((Convert.ToInt32(model.Basefare_ID_Auto_PK)) != 0)
                {
                    objServices.Basefare_ID_Auto_PK = Convert.ToInt32(model.Basefare_ID_Auto_PK);
                }
                else
                {
                    objServices.Basefare_ID_Auto_PK = 1;
                }
               
                if (model.Description == null)
                {
                    objServices.Service_Description = model.Name;
                }
                else
                {
                    objServices.Service_Description = model.Description;                    
                }
                DataTable response = objServiceManager.AddServices(objServices);
                string error = Convert.ToString(response.Rows[0][0]);
                if (error.Equals("Service Already Exist"))
                {
                    ViewBag.category_List = list;
                    ViewBag.BaseFare_List = list1;
                    TempData["ErrorMessage"] = "Service Already Exist";
                    return View();
                }
                else
                {                   
                    try
                    {
                        foreach (HttpPostedFileBase file in model.UploadedImages)
                        {
                            if (file != null)
                            {
                                string filename = System.IO.Path.GetFileName(file.FileName);
                                Debug.WriteLine("file name is: " + filename);
                                string[] fileext = filename.Split('.');
                                Random r = new Random();
                                string rno = (r.Next(0, 300)).ToString();
                                string service_preFix = "";
                                if (objServices.Service_Name.Contains("/"))
                                {
                                    service_preFix = objServices.Service_Name.Replace('/', '-');
                                }
                                //string newFileName = objServices.Service_Name +rno+"." + fileext[1];
                                string newFileName = service_preFix + rno + "." + fileext[1];


                                //string newFileName = objServices.Service_Name +rno+ "." + fileext[1];
                                string newFilePath = Server.MapPath(ConfigurationManager.AppSettings["ServiceImageDir"]) + newFileName;
                                file.SaveAs(newFilePath);

                                if (filename != "")
                                {
                                    objServices.Service_ImageUrl = newFileName;
                                    objServices.Service_IconUrl = newFileName;
                                    DataTable dt = objServiceManager.AddServiceImage(newFileName, Convert.ToInt32(response.Rows[0][0]));                                    
                                }

                            }

                        }


                        //Adding Default Question To Service

                        DataTable dtt = objServiceManager.addQuestionnare(Convert.ToInt32(response.Rows[0][0]), "Any Comments?", "text");
                        if (Convert.ToString(dtt.Rows[0][0]) != "")
                        {
                            TempData["ReturnType"] = "AffteAdd";
                            TempData["Service_Id_Pk"] = Convert.ToInt32(response.Rows[0][0]);
                            ViewBag.category_List = list;
                            ViewBag.BaseFare_List = list1;
                            return RedirectToAction("AddNewService", "Admin");
                        }
                        else
                        {
                            TempData["ErrorMessage"] = "There is an error in adding default Questionnare";
                            ViewBag.category_List = list;
                            ViewBag.BaseFare_List = list1;
                            return RedirectToAction("AddNewService", "Admin");
                        }

                    }
                    catch (Exception ex)
                    {
                        return RedirectToAction("AddNewService", "Admin");
                    }
                    ViewBag.category_List = list;
                    ViewBag.BaseFare_List = list1;
                    TempData["ReturnType"] = "AffteAdd";
                    TempData["Service_Id_Pk"] = Convert.ToInt32(response.Rows[0][0]);
                    return RedirectToAction("AddNewService", "Admin");
                }                         
            }
            catch (Exception ex)
            {
                //through error
                return View(500);
            }       
        }


        //Action for adding new questionnare get Method****

        [Authorize]
        public ActionResult AddQuestionnare(int Service_Auto_ID_Pk)
        {
            try
            {
                ViewBag.Service_Id_Pk = Service_Auto_ID_Pk;
                return View();
            }
            catch (Exception ex)
            {
                return View(500);
            }
        }


        //Action for adding new questionnare post Method****

        [Authorize]
        [HttpPost]
        public ActionResult AddQuestionnare(string Service_Auto_ID_Pk, string Question, string AnswerType ,string answer1, string answer2, string answer3, string answer4 ,string answer5,string answer6,string answer7,string answer8,string answer9,string answer10, string addMoreFlag)
        {
            int questionnare_id = 0;
            objResponse Response = new objResponse();
            try
            {
                string []answers = new string[10];
                if (answer1 != "") 
                {
                    answers[0] = answer1;
                }
                if (answer2 != "")
                {
                    answers[1] = answer2;
                }
                if (answer3 != "")
                {
                    answers[2] = answer3;
                }
                if (answer4 != "")
                {
                    answers[3] = answer4;
                }

                if (answer5 != "")
                {
                    answers[4] = answer5;
                }

                if (answer6 != "")
                {
                    answers[5] = answer6;
                }

                if (answer7 != "")
                {
                    answers[6] = answer7;
                }

                if (answer8 != "")
                {
                    answers[7] = answer8;
                }

                if (answer9 != "")
                {
                    answers[8] = answer9;
                }

                if (answer10 != "")
                {
                    answers[9] = answer10;
                }
                BAL.Services.ServicesManager objServiceManager = new ServicesManager();
                DataTable dt =  objServiceManager.addQuestionnare(Convert.ToInt32(Service_Auto_ID_Pk), Question, AnswerType);
                questionnare_id = Convert.ToInt32(dt.Rows[0][0]);
                if (AnswerType == "radio" || AnswerType == "check")
                {                   
                    foreach (string ans in answers)
                    {                      
                        DataTable data = objServiceManager.addAnswerSet(Convert.ToInt32(Service_Auto_ID_Pk), questionnare_id, ans);

                    }
                }

                if (addMoreFlag == "0")
                {
                    return Json(Service_Auto_ID_Pk, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    TempData["Service_Auto_ID_Pk"] = Service_Auto_ID_Pk;
                    return Json(Service_Auto_ID_Pk, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return View(500);
            }
        }



        //Action for Showing Questionnare For a service*****

        [Authorize]
        public ActionResult ManageQuestionnare(String Service_Auto_Id_pk)
        {
            objResponse Response = new objResponse();
            ServiceQuestionnareModel objQuestionnareModel = new ServiceQuestionnareModel();
            ServicesManager objServiceManager = new ServicesManager();
            List<ServiceQuestionnareModel> qList = new List<ServiceQuestionnareModel>();
            try
            {
                Response = objServiceManager.getQuestionnare(Convert.ToInt32(Service_Auto_Id_pk));
                if (Response.ErrorCode == 0) 
                {
                    if (Response.ResponseData.Tables[0].Rows[0][0].ToString() != "There is no Questioonare For This Service")
                    {
                        foreach (DataRow dr in Response.ResponseData.Tables[0].Rows)
                        {
                            ServiceQuestionnareModel objModel = new ServiceQuestionnareModel();
                            objModel.Questionnare_ID_Auto_PK = Convert.ToInt32(dr["Questionnare_ID_Auto_PK"]);
                            objModel.Question = Convert.ToString(dr["QuestionDesc"]);
                            objModel.AnswerType = Convert.ToString(dr["AnswerType"]);
                            qList.Add(objModel);
                        }
                        objQuestionnareModel.questions_List = qList;
                        
                    }
                    else
                    {
                        objQuestionnareModel.questions_List = qList;
                    }
                   
                }               
                ViewBag.Service_id = Service_Auto_Id_pk;
                return View(objQuestionnareModel);
            }
            catch (Exception ex)
            {
                return View(500);
            }
        }


        //Action for Update service Get Method*****

        [Authorize]
        public ActionResult UpdateService(string Service_id, Boolean isPostBack = false)
        {
            BAL.Services.ServicesManager objServiceManager = new ServicesManager();
            ServiceModel objServiceModel = new ServiceModel();
            try
            {
                //Geting Categories for dropdown**********
                BAL.Category.CategoryManager manager = new BAL.Category.CategoryManager();

                List<OK_Categories> services = manager.GetCategoriesListForDropDown();

                List<SelectListItem> list = new List<SelectListItem>();

                list.Add(new SelectListItem { Value = "0", Text = "Choose a Category" });
                foreach (OK_Categories cg in services)
                {
                    list.Add(new SelectListItem { Value = cg.Category_ID_Auto_PK.ToString(), Text = cg.Category_Name });
                }
                ViewBag.category_List = list;

                //Fetching Basefare from DB for Dropdown************
                BAL.Services.ServicesManager manager1 = new ServicesManager();

                List<OK_BaseFare> baseFare = manager1.GetBaseFareForDropDown();

                List<SelectListItem> list1 = new List<SelectListItem>();

                list1.Add(new SelectListItem { Value = "", Text = "Choose a Base Fare" });
                foreach (OK_BaseFare bf in baseFare)
                {
                    list1.Add(new SelectListItem { Value = bf.BaseFare_ID_Auto_PK.ToString(), Text = bf.Base_Fare.ToString() });
                }
                ViewBag.BaseFare_List = list1;

                //Updating Service*********

                DataTable response = objServiceManager.GetServiceForUpdate(Convert.ToInt32(Service_id));
                objServiceModel.ID_Auto_PK = Convert.ToInt32(response.Rows[0]["Service_ID_Auto_PK"].ToString());
                objServiceModel.Name = response.Rows[0]["Service_Name"].ToString();
                objServiceModel.Category_ID_FK = Convert.ToInt32(response.Rows[0]["Service_Category_ID_FK"]);      
                objServiceModel.ImageUrl = response.Rows[0]["Service_ImageUrl"].ToString();
                objServiceModel.Description = response.Rows[0]["Service_Description"].ToString();
                objServiceModel.Basefare_ID_Auto_PK = response.Rows[0]["BaseFare_ID_FK"].ToString();

                return View(objServiceModel);
            }
            catch (Exception ex)
            {
                return View(500);
                // throw error
            }

        }


        //Action for Update service Post Method*****

        [Authorize]
        [HttpPost]
        public ActionResult UpdateService(ServiceModel model)
        {
            BAL.Services.ServicesManager objServiceManager = new ServicesManager();
            OK_Services objServices = new OK_Services();
            objResponse resp = new objResponse();
            try
            {
                //Geting Categories for dropdown**********
                BAL.Category.CategoryManager manager = new BAL.Category.CategoryManager();

                List<OK_Categories> services = manager.GetCategoriesListForDropDown();

                List<SelectListItem> list = new List<SelectListItem>();

                list.Add(new SelectListItem { Value = "0", Text = "Choose a Category" });
                foreach (OK_Categories cg in services)
                {
                    list.Add(new SelectListItem { Value = cg.Category_ID_Auto_PK.ToString(), Text = cg.Category_Name });
                }
                ViewBag.category_List = list;


                //Fetching Basefare from DB for Dropdown************
                BAL.Services.ServicesManager manager1 = new ServicesManager();

                List<OK_BaseFare> baseFare = manager1.GetBaseFareForDropDown();

                List<SelectListItem> list1 = new List<SelectListItem>();

                list1.Add(new SelectListItem { Value = "", Text = "Choose a Base Fare" });
                foreach (OK_BaseFare bf in baseFare)
                {
                    list1.Add(new SelectListItem { Value = bf.BaseFare_ID_Auto_PK.ToString(), Text = bf.Base_Fare.ToString() });
                }
                ViewBag.BaseFare_List = list1;

                //uPDATING SERVICE*******


                objServices.Service_ID_Auto_PK = model.ID_Auto_PK;
                objServices.Service_Name = model.Name;
                objServices.Service_Category_ID_FK = model.Category_ID_FK;                             
                objServices.UpdatedDate = DateTime.Now;
                objServices.UpdatedBy = "admin";
                objServices.IsQuestionnare = model.IsQuestionnare;
                if((Convert.ToInt32(model.Basefare_ID_Auto_PK)) !=0){
                    objServices.Basefare_ID_Auto_PK = Convert.ToInt32(model.Basefare_ID_Auto_PK);
                }
                else
                {
                    objServices.Basefare_ID_Auto_PK = 1;
                }
               
                if (model.Description == null)
                {
                    objServices.Service_Description = model.Name;
                }
                else
                {
                    objServices.Service_Description = model.Description;

                }

                DataTable response = objServiceManager.UpdateServices(objServices);
               // string errorCheck = Convert.ToString(response.Rows[0][0]);
                if (resp.ErrorCode !=0)
                {
                    ViewBag.BaseFare_List = list1;
                    ViewBag.category_List = list;
                    TempData["ErrorMessage"] = "There is an error in processing your request";
                    return View();
                }
                else
                {
                    try
                    {
                        foreach (HttpPostedFileBase file in model.UploadedImages)
                        {
                            if (file != null)
                            {
                                string fullPath = Request.MapPath(ConfigurationManager.AppSettings["ServiceImageDir"] + model.imgFlag);

                                if (System.IO.File.Exists(fullPath))
                                {
                                    System.IO.File.Delete(fullPath);
                                }
                                string filename = System.IO.Path.GetFileName(file.FileName);
                                string[] fileext = filename.Split('.');
                                Random r = new Random();
                                string rno = (r.Next(0, 300)).ToString();
                                string service_preFix = "";
                                if (objServices.Service_Name.Contains("/"))
                                {
                                    service_preFix = objServices.Service_Name.Replace('/', '-');
                                }
                                //string newFileName = objServices.Service_Name +rno+"." + fileext[1];
                                string newFileName = service_preFix + rno + "." + fileext[1];
                                string newFilePath = Server.MapPath(ConfigurationManager.AppSettings["ServiceImageDir"]) + newFileName;
                                file.SaveAs(newFilePath);

                                if (filename != "")
                                {
                                    if (filename == model.imgFlag)
                                    {
                                        objServices.Service_ImageUrl = model.imgFlag;
                                        objServices.Service_IconUrl = model.imgFlag;
                                    }
                                    else
                                    {
                                        objServices.Service_ImageUrl = newFileName;
                                        objServices.Service_IconUrl = newFileName;                                       
                                    }
                                    DataTable dt = objServiceManager.AddServiceImage(newFileName, Convert.ToInt32(response.Rows[0][0]));
                                    if (resp.ErrorCode ==0)
                                    {
                                   
                                        return RedirectToAction("ManageServices", "Admin");
                                    }
                                    else
                                    {
                                        TempData["ErrorMessage"] = "There is an error in adding service image";
                                       
                                        return RedirectToAction("ManageServices", "Admin");
                                    }
                                }

                            }

                        }
                    }
                    catch (Exception ex)
                    {
                        return RedirectToAction("ManageServices", "Admin");
                    }
                    return RedirectToAction("ManageServices", "Admin");
                }               
            }
            catch (Exception ex)
            {
                //through error
                return View(500);
            }
        }


        //Action For Fetching categories list for dropdown****

        [Authorize]
        [HttpPost]
        public ActionResult GetCategories()
        {
            BAL.Category.CategoryManager manager = new BAL.Category.CategoryManager();

            List<OK_Categories> services = manager.GetCategoriesListForDropDown();

            List<SelectListItem> list = new List<SelectListItem>();

            list.Add(new SelectListItem { Value = "0", Text = "Choose a Category" });
            foreach (OK_Categories cg in services)
            {
                list.Add(new SelectListItem { Value = cg.Category_ID_Auto_PK.ToString(), Text = cg.Category_Name });
            }

            JsonResult jResult = Json(list, JsonRequestBehavior.AllowGet);
            return jResult;
        }


        //Action For Fetching basefare list for dropdown****

        [Authorize]
        [HttpPost]
        public ActionResult GetBaseFare()
        {
            BAL.Services.ServicesManager manager = new ServicesManager();

            List<OK_BaseFare> baseFare = manager.GetBaseFareForDropDown();

            List<SelectListItem> list = new List<SelectListItem>();

            list.Add(new SelectListItem { Value = "", Text = "Choose a Base Fare" });
            foreach (OK_BaseFare bf in baseFare)
            {
                list.Add(new SelectListItem { Value = bf.BaseFare_ID_Auto_PK.ToString(), Text = bf.Base_Fare.ToString() });
            }

            JsonResult jResult = Json(list, JsonRequestBehavior.AllowGet);
            return jResult;
        }


        //Action for categories list*******

        [Authorize]
        public ActionResult ManageCategories()
        {
            HomeModel model = new HomeModel();

            BAL.Category.CategoryManager manager = new BAL.Category.CategoryManager();

            model.CategoriesList = manager.GetCategoryListings();
            return View(model);
        }


        //Action For add new category get Method******

        [Authorize]
        public ActionResult AddNewCategory()
        {

            return View();
        }



        //Action For add new category post  Method******

        [Authorize]
        [HttpPost]
        public ActionResult AddNewCategory(CategoryModel model)
        {
            BAL.Category.CategoryManager objCategoryManager = new BAL.Category.CategoryManager();
            OK_Categories objCategories = new OK_Categories();
      
            try
            {
                objCategories.Category_Name = model.Name;              
               // objCategories.Category_IsParent = true;
                //objCategories.Category_Parent_ID_FK = true;
                objCategories.CreatedBy = "admin";
                objCategories.UpdatedBy = "admin";
                objCategories.CreatedDate = DateTime.Now;
                objCategories.UpdatedDate = DateTime.Now;
                objCategories.Status = "active";
                if (model.Description == null)
                {
                    objCategories.Category_Description = model.Name;
                }
                else
                {
                    objCategories.Category_Description = model.Description;

                }
                DataTable response = objCategoryManager.AddCategories(objCategories);
                string errorCheck = Convert.ToString(response.Rows[0][0]);
                if (errorCheck.Equals("Category Already Exist"))
                {
                     TempData["ErrorMessage"] = "Category Already Exist";
                     return View();
                }
                else
                {
                    try
                    {
                        foreach (HttpPostedFileBase file in model.UploadedImages)
                        {
                            if (file != null)
                            {
                                string filename = System.IO.Path.GetFileName(file.FileName);
                                Debug.WriteLine("file name is: " + filename);
                                string[] fileext = filename.Split('.');
                                Random r = new Random();
                                string rno = (r.Next(0, 300)).ToString(); 
                                string newFileName = objCategories.Category_Name +rno+"." + fileext[1];
                                string newFilePath = Server.MapPath(ConfigurationManager.AppSettings["CategoryImageDir"]) + newFileName;
                                file.SaveAs(newFilePath);
                               

                                if (filename != "")
                                {
                                    objCategories.Category_ImageUrl = newFileName;
                                    objCategories.Category_IconUrl = newFileName;
                                    DataTable dt = objCategoryManager.AddCategoryImage(newFileName, Convert.ToInt32(response.Rows[0][0]));
                                    string errorcheck = Convert.ToString(dt.Rows[0][0]);
                                    if (!(errorCheck.Equals("")))
                                    {

                                        return RedirectToAction("ManageCategories", "Admin");
                                    }
                                    else
                                    {
                                        ViewBag.ErrorMessage = "There is an error in adding Category image";
                                        return RedirectToAction("ManageCategories", "Admin");
                                    }
                                }

                            }

                        }

                    }
                    catch (Exception ex)
                    {
                        return RedirectToAction("ManageCategories", "Admin");
                    }
                    
                    return RedirectToAction("ManageCategories", "Admin");
                }         
            }
            catch (Exception ex)
            {
                //through error
                return View(500);
            }

        }


        //Action For updating a category get Method*****

        [Authorize]
        public ActionResult UpdateCategory(string Category_id, Boolean isPostBack = false)
        {
            BAL.Category.CategoryManager objCategoryManager = new BAL.Category.CategoryManager();
            CategoryModel objCategoryMoel = new CategoryModel();
            try
            {
                DataTable response = objCategoryManager.GetCategoryForUpdate(Convert.ToInt32(Category_id));
                objCategoryMoel.ID_Auto_PK = Convert.ToInt32(response.Rows[0]["Category_ID_Auto_PK"].ToString());
                objCategoryMoel.Name = response.Rows[0]["Category_Name"].ToString();                
                //  objServiceModel.ImageUrl = Request.MapPath("~/Content/service_img/"+response.Rows[0]["Service_ImageUrl"].ToString());
                objCategoryMoel.ImageUrl = response.Rows[0]["Category_ImageUrl"].ToString();
                objCategoryMoel.Description = response.Rows[0]["Category_Description"].ToString();
                return View(objCategoryMoel);
            }
            catch (Exception ex)
            {
                return View(500);
                // throw error
            }
        }


        //Action For updating a category post Method*****

        [Authorize]
        [HttpPost]
        public ActionResult UpdateCategory(ServiceModel model)
        {
            BAL.Category.CategoryManager objCategoryManager = new BAL.Category.CategoryManager();
            OK_Categories objCategories = new OK_Categories();

            try
            {
                objCategories.Category_ID_Auto_PK = model.ID_Auto_PK;
                objCategories.Category_Name = model.Name;  
                objCategories.UpdatedDate = DateTime.Now;
                objCategories.UpdatedBy = "admin";

                if (model.Description == null)
                {
                    objCategories.Category_Description = model.Name;
                }
                else
                {
                    objCategories.Category_Description = model.Description;
                }

                DataTable response = objCategoryManager.UpdateCategory(objCategories);
                string errorCheck = Convert.ToString(response.Rows[0][0]);
                if (errorCheck.Equals(null))
                {
                    TempData["ErrorMessage"] = "There is an error in processing your request";
                    return View();
                }
                else
                {
                    try
                    {
                        foreach (HttpPostedFileBase file in model.UploadedImages)
                        {
                            if (file != null)
                            {
                                string fullPath = Request.MapPath(ConfigurationManager.AppSettings["CategoryImageDir"] + model.imgFlag);

                                if (System.IO.File.Exists(fullPath))
                                {
                                    System.IO.File.Delete(fullPath);
                                }
                                string filename = System.IO.Path.GetFileName(file.FileName);
                                string[] fileext = filename.Split('.');
                                Random r = new Random();
                                string rno = (r.Next(0, 300)).ToString(); 
                                string newFileName = objCategories.Category_Name +rno+"." + fileext[1];
                                string newFilePath = Server.MapPath(ConfigurationManager.AppSettings["CategoryImageDir"]) + newFileName;
                                file.SaveAs(newFilePath);

                                if (filename != "")
                                {
                                    if (filename == model.imgFlag)
                                    {
                                        objCategories.Category_ImageUrl = model.imgFlag;
                                        objCategories.Category_IconUrl = model.imgFlag;
                                    }
                                    else
                                    {
                                        objCategories.Category_ImageUrl = newFileName;
                                        objCategories.Category_IconUrl = newFileName;

                                    }
                                    DataTable dt = objCategoryManager.AddCategoryImage(newFileName, Convert.ToInt32(response.Rows[0][0]));
                                    string err = Convert.ToString(dt.Rows[0][0]);

                                    if (!(err.Equals(null)))
                                    {

                                        return RedirectToAction("ManageCategories", "Admin");
                                    }
                                    else
                                    {
                                        TempData["ErrorMessage"] = "There is an error in adding category image";
                                        return RedirectToAction("ManageCategories", "Admin");
                                    }
                                }

                            }

                        }
                    }
                    catch (Exception ex)
                    {
                        return RedirectToAction("ManageCategories", "Admin");
                    }
                    return RedirectToAction("ManageCategories", "Admin");
                }               
            }
            catch (Exception ex)
            {
                //through error
                return View(500);
            }
        }


        //Action For Showing Questionnare for a service Order****

        [Authorize]
        public ActionResult ViewQuestionnare(int service_order_id)
        {
            BAL.ServiceOrder.ServiceOrderManager objManager = new BAL.ServiceOrder.ServiceOrderManager();
            objResponse Response = new objResponse();
            ServiceOrderListingViewModel objServiceOrder = new ServiceOrderListingViewModel();
            try
            {
                Response = objManager.getQuestionnareForOrder(service_order_id);
                if (Response.ErrorCode == 0)
                {
                    
                                     
                    foreach (DataRow dr in Response.ResponseData.Tables[0].Rows)
                    {
                        Project.ViewModel.Question q = new Question()
                        {
                            Questions = Convert.ToString(dr["QuestionDesc"])
                        };
                       
                       Response = objManager.getQuestionnareForOrder(service_order_id, Convert.ToInt32((dr["Questionnare_ID_FK"])));
                       if (Response.ErrorCode == 0)
                       {
                           foreach (DataRow drr in Response.ResponseData.Tables[0].Rows)
                           {
                               q.answers.Add(new Project.ViewModel.Answer()
                               {
                                   Answers = Convert.ToString(drr["AnswerDesc"])
                               });
                           }
                       }
                       objServiceOrder.question.Add(q);
                       ViewBag.msg = "success";
                    }
                   
                }
                else
                {
                    ViewBag.msg = "There Is An Error In Fetching Questionnare . Please Try Again";
                }
                return View(objServiceOrder);
            }
            catch (Exception ex)
            {
                //through error
                return View(500);
            }
        }      

        
        //Action to show Question details for a service******

        [Authorize]
        public ActionResult QuestionnareDetails(string Service_Id_Pk, string Questionnare_Id_Pk)
        {
            ServiceQuestionnareModel objQuestionnareModel = new ServiceQuestionnareModel();
            BAL.Services.ServicesManager objServiceManager = new ServicesManager();
            objResponse Response = new objResponse();
            try
            {
                Response = objServiceManager.getQuestionnareDetails(Convert.ToInt32(Service_Id_Pk), Convert.ToInt32(Questionnare_Id_Pk));

                if (Response.ErrorCode == 0)
                {
                    objQuestionnareModel.Questionnare_ID_Auto_PK = Convert.ToInt32(Response.ResponseData.Tables[0].Rows[0]["Questionnare_ID_Auto_PK"]);
                    objQuestionnareModel.Service_ID_FK = Convert.ToInt32(Response.ResponseData.Tables[0].Rows[0]["Service_ID_FK"]);
                    objQuestionnareModel.Question = Convert.ToString(Response.ResponseData.Tables[0].Rows[0]["QuestionDesc"]);
                    objQuestionnareModel.AnswerType = Convert.ToString(Response.ResponseData.Tables[0].Rows[0]["AnswerType"]);

                    Response = objServiceManager.getAnswerForQuestionnare(Convert.ToInt32(Questionnare_Id_Pk));
                    foreach (DataRow dr in Response.ResponseData.Tables[0].Rows)
                    {
                        Answers ans = new Answers()
                        {
                            AnswerSet_ID_Auto_PK = Convert.ToInt32(dr["AnswerSet_ID_Auto_PK"]),
                            AnswerDesc = Convert.ToString(dr["AnswerDesc"])
                        };
                        objQuestionnareModel.Answer_List.Add(ans);
                    }       
                }
                ViewBag.Questionnare_Id_Pk = Questionnare_Id_Pk;
                return View(objQuestionnareModel);
            }
            catch (Exception ex)
            {
                //through error
                return View(500);
            }
        }


        //Action For Deleting a question for a service****

        [HttpPost]
        [Authorize]
        public ActionResult DeleteQuestion(string Questionnare_Id , string Service_id)
        {
            objResponse Response = new objResponse();
            BAL.Common.CommonTaskManager objCommon = new CommonTaskManager();
            try
            {
                 Response = objCommon.deleteQuestionnare(Convert.ToInt32(Service_id), Convert.ToInt32(Questionnare_Id));
                if (Response.ErrorCode == 0)
                {
                    return Json(Response.ErrorMessage, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json("Error", JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                //through error
                return View(500);
            }
        }

        //Action For changimg Service Order Status*****

        [Authorize]
        [HttpPost]
        public ActionResult ChangeOrderStatus(string ServiceOrder_id_auto_pk, string Action)
        {
            objResponse Response = new objResponse();
            BAL.ServiceOrder.ServiceOrderManager objOrderManager = new BAL.ServiceOrder.ServiceOrderManager();
            try
            {
                Response = objOrderManager.changeOrderAction(Convert.ToInt32(ServiceOrder_id_auto_pk), Action);
                if(Response.ErrorCode ==0)
                {
                    return Json("success", JsonRequestBehavior.AllowGet); 
                }
                else
                {
                    return Json("Error", JsonRequestBehavior.AllowGet);
                }
            }
            catch(Exception ex)
            {
                return Json("Error", JsonRequestBehavior.AllowGet);
            }
        }


        //Action For changimg Admin Password*****

        [Authorize]
        public ActionResult ChangePassword()
        {
            return View();
        }



        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
             objResponse Response = new objResponse();
             UserManager objUserManager = new UserManager();
            try
            {

                Response = objUserManager.ChangePassword(model.OldPassword, model.NewPassword , model.UserName);
                if (Response.ErrorCode == 0)
                {
                    if (Response.ErrorMessage == "1")
                    {
                        TempData["SuccessMessage"] = "Your Password Change Succesfully";
                        return View();
                    }
                    else
                    {
                        TempData["ErrorMessage"] = "There is an error in changing password . Please try again";
                        return View();
                    }
                }
                else
                {
                    TempData["ErrorMessage"] = "There is an error in changing password . Please try again";
                    return View();
                }
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message.ToString();
                return View();
            }
        }

        [Authorize]
        public ActionResult AddServiceProvider()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult AddNewServiceProvider(UserModel model)
        {
            OK_User objUser = new OK_User();
            objResponse response = new objResponse();
            UserManager objUsermanager = new UserManager();
            try
            {
                objUser.User_FirstName = model.User_FirstName;
                objUser.User_LastName = model.User_LastName;
                objUser.User_Email = model.User_Email;
                objUser.User_Password = model.User_Password;
                objUser.User_Contact1 = model.User_Contact1;
                objUser.User_BuildingName = model.User_BuildingName;
                objUser.User_LandMark = model.User_LandMark;
                objUser.User_City = model.User_City;
                objUser.User_PinCode = model.User_PinCode;

                objUser.Service_Id = model.Service_Id;
                objUser.Service_Description = model.Service_Description;

                response = objUsermanager.AddNewServiceProvider(objUser);

                if (response.ErrorCode == 0)
                {
                    return RedirectToAction("ManageProvider", "Admin");
                }
                else
                {
                    ViewBag.Error_Msg = "There is an error in adding Provider Details . Please Try Again.";
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error_Msg = ex.Message.ToString();
                return View();
            }
        }

        [Authorize]
        public ActionResult UpdateServiceProvider(string user_id)
        {

            // Fetching Service List from Db


            ServicesManager manager = new ServicesManager();

            List<OK_Services> services = manager.GetServicesListForDropDown();

            List<SelectListItem> list = new List<SelectListItem>();

            list.Add(new SelectListItem { Value = "0", Text = "Choose a Service" });
            foreach (OK_Services sv in services)
            {
                list.Add(new SelectListItem { Value = sv.Service_ID_Auto_PK.ToString(), Text = sv.Service_Name });
            }


            objResponse response = new objResponse();
            UserManager objUserManager = new UserManager();
            UserModel objUsrModel = new UserModel();

            response = objUserManager.GetUserById(Convert.ToInt64(user_id));

            if (response.ErrorCode == 0)
            {
                if (response.ResponseData.Tables[0].Rows.Count > 0)
                {
                    objUsrModel.User_ID_Auto_PK = Convert.ToInt64(response.ResponseData.Tables[0].Rows[0]["User_ID_Auto_PK"]);
                    objUsrModel.User_FirstName = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_FirstName"]);
                    objUsrModel.User_LastName = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_LastName"]);
                    objUsrModel.User_Email = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_Email"]);
                    objUsrModel.User_Password = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_Password"]);
                    objUsrModel.User_Contact1 = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_Contact1"]);
                    objUsrModel.User_BuildingName = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_BuildingName"]);
                    objUsrModel.User_LandMark = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_LandMark"]);
                    objUsrModel.User_City = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_City"]);
                    objUsrModel.User_PinCode = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["User_PinCode"]);
                    objUsrModel.Service_Id = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["Service_Id"]);
                    objUsrModel.Service_Description = Convert.ToString(response.ResponseData.Tables[0].Rows[0]["Service_Descrition"]);
                }
            }

            ViewBag.service_List = list;
            return View(objUsrModel);
        }

        [Authorize]
        [HttpPost]
        public ActionResult UpdateServiceProvider(UserModel model)
        {
            OK_User objUser = new OK_User();
            objResponse response = new objResponse();
            UserManager objUsermanager = new UserManager();

            try
            {
                 // Fetching Service List from Db


                 ServicesManager manager = new ServicesManager();

                 List<OK_Services> services = manager.GetServicesListForDropDown();

                 List<SelectListItem> list = new List<SelectListItem>();

                 list.Add(new SelectListItem { Value = "0", Text = "Choose a Service" });
                 foreach (OK_Services sv in services)
                 {
                    list.Add(new SelectListItem { Value = sv.Service_ID_Auto_PK.ToString(), Text = sv.Service_Name });
                 }

                 //Updating Service Provider Detail

                 objUser.User_FirstName = model.User_FirstName;
                 objUser.User_LastName = model.User_LastName;
                 objUser.User_Email = model.User_Email;
                 objUser.User_Password = model.User_Password;
                 objUser.User_Contact1 = model.User_Contact1;
                 objUser.User_BuildingName = model.User_BuildingName;
                 objUser.User_LandMark = model.User_LandMark;
                 objUser.User_City = model.User_City;
                 objUser.User_PinCode = model.User_PinCode;

                 objUser.Service_Id = model.Service_Id;
                 objUser.Service_Description = model.Service_Description;

                 objUser.User_ID_Auto_PK = model.User_ID_Auto_PK;

                 response = objUsermanager.UpdateServiceProvider(objUser);

                 if (response.ErrorCode == 0)
                 {
                     return RedirectToAction("ManageProvider", "Admin");
                 }
                 else
                 {
                     ViewBag.Error_Msg = "There is an error in Updating Provider Details . Please Try Again.";
                     return View();
                 }
            }
            catch(Exception ex)
            {
                ViewBag.Error_Msg = ex.Message.ToString();
                return View();
            }
           
        }

    }
}