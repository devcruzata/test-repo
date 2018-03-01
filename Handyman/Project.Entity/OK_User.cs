using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.Entity
{
    public class OK_User
    {
        public long User_ID_Auto_PK { get; set; }

        public string Username { get; set; }

        public string User_FirstName { get; set; }

        public string User_LastName { get; set; }

        public string User_Email { get; set; }

        public string User_Password { get; set; }

        public string User_Contact1 { get; set; }

        public string User_Contact2 { get; set; }

        public string User_BuildingFlatNumber { get; set; }

        public string User_BuildingName { get; set; }

        public string User_Area { get; set; }

        public string User_PinCode { get; set; }

        public string User_LandMark { get; set; }

        public string User_City { get; set; }

        public string User_State { get; set; }

        public string User_Counrty { get; set; }

        public string User_Type { get; set; }

        public string User_location_LAT { get; set; }

        public string User_location_LONG { get; set; }

        public string CreatedBy { get; set; }

        public string UpdatedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public string Status { get; set; }

        public string Service_Name { get; set; }

        public string Service_Id { get; set; }

        public string Service_Description { get; set; }
    }
}
