using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.Web.Models
{
    public class BaseFareModel
    {
        public int BaseFare_ID_Auto_PK { get; set; }

        public string BaseFare_Desc { get; set; }

        public Decimal Base_Fare { get; set; }

        public int Base_FareType { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string Status { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }
    }
}