using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.ViewModel
{
    public partial class UserDetail
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string City { get; set; }
        public bool IsActive { get; set; }
        public string DateOfBirth { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int? CountryId { get; set; }
        public string Country { get; set; }
        public string Password { get; set; }
        public string PostalCode { get; set; }
        public int? UserTypeId { get; set; }
        public string UserType { get; set; }
        public int? MembershipId { get; set; }
        public string Membership { get; set; }
        public int? PromoterId { get; set; }
        public int? CorporateId { get; set; }
        public int? HotelRuleId { get; set; }
        public int? CondoRuleId { get; set; }
        public string Role { get; set; }
        public string RouteName { get; set; }
        public int? CustomerId { get; set; }
        public string PromoCode { get; set; }
    }
}