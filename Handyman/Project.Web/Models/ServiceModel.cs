using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Web.Models
{
    public class ServiceModel
    {
        public int ID_Auto_PK { get; set; }

        public string Code { get; set; }

        public int Category_ID_FK { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public HttpPostedFileBase[] UploadedImages { get; set; }

        public string IconUrl { get; set; }

        public string ImageUrl { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string Status { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }

        public string imgFlag { get; set; }

        public bool IsQuestionnare { get; set; }

        public string QuestionnareReport { get; set; }

        public string Question { get; set; }

        public string AnswerType { get; set; }

        public string Answer1 { get; set; }

        public string Answer2 { get; set; }

        public string Answer3 { get; set; }

        public string Answer4 { get; set; }

        public string Answer5 { get; set; }

        public string Answer6 { get; set; }

        public string Answer7 { get; set; }

        public string Answer8 { get; set; }

        public string Answer9 { get; set; }

        public string Answer10 { get; set; }

        public string Basefare_ID_Auto_PK { get; set; }
    }
}