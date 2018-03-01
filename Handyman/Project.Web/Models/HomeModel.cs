using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project.ViewModel;

namespace Project.Web.Models
{
    public class HomeModel
    {
        public List<ServicesListingViewModel> ServicesList;
        public List<CategoriesListingViewModel> CategoriesList;
    }
}