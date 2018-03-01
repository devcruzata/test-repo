using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Web.Models
{
    public class CategoryModel
    {
        public int ID_Auto_PK { get; set; }

        public string Code { get; set; }       

        public string Name { get; set; }

        public string Description { get; set; }

        public HttpPostedFileBase[] UploadedImages { get; set; }

        public string IconUrl { get; set; }

        public string ImageUrl { get; set; }

        public int Parent_ID_FK { get; set; }

        public bool IsParent { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string Status { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }
    }
}