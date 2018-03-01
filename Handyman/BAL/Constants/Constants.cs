using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Constants
{
    public class Constants
    {

        //private static string connString = @"Data Source=(local);Initial Catalog=WELKIN_LOYALTY_DEV;user id=devuser;password=dev123*";
        private static string connString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        private static string _token = "WELKIN_LOYALTY";
        private static string _passPhrase = "WEL2015";



        public static string PassPhrase
        {
            get { return _passPhrase; }
            set { _passPhrase = value; }
        }
        public static string ConnectionString
        {

            get { return connString; }


        }
        public static string TOKEN
        {
            get { return _token; }
        }



    }
}
