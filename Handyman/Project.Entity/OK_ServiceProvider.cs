using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.Entity
{
    public class OK_ServiceProvider
    {
        public int Provider_ID_Auto_PK { get; set; }

        public string Provider_FirstName { get; set; }

        public string Provider_LastName { get; set; }

        public string Provider_ContactNumber1 { get; set; }

        public string Provider_ContactNumber2 { get; set; }

        public string Provider_Type { get; set; }

        public int Provider_Parent_ID_FK { get; set; }

        public string Provider_CompanyName { get; set; }

        public string Provider_Address { get; set; }

        public string Provider_Location_LAT { get; set; }

        public string Provider_Location_LONG { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }

        public string Status { get; set; }
    }
}
