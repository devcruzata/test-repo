using DAL;
using Project.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.User
{
    public class UserManager
    {
        List<ParamEntity> lstParameters;

        /// <summary>
        /// Save New User Data
        /// </summary>
        /// <param name="objUser"></param>
        public DataTable AddNewUSer(Project.Entity.OK_User objUser)
        {
            Constants.Constants objConstants = new Constants.Constants();
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[19];

                sqlParameter[0] = new SqlParameter("@U_U_name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objUser.Username;

                sqlParameter[1] = new SqlParameter("@U_lname", SqlDbType.NVarChar, 100);
                sqlParameter[1].Value = objUser.User_LastName;

                sqlParameter[2] = new SqlParameter("@U_fname", SqlDbType.NVarChar, 100);
                sqlParameter[2].Value = objUser.User_FirstName;

                sqlParameter[3] = new SqlParameter("@U_email", SqlDbType.NVarChar, 100);
                sqlParameter[3].Value = objUser.User_Email;

                sqlParameter[4] = new SqlParameter("@U_password", SqlDbType.NVarChar, 20);
                sqlParameter[4].Value = objUser.User_Password;

                sqlParameter[5] = new SqlParameter("@U_contact1", SqlDbType.NVarChar, 20);
                sqlParameter[5].Value = objUser.User_Contact1;

                sqlParameter[6] = new SqlParameter("@U_B_number", SqlDbType.NVarChar, 10);
                sqlParameter[6].Value = objUser.User_BuildingFlatNumber;

                sqlParameter[7] = new SqlParameter("@U_B_name", SqlDbType.NVarChar, 100);
                sqlParameter[7].Value = objUser.User_BuildingName;

                sqlParameter[8] = new SqlParameter("@U_pincode", SqlDbType.NVarChar, 10);
                sqlParameter[8].Value = objUser.User_PinCode;

                sqlParameter[9] = new SqlParameter("@U_landmark", SqlDbType.NVarChar, 100);
                sqlParameter[9].Value = objUser.User_LandMark;

                sqlParameter[10] = new SqlParameter("@U_city", SqlDbType.NVarChar, 100);
                sqlParameter[10].Value = objUser.User_City;

                sqlParameter[11] = new SqlParameter("@U_type", SqlDbType.NVarChar, 10);
                sqlParameter[11].Value = objUser.User_Type;

                sqlParameter[12] = new SqlParameter("@U_loc_lat", SqlDbType.NVarChar, 20);
                sqlParameter[12].Value = objUser.User_location_LAT;

                sqlParameter[13] = new SqlParameter("@U_loc_long", SqlDbType.NVarChar, 20);
                sqlParameter[13].Value = objUser.User_location_LONG;

                sqlParameter[14] = new SqlParameter("@U_createdby", SqlDbType.NVarChar, 50);
                sqlParameter[14].Value = objUser.CreatedBy;

                sqlParameter[15] = new SqlParameter("@U_updatedby", SqlDbType.NVarChar, 50);
                sqlParameter[15].Value = objUser.UpdatedBy;

                sqlParameter[16] = new SqlParameter("@U_createddate", SqlDbType.DateTime, 100);
                sqlParameter[16].Value = objUser.CreatedDate;

                sqlParameter[17] = new SqlParameter("@U_updateddate", SqlDbType.DateTime, 100);
                sqlParameter[17].Value = objUser.UpdatedDate;

                sqlParameter[18] = new SqlParameter("@U_status", SqlDbType.NVarChar, 20);
                sqlParameter[18].Value = objUser.Status;

                //"data source=.\\CRUZATA01;Initial Catalog=Online_Karigar_DB;Integrated Security=true;"
                DATA_ACCESS.Fill(response.ResponseData, "usp_AddNewUser", sqlParameter, Constants.Constants.ConnectionString);
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

        public void getUSer(string uname, string role)
        {
            OK_User objUser = new OK_User();
            try
            {
                lstParameters = new List<ParamEntity>();

                lstParameters.Add(new ParamEntity("@U_U_name", System.Data.DbType.String, uname));
                lstParameters.Add(new ParamEntity("@U_type", System.Data.DbType.String, role));


                DataSet ds = DataHelper.GetDataSet("usp_GetUserDetails", lstParameters);
                DataTable dt = new DataTable();
                dt = ds.Tables[0];

                objUser.User_FirstName = Convert.ToString(dt.Rows[0]["User_FirstName"]);
                objUser.User_LastName = Convert.ToString(dt.Rows[0]["User_LastName"]);
                objUser.User_Email = Convert.ToString(dt.Rows[0]["User_Email"]);

                objUser.User_Contact1 = Convert.ToString(dt.Rows[0]["User_Contact1"]);

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                if (lstParameters != null)
                    GC.SuppressFinalize(lstParameters);
            }
        }


        /// <summary>
        /// Change Password
        /// </summary>
        /// <param name="objUser"></param>
        public objResponse ChangePassword(string old_Pass, string new_pass, string uname)
        {
            Constants.Constants objConstants = new Constants.Constants();
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[3];

                sqlParameter[0] = new SqlParameter("@uname", SqlDbType.NVarChar, 50);
                sqlParameter[0].Value = uname;

                sqlParameter[1] = new SqlParameter("@o_pass", SqlDbType.NVarChar, 20);
                sqlParameter[1].Value = old_Pass;

                sqlParameter[2] = new SqlParameter("@n_pass", SqlDbType.NVarChar, 20);
                sqlParameter[2].Value = new_pass;


                //"data source=.\\CRUZATA01;Initial Catalog=Online_Karigar_DB;Integrated Security=true;"
               DATA_ACCESS.Fill(response.ResponseData, "usp_ChangePassword", sqlParameter, Constants.Constants.ConnectionString);

                dt = response.ResponseData.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    response.ErrorCode = 0;
                    response.ErrorMessage = dt.Rows[0][0].ToString(); ;
                }

            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return response;
        }

        /// <summary>
        /// Save New User Data
        /// </summary>
        /// <param name="objUser"></param>
        public objResponse AddNewServiceProvider(Project.Entity.OK_User objUser)
        {
            Constants.Constants objConstants = new Constants.Constants();
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[18];

                sqlParameter[0] = new SqlParameter("@U_U_name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objUser.User_Email;

                sqlParameter[1] = new SqlParameter("@U_lname", SqlDbType.NVarChar, 100);
                sqlParameter[1].Value = objUser.User_LastName;

                sqlParameter[2] = new SqlParameter("@U_fname", SqlDbType.NVarChar, 100);
                sqlParameter[2].Value = objUser.User_FirstName;

                sqlParameter[3] = new SqlParameter("@U_email", SqlDbType.NVarChar, 100);
                sqlParameter[3].Value = objUser.User_Email;

                sqlParameter[4] = new SqlParameter("@U_password", SqlDbType.NVarChar, 20);
                sqlParameter[4].Value = objUser.User_Password;

                sqlParameter[5] = new SqlParameter("@U_contact1", SqlDbType.NVarChar, 20);
                sqlParameter[5].Value = objUser.User_Contact1;

                sqlParameter[6] = new SqlParameter("@U_B_name", SqlDbType.NVarChar, 100);
                sqlParameter[6].Value = objUser.User_BuildingName;

                sqlParameter[7] = new SqlParameter("@U_pincode", SqlDbType.NVarChar, 10);
                sqlParameter[7].Value = objUser.User_PinCode;

                sqlParameter[8] = new SqlParameter("@U_landmark", SqlDbType.NVarChar, 100);
                sqlParameter[8].Value = objUser.User_LandMark;

                sqlParameter[9] = new SqlParameter("@U_city", SqlDbType.NVarChar, 100);
                sqlParameter[9].Value = objUser.User_City;

                sqlParameter[10] = new SqlParameter("@U_createdby", SqlDbType.NVarChar, 50);
                sqlParameter[10].Value = "Admin";

                sqlParameter[11] = new SqlParameter("@U_updatedby", SqlDbType.NVarChar, 50);
                sqlParameter[11].Value = "Admin";

                sqlParameter[12] = new SqlParameter("@U_createddate", SqlDbType.DateTime, 100);
                sqlParameter[12].Value = DateTime.Now;

                sqlParameter[13] = new SqlParameter("@U_updateddate", SqlDbType.DateTime, 100);
                sqlParameter[13].Value = DateTime.Now;

                sqlParameter[14] = new SqlParameter("@U_status", SqlDbType.NVarChar, 20);
                sqlParameter[14].Value = "active";

                sqlParameter[15] = new SqlParameter("@U_Service_Id", SqlDbType.NVarChar, 50);
                sqlParameter[15].Value = objUser.Service_Id;

                sqlParameter[16] = new SqlParameter("@U_Service_Description", SqlDbType.NVarChar, 1000);
                sqlParameter[16].Value = objUser.Service_Description;

                sqlParameter[17] = new SqlParameter("@U_u_type", SqlDbType.NVarChar, 10);
                sqlParameter[17].Value = "PROVIDER";

                //"data source=.\\CRUZATA01;Initial Catalog=Online_Karigar_DB;Integrated Security=true;"
               DATA_ACCESS.Fill(response.ResponseData, "usp_AddNewServiceProvider", sqlParameter, Constants.Constants.ConnectionString);
                dt = response.ResponseData.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    response.ErrorCode = 0;
                    response.ErrorMessage = "Success";
                }

            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return response;
        }

        public objResponse GetUserById(Int64 userid)
        {
            DataTable dt = new DataTable();
            objResponse response = new objResponse();
            OK_User objUser = new OK_User();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[1];

                sqlParameter[0] = new SqlParameter("@U_U_id_pk", SqlDbType.BigInt, 10);
                sqlParameter[0].Value = userid;

               DATA_ACCESS.Fill(response.ResponseData, "GetUserForUpdate", sqlParameter, Constants.Constants.ConnectionString);
                dt = response.ResponseData.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    response.ErrorCode = 0;
                    response.ErrorMessage = "Success";
                }
            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return response;
        }


        /// <summary>
        /// Update User Data
        /// </summary>
        /// <param name="objUser"></param>
        public objResponse UpdateServiceProvider(Project.Entity.OK_User objUser)
        {
            Constants.Constants objConstants = new Constants.Constants();
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[19];

                sqlParameter[0] = new SqlParameter("@U_U_name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objUser.User_Email;

                sqlParameter[1] = new SqlParameter("@U_lname", SqlDbType.NVarChar, 100);
                sqlParameter[1].Value = objUser.User_LastName;

                sqlParameter[2] = new SqlParameter("@U_fname", SqlDbType.NVarChar, 100);
                sqlParameter[2].Value = objUser.User_FirstName;

                sqlParameter[3] = new SqlParameter("@U_email", SqlDbType.NVarChar, 100);
                sqlParameter[3].Value = objUser.User_Email;

                sqlParameter[4] = new SqlParameter("@U_password", SqlDbType.NVarChar, 20);
                sqlParameter[4].Value = objUser.User_Password;

                sqlParameter[5] = new SqlParameter("@U_contact1", SqlDbType.NVarChar, 20);
                sqlParameter[5].Value = objUser.User_Contact1;

                sqlParameter[6] = new SqlParameter("@U_B_name", SqlDbType.NVarChar, 100);
                sqlParameter[6].Value = objUser.User_BuildingName;

                sqlParameter[7] = new SqlParameter("@U_pincode", SqlDbType.NVarChar, 10);
                sqlParameter[7].Value = objUser.User_PinCode;

                sqlParameter[8] = new SqlParameter("@U_landmark", SqlDbType.NVarChar, 100);
                sqlParameter[8].Value = objUser.User_LandMark;

                sqlParameter[9] = new SqlParameter("@U_city", SqlDbType.NVarChar, 100);
                sqlParameter[9].Value = objUser.User_City;

                sqlParameter[10] = new SqlParameter("@U_createdby", SqlDbType.NVarChar, 50);
                sqlParameter[10].Value = "Admin";

                sqlParameter[11] = new SqlParameter("@U_updatedby", SqlDbType.NVarChar, 50);
                sqlParameter[11].Value = "Admin";

                sqlParameter[12] = new SqlParameter("@U_createddate", SqlDbType.DateTime, 100);
                sqlParameter[12].Value = DateTime.Now;

                sqlParameter[13] = new SqlParameter("@U_updateddate", SqlDbType.DateTime, 100);
                sqlParameter[13].Value = DateTime.Now;

                sqlParameter[14] = new SqlParameter("@U_status", SqlDbType.NVarChar, 20);
                sqlParameter[14].Value = "active";

                sqlParameter[15] = new SqlParameter("@U_Service_Id", SqlDbType.NVarChar, 50);
                sqlParameter[15].Value = objUser.Service_Id;

                sqlParameter[16] = new SqlParameter("@U_Service_Description", SqlDbType.NVarChar, 1000);
                sqlParameter[16].Value = objUser.Service_Description;

                sqlParameter[17] = new SqlParameter("@U_u_type", SqlDbType.NVarChar, 10);
                sqlParameter[17].Value = "PROVIDER";

                sqlParameter[18] = new SqlParameter("@U_u_id", SqlDbType.BigInt, 10);
                sqlParameter[18].Value = objUser.User_ID_Auto_PK;

                DATA_ACCESS.Fill(response.ResponseData, "usp_UpdateServiceProvider", sqlParameter, Constants.Constants.ConnectionString);
                dt = response.ResponseData.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    response.ErrorCode = 0;
                    response.ErrorMessage = "Success";
                }

            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return response;
        }

    }
}
