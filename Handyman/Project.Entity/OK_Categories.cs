using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.Entity
{
    public class OK_Categories
    {
        public int Category_ID_Auto_PK { get; set; }

        public string Category_Code { get; set; }

        public string Category_Name { get; set; }

        public string Category_Description { get; set; }

        public string Category_IconUrl { get; set; }

        public string Category_ImageUrl { get; set; }

        public int Category_Parent_ID_FK { get; set; }

        public bool Category_IsParent { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }

        public string Status { get; set; }
    }
}
