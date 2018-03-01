using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.ViewModel
{
    public class ServiceOrderListingViewModel
    {
        public Int32 ServiceOrder_ID_Auto_PK { get; set; }

        public Int32 ServiceOrder_Service_ID_FK { get; set; }

        public string Service_Name { get; set; }

        public Int32 ServiceOrder_QuestionnareID { get; set; }

        public DateTime ServiceOrder_Scheduled_Date_Time { get; set; }

        public bool ServiceOrder_IsUser { get; set; }

        public Int32 ServiceOrder_User_ID_FK { get; set; }

        public string ServiceOrder_ContantPerson { get; set; }

        public string ServiceOrder_ContactMobile { get; set; }

        public string ServiceOrder_Address1 { get; set; }

        public string ServiceOrder_Address2 { get; set; }

        public string ServiceOrder_LandMark { get; set; }

        public string ServiceOrder_PinCode { get; set; }

        public string ServiceOrder_LocationLat { get; set; }

        public string ServiceOrder_LocationLong { get; set; }

        public string ServiceOrder_PaymentMode { get; set; }

        public string ServiceOrder_PaymentAmount { get; set; }

        public string ServiceOrder_PaymentReference { get; set; }

        public bool Service_IsPaid { get; set; }

        public Int32 Service_Provider_ID_FK { get; set; }

        public string ServiceOrder_Stage { get; set; }

        public string ServiceOrder_TimeSlot { get; set; }

        public string CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string Status { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }

        public List<ServiceOrderListingViewModel> service_Order { get; set; }

        public List<Question> question { get; set; }

        public ServiceOrderListingViewModel()
        {
            question = new List<Question>();
        }

    }

    public class Question
    {
        public string Questions { get; set; }
        public List<Answer> answers { get; set; }

        public Question()
        {
            answers = new List<Answer>();
        }
    }

    public class Answer
    {
        public string Answers { get; set; }
    }
}
