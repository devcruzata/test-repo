using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Project.ViewModel;

namespace Project.Web.Models
{
    public class QueryModel
    {
        public long ID_Auto_PK { get; set; }

        public string PersonName { get; set; }

       
        public string Email { get; set; }

        public string ContactNumber { get; set; }

        public string Address { get; set; }

        public string City { get; set; }

        public string State { get; set; }

        public int Service_Id { get; set; }

        public string Comments { get; set; }

        public string Customer_type { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }

        public string Status { get; set; }

        public List<QueryDetails> Query_list { get; set; }
    }
}