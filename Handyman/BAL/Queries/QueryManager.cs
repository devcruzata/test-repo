using DAL;
using Project.Entity;
using Project.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Queries
{
    public class QueryManager
    {
        List<ParamEntity> lstParameters;

        /// <summary>
        /// Save Web Queries
        /// </summary>
        /// <param name="objQueries"></param>
        public objResponse SaveQueries(OK_WebQueries objQueries)
        {
            QueryDetails objQueryDetail = new QueryDetails();
            objResponse Response = new objResponse();
            Response.ResponseMessage = new List<string>();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[14];

                sqlParameter[0] = new SqlParameter("@name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objQueries.Query_PersonName;

                sqlParameter[1] = new SqlParameter("@email", SqlDbType.NVarChar, 100);
                sqlParameter[1].Value = objQueries.Query_Email;

                sqlParameter[2] = new SqlParameter("@contact_no", SqlDbType.NVarChar, 20);
                sqlParameter[2].Value = objQueries.Query_ContactNumber;

                sqlParameter[3] = new SqlParameter("@Q_Address", SqlDbType.NVarChar, 200);
                sqlParameter[3].Value = objQueries.Query_Address;

                sqlParameter[4] = new SqlParameter("@Q_City", SqlDbType.NVarChar, 50);
                sqlParameter[4].Value = objQueries.Query_City;

                sqlParameter[5] = new SqlParameter("@Q_State", SqlDbType.NVarChar, 30);
                sqlParameter[5].Value = objQueries.Query_State;

                sqlParameter[6] = new SqlParameter("@Q_Service_Id", SqlDbType.Int);
                sqlParameter[6].Value = objQueries.Query_Service_Id;

                sqlParameter[7] = new SqlParameter("@Q_Comments", SqlDbType.NVarChar, 1000);
                sqlParameter[7].Value = objQueries.Query_Comments;

                sqlParameter[8] = new SqlParameter("@Q_Customer_Type", SqlDbType.NVarChar, 30);
                sqlParameter[8].Value = objQueries.Query_Customer_type;

                sqlParameter[9] = new SqlParameter("@Q_CreatedDate", SqlDbType.DateTime);
                sqlParameter[9].Value = objQueries.CreatedDate;

                sqlParameter[10] = new SqlParameter("@Q_UpdatedDate", SqlDbType.DateTime);
                sqlParameter[10].Value = objQueries.UpdatedDate;

                sqlParameter[11] = new SqlParameter("@Q_CreatedBy", SqlDbType.NVarChar, 50);
                sqlParameter[11].Value = objQueries.CreatedBy;

                sqlParameter[12] = new SqlParameter("@Q_UpdatedBy", SqlDbType.NVarChar, 50);
                sqlParameter[12].Value = objQueries.UpdatedBy;

                sqlParameter[13] = new SqlParameter("@Q_status", SqlDbType.NVarChar, 30);
                sqlParameter[13].Value = objQueries.Status;

              DATA_ACCESS.Fill(Response.ResponseData, "SetWebQueries", sqlParameter, Constants.Constants.ConnectionString);

                Response.ErrorCode = 0;
                Response.ErrorMessage = "Success";
            }

            catch (Exception ex)
            {

                Response.ErrorCode = 2001;
                Response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return Response;
        }

        public List<QueryDetails> GetQueryDetails()
        {
            List<QueryDetails> querylist = new List<QueryDetails>();
            objResponse response = new objResponse();
            try
            {
                // return DataHelper.ExecuteReaderStoredProcedure<QueryDetails>("sp_GetQueryDetails");
             DATA_ACCESS.Fill(response.ResponseData, "sp_GetQueryDetails", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    QueryDetails objQueryDetails = new QueryDetails();
                    objQueryDetails.Query_ID_Auto_PK = Convert.ToInt32(dr["Query_ID_Auto_PK"]);
                    objQueryDetails.Query_PersonName = Convert.ToString(dr["Query_PersonName"]);
                    objQueryDetails.Query_Email = Convert.ToString(dr["Query_Email"]);
                    objQueryDetails.Query_ContactNumber = Convert.ToString(dr["Query_ContactNumber"]);
                    objQueryDetails.Query_Address = Convert.ToString(dr["Query_Address"]);
                    objQueryDetails.Query_City = Convert.ToString(dr["Query_City"]);
                    objQueryDetails.Service_Name = Convert.ToString(dr["Service_Name"]);
                    objQueryDetails.Query_Comments = Convert.ToString(dr["Query_Comments"]);
                    objQueryDetails.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);
                    objQueryDetails.Status = Convert.ToString(dr["Status"]);
                    objQueryDetails.Query_Customer_type = Convert.ToString(dr["Query_Customer_type"]);
                    querylist.Add(objQueryDetails);

                }

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return querylist;
        }

        public List<OK_User> GetCustomerDetails()
        {
            List<OK_User> Customer_list = new List<OK_User>();
            objResponse response = new objResponse();
            try
            {
                // return DataHelper.ExecuteReaderStoredProcedure<QueryDetails>("sp_GetQueryDetails");
                DATA_ACCESS.Fill(response.ResponseData, "sp_GetCustomerDetails", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    OK_User objUser = new OK_User();
                    objUser.User_ID_Auto_PK = Convert.ToInt32(dr["User_ID_Auto_PK"]);
                    objUser.User_FirstName = Convert.ToString(dr["User_FirstName"]);
                    objUser.User_LastName = Convert.ToString(dr["User_LastName"]);
                    objUser.User_Email = Convert.ToString(dr["User_Email"]);
                    objUser.User_Contact1 = Convert.ToString(dr["User_Contact1"]);
                    objUser.User_BuildingFlatNumber = Convert.ToString(dr["User_BuildingFlatNumber"]);
                    objUser.User_BuildingName = Convert.ToString(dr["User_BuildingName"]);
                    objUser.User_Area = Convert.ToString(dr["User_Area"]);
                    objUser.User_City = Convert.ToString(dr["User_City"]);
                    objUser.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);
                    objUser.Status = Convert.ToString(dr["Status"]);
                    objUser.User_Type = Convert.ToString(dr["User_Type"]);
                    Customer_list.Add(objUser);

                }

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return Customer_list;
        }

        public List<OK_User> GetProviderDetails()
        {
            List<OK_User> Customer_list = new List<OK_User>();
            objResponse response = new objResponse();
            try
            {
                // return DataHelper.ExecuteReaderStoredProcedure<QueryDetails>("sp_GetQueryDetails");
                DATA_ACCESS.Fill(response.ResponseData, "sp_GetProviderDetails", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    OK_User objUser = new OK_User();
                    objUser.User_ID_Auto_PK = Convert.ToInt32(dr["User_ID_Auto_PK"]);
                    objUser.User_FirstName = Convert.ToString(dr["User_FirstName"]);
                    objUser.User_LastName = Convert.ToString(dr["User_LastName"]);
                    objUser.User_Email = Convert.ToString(dr["User_Email"]);
                    objUser.User_Contact1 = Convert.ToString(dr["User_Contact1"]);
                    objUser.User_BuildingFlatNumber = Convert.ToString(dr["User_BuildingFlatNumber"]);
                    objUser.User_BuildingName = Convert.ToString(dr["User_BuildingName"]);
                    objUser.User_Area = Convert.ToString(dr["User_Area"]);
                    objUser.User_City = Convert.ToString(dr["User_City"]);
                    objUser.CreatedDate = Convert.ToDateTime(dr["CreatedDate"]);
                    objUser.Status = Convert.ToString(dr["Status"]);
                    objUser.User_Type = Convert.ToString(dr["User_Type"]);
                    objUser.Service_Name = Convert.ToString(dr["Service"]);
                    Customer_list.Add(objUser);

                }

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return Customer_list;
        }





        /// <summary>
        /// Change Query Status
        /// </summary>
        /// <param name="query_id"></param>
        public string changeQueryStatus(string query_id)
        {
            try
            {
                lstParameters = new List<ParamEntity>();

                lstParameters.Add(new ParamEntity("@query_id", System.Data.DbType.String, query_id));

                DataSet ds = DataHelper.GetDataSet("usp_SetQueryStatus", lstParameters);
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                return Convert.ToString(dt.Rows[0][0]);

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
    }
}
