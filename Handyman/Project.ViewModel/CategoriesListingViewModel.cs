using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.ViewModel
{
    public class CategoriesListingViewModel
    {
        public int Category_ID_Auto_PK { get; set; }
        public string Category_Code { get; set; }
        public string Category_Name { get; set; }
        public string Category_Description { get; set; }
        public string Category_IconUrl { get; set; }
        public string Category_ImageUrl { get; set; }
        public string Status { get; set; }

    }
}
