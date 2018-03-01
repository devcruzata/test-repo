using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.ViewModel
{
    public class ServiceOrderViewModel
    {
        public int ServiceOrder_ID_Auto_PK { get; set; }

        public int ServiceOrder_Service_ID_FK { get; set; }

        public int ServiceOrder_QuestionnareID { get; set; }

        public DateTime ServiceOrder_Scheduled_Date_Time { get; set; }

        public bool ServiceOrder_IsUser { get; set; }

        public Int64 ServiceOrder_User_ID_FK { get; set; }

        public string ServiceOrder_ContactPerson { get; set; }

        public string ServiceOrder_ContactMobile { get; set; }

        public string ServiceOrder_Address1 { get; set; }

        public string ServiceOrder_Address2 { get; set; }

        public string ServiceOrder_LandMark { get; set; }

        public string ServiceOrder_PinCode { get; set; }

        public string ServiceOrder_LocationLat { get; set; }

        public string ServiceOrder_LocationLong { get; set; }

        public string ServiceOrder_PaymentMode { get; set; }

        public double ServiceOrder_PaymentAmount { get; set; }

        public bool Service_IsPaid { get; set; }

        public int Service_Provider_ID_FK { set; get; }

        public int ServiceOrder_Stage { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string Status { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }

        public string username { get; set; }


    }
}
