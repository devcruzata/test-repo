using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.ViewModel
{
    public class QueryDetails
    {
        public long Query_ID_Auto_PK { get; set; }

        public string Query_PersonName { get; set; }

        public string Query_Email { get; set; }

        public string Query_ContactNumber { get; set; }

        public string Query_Address { get; set; }

        public string Query_City { get; set; }

        public string Query_State { get; set; }

        public string Service_Name { get; set; }

        // public int Query_Service_Id { get; set; }

        public string Query_Comments { get; set; }

        public string Query_Customer_type { get; set; }

        public DateTime CreatedDate { get; set; }

        public string Status { get; set; }
    }
}
