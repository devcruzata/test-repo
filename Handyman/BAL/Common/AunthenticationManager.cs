using DAL;
using Project.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Common
{
    public class AunthenticationManager
    {
        /// <summary>
        /// Authenticating User
        /// </summary>
        /// <param name="objOkUser"></param>
        public DataTable Authenticate(OK_User objOkUser)
        {
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[2];

                sqlParameter[0] = new SqlParameter("@user_id", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objOkUser.Username;

                sqlParameter[1] = new SqlParameter("@user_password", SqlDbType.NVarChar, 100);
                sqlParameter[1].Value = objOkUser.User_Password;

                DATA_ACCESS.Fill(response.ResponseData, "usp_AuthenticateUser", sqlParameter, Constants.Constants.ConnectionString);

                dt = response.ResponseData.Tables[0];
                response.ErrorCode = 0;
                response.ErrorMessage = "Success";

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return dt;
        }
    }
}
