using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.Entity
{
    public class OK_Services
    {
        public int Service_ID_Auto_PK { get; set; }

        public string Service_Code { get; set; }

        public int Service_Category_ID_FK { get; set; }

        public string Service_Name { get; set; }

        public string Service_Description { get; set; }

        public string Service_IconUrl { get; set; }

        public string Service_ImageUrl { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string Status { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }

        public string Service_Type { get; set; }

        public bool IsQuestionnare { get; set; }

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

        public int Basefare_ID_Auto_PK { get; set; }
    }
}
