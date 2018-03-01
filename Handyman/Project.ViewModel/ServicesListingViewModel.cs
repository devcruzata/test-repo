using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.ViewModel
{
    public class ServicesListingViewModel
    {
        public int Service_ID_Auto_PK { get; set; }
        public string Service_Code { get; set; }
        public string Service_Name { get; set; }
        public string Service_Description { get; set; }
        public string Service_IconUrl { get; set; }
        public string Service_ImageUrl { get; set; }
        public string Status { get; set; }
        public string Category_Code { get; set; }
        public string Category_Name { get; set; }
        public string Service_Type { get; set; }


    }
}
