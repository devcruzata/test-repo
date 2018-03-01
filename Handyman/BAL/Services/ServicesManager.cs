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

namespace BAL.Services
{
    public class ServicesManager
    {
        List<ParamEntity> lstParameters = null;

        public List<ServicesListingViewModel> GetServiceListings()
        {
            List<ServicesListingViewModel> serviceList = new List<ServicesListingViewModel>();

            objResponse response = new objResponse();
            try
            {


                DATA_ACCESS.Fill(response.ResponseData, "GetServicesListings", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    ServicesListingViewModel objServiceListing = new ServicesListingViewModel();
                    objServiceListing.Service_ID_Auto_PK = Convert.ToInt32(dr["Service_ID_Auto_PK"]);
                    objServiceListing.Service_Name = Convert.ToString(dr["Service_Name"]);
                    objServiceListing.Service_Description = Convert.ToString(dr["Service_Description"]);
                    objServiceListing.Service_IconUrl = Convert.ToString(dr["Service_IconUrl"]);
                    objServiceListing.Service_ImageUrl = Convert.ToString(dr["Service_ImageUrl"]);
                    objServiceListing.Status = Convert.ToString(dr["Status"]);
                    objServiceListing.Category_Name = Convert.ToString(dr["Category_Name"]);
                    objServiceListing.Service_Code = Convert.ToString(dr["Service_Code"]);
                    objServiceListing.Service_Type = Convert.ToString(dr["Service_Type"]);
                    objServiceListing.Category_Code = Convert.ToString(dr["Category_Code"]);
                    serviceList.Add(objServiceListing);

                }

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return serviceList;
        }

        public List<ServicesListingViewModel> GetServiceListingOnSearch(string searchText)
        {
            lstParameters = new List<ParamEntity>();

            lstParameters.Add(new ParamEntity("@search_text", System.Data.DbType.String, searchText));
            try
            {
                return DataHelper.ExecuteReaderStoredProcedure<ServicesListingViewModel>("usp_GetServicesListingsOnSearch", lstParameters);
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

        public List<ServicesListingViewModel> GetServiceListingsHot()
        {
            List<ServicesListingViewModel> serviceList = new List<ServicesListingViewModel>();

            objResponse response = new objResponse();
            try
            {

                DATA_ACCESS.Fill(response.ResponseData, "GetServicesListingsTopSix", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    ServicesListingViewModel objServiceListing = new ServicesListingViewModel();
                    objServiceListing.Service_ID_Auto_PK = Convert.ToInt32(dr["Service_ID_Auto_PK"]);
                    objServiceListing.Service_Name = Convert.ToString(dr["Service_Name"]);
                    objServiceListing.Service_Description = Convert.ToString(dr["Service_Description"]);
                    objServiceListing.Service_IconUrl = Convert.ToString(dr["Service_IconUrl"]);
                    objServiceListing.Service_ImageUrl = Convert.ToString(dr["Service_ImageUrl"]);
                    objServiceListing.Status = Convert.ToString(dr["Status"]);
                    objServiceListing.Category_Name = Convert.ToString(dr["Category_Name"]);
                    objServiceListing.Service_Code = Convert.ToString(dr["Service_Code"]);
                    serviceList.Add(objServiceListing);

                }

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return serviceList;
        }


        public List<OK_Services> GetServicesListForDropDown()
        {

            List<OK_Services> serviceList = new List<OK_Services>();

            objResponse response = new objResponse();
            try
            {


               DATA_ACCESS.Fill(response.ResponseData, "GetServicesListForDropDown", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    OK_Services objOkServices = new OK_Services();
                    objOkServices.Service_ID_Auto_PK = Convert.ToInt32(dr["Service_ID_Auto_PK"]);
                    objOkServices.Service_Name = Convert.ToString(dr["Service_Name"]);
                    objOkServices.Service_Code = Convert.ToString(dr["Service_Code"]);
                    serviceList.Add(objOkServices);

                }

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return serviceList;
        }

        public DataTable AddServices(OK_Services objService)
        {
            objResponse Response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[11];

                sqlParameter[0] = new SqlParameter("@S_name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objService.Service_Name;

                sqlParameter[1] = new SqlParameter("@S_description", SqlDbType.NVarChar, 200);
                sqlParameter[1].Value = objService.Service_Description;

                sqlParameter[2] = new SqlParameter("@S_cat_id_fk", SqlDbType.Int, 10);
                sqlParameter[2].Value = objService.Service_Category_ID_FK;


                sqlParameter[3] = new SqlParameter("@S_CreatedDate", SqlDbType.DateTime, 100);
                sqlParameter[3].Value = objService.CreatedDate;

                sqlParameter[4] = new SqlParameter("@S_UpdatedDate", SqlDbType.DateTime, 100);
                sqlParameter[4].Value = objService.UpdatedDate;

                sqlParameter[5] = new SqlParameter("@S_CreatedBy", SqlDbType.NVarChar, 50);
                sqlParameter[5].Value = objService.CreatedBy;

                sqlParameter[6] = new SqlParameter("@S_UpdatedBy", SqlDbType.NVarChar, 50);
                sqlParameter[6].Value = objService.UpdatedBy;

                sqlParameter[7] = new SqlParameter("@S_status", SqlDbType.NVarChar, 20);
                sqlParameter[7].Value = objService.Status;

                sqlParameter[8] = new SqlParameter("@S_service_type", SqlDbType.NVarChar, 20);
                sqlParameter[8].Value = objService.Service_Type;

                sqlParameter[9] = new SqlParameter("@S_isQuestionnare", SqlDbType.Bit, 1);
                sqlParameter[9].Value = objService.IsQuestionnare;

                sqlParameter[10] = new SqlParameter("@S_baseFare", SqlDbType.Int, 10);
                sqlParameter[10].Value = objService.Basefare_ID_Auto_PK;


              DATA_ACCESS.Fill(Response.ResponseData, "usp_SetServices", sqlParameter, Constants.Constants.ConnectionString);
                dt = Response.ResponseData.Tables[0];
                Response.ErrorCode = 0;
                Response.ErrorMessage = "Success";


            }
            catch (Exception ex)
            {

                Response.ErrorCode = 2001;
                Response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return dt;
        }

        public DataTable addQuestionnare(int Service_Auto_ID_Pk, string Question, string AnswerType)
        {
            DataTable dt = new DataTable();
            objResponse Response = new objResponse();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[7];

                sqlParameter[0] = new SqlParameter("@S_id_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = Service_Auto_ID_Pk;

                sqlParameter[1] = new SqlParameter("@Question_Desc", SqlDbType.NVarChar, 500);
                sqlParameter[1].Value = Question;

                sqlParameter[2] = new SqlParameter("@Answr_Type", SqlDbType.NVarChar, 5);
                sqlParameter[2].Value = AnswerType;

                sqlParameter[3] = new SqlParameter("@created_date", SqlDbType.DateTime, 20);
                sqlParameter[3].Value = DateTime.Now;

                sqlParameter[4] = new SqlParameter("@updated_date", SqlDbType.DateTime, 20);
                sqlParameter[4].Value = DateTime.Now;

                sqlParameter[5] = new SqlParameter("@created_By", SqlDbType.NVarChar, 10);
                sqlParameter[5].Value = "Admin";

                sqlParameter[6] = new SqlParameter("@Status", SqlDbType.NVarChar, 20);
                sqlParameter[6].Value = "Active";

               DATA_ACCESS.Fill(Response.ResponseData, "usp_AddQustinnare", sqlParameter, Constants.Constants.ConnectionString);
                dt = Response.ResponseData.Tables[0];
                Response.ErrorCode = 0;
                Response.ErrorMessage = "Success";
            }
            catch (Exception ex)
            {
                Response.ErrorCode = 2001;
                Response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return dt;
        }

        public DataTable addAnswerSet(int Service_Auto_ID_Pk, int questionnare_id, string answers)
        {
            DataTable dt = new DataTable();
            objResponse Response = new objResponse();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[7];

                sqlParameter[0] = new SqlParameter("@S_id_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = Service_Auto_ID_Pk;

                sqlParameter[1] = new SqlParameter("@Questionnare_id", SqlDbType.Int, 10);
                sqlParameter[1].Value = questionnare_id;

                sqlParameter[2] = new SqlParameter("@Answr_Desc", SqlDbType.NVarChar, 500);
                sqlParameter[2].Value = answers;

                sqlParameter[3] = new SqlParameter("@created_date", SqlDbType.DateTime, 20);
                sqlParameter[3].Value = DateTime.Now;

                sqlParameter[4] = new SqlParameter("@updated_date", SqlDbType.DateTime, 20);
                sqlParameter[4].Value = DateTime.Now;

                sqlParameter[5] = new SqlParameter("@created_By", SqlDbType.NVarChar, 10);
                sqlParameter[5].Value = "Admin";

                sqlParameter[6] = new SqlParameter("@Status", SqlDbType.NVarChar, 20);
                sqlParameter[6].Value = "Active";

                DATA_ACCESS.Fill(Response.ResponseData, "usp_AddAnswerSet", sqlParameter, Constants.Constants.ConnectionString);
                dt = Response.ResponseData.Tables[0];
                Response.ErrorCode = 0;
                Response.ErrorMessage = "Success";
            }
            catch (Exception ex)
            {
                Response.ErrorCode = 2001;
                Response.ErrorMessage = "Error while processing: " + ex.Message;
            }

            return dt;
        }

        public DataTable AddServiceImage(string fname, int id_auto_pk)
        {
            objResponse Response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[3];

                sqlParameter[0] = new SqlParameter("@S_imageurl", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = fname;

                sqlParameter[1] = new SqlParameter("@S_iconurl", SqlDbType.NVarChar, 200);
                sqlParameter[1].Value = fname;

                sqlParameter[2] = new SqlParameter("@S_id_auto_pk", SqlDbType.Int, 20);
                sqlParameter[2].Value = id_auto_pk;


               DATA_ACCESS.Fill(Response.ResponseData, "usp_SetServiceImage", sqlParameter, Constants.Constants.ConnectionString);
                dt = Response.ResponseData.Tables[0];
                Response.ErrorCode = 0;
                Response.ErrorMessage = "Success";


            }
            catch (Exception ex)
            {

                Response.ErrorCode = 2001;
                Response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return dt;
        }


        public DataTable GetServiceForUpdate(int id_auto_pk)
        {
            objResponse Response = new objResponse();
            DataTable dt = new DataTable();
            try
            {


                SqlParameter[] sqlParameter = new SqlParameter[1];

                sqlParameter[0] = new SqlParameter("@S_id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = id_auto_pk;



               DATA_ACCESS.Fill(Response.ResponseData, "usp_GetService", sqlParameter, Constants.Constants.ConnectionString);
                dt = Response.ResponseData.Tables[0];
                Response.ErrorCode = 0;
                Response.ErrorMessage = "Success";
            }
            catch (Exception ex)
            {

                Response.ErrorCode = 2001;
                Response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return dt;
        }

        public DataTable UpdateServices(OK_Services objService)
        {
            objResponse Response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[7];

                sqlParameter[0] = new SqlParameter("@S_name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objService.Service_Name;

                sqlParameter[1] = new SqlParameter("@S_description", SqlDbType.NVarChar, 200);
                sqlParameter[1].Value = objService.Service_Description;

                sqlParameter[2] = new SqlParameter("@S_cat_id_fk", SqlDbType.Int, 10);
                sqlParameter[2].Value = objService.Service_Category_ID_FK;

                sqlParameter[3] = new SqlParameter("@S_UpdatedDate", SqlDbType.DateTime, 100);
                sqlParameter[3].Value = objService.UpdatedDate;

                sqlParameter[4] = new SqlParameter("@S_UpdatedBy", SqlDbType.NVarChar, 50);
                sqlParameter[4].Value = objService.UpdatedBy;

                sqlParameter[5] = new SqlParameter("@S_id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[5].Value = objService.Service_ID_Auto_PK;

                sqlParameter[6] = new SqlParameter("@S_baseFare", SqlDbType.Int, 10);
                sqlParameter[6].Value = objService.Basefare_ID_Auto_PK;


                DATA_ACCESS.Fill(Response.ResponseData, "usp_UpdateServices", sqlParameter, Constants.Constants.ConnectionString);
                dt = Response.ResponseData.Tables[0];
                Response.ErrorCode = 0;
                Response.ErrorMessage = "Success";


            }
            catch (Exception ex)
            {

                Response.ErrorCode = 2001;
                Response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return dt;
        }


        public objResponse GetServiceListForWebService(string username)
        {
            List<ServicesListingViewModel> serviceList = new List<ServicesListingViewModel>();

            objResponse response = new objResponse();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[1];

                sqlParameter[0] = new SqlParameter("@U_name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = username;

               DATA_ACCESS.Fill(response.ResponseData, "usp_GetServicesListForWebService", sqlParameter, Constants.Constants.ConnectionString);


                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];
                if (Convert.ToString(dt.Rows[0][0]) == "Username is not valid")
                {
                    response.ErrorCode = 2001;
                    response.ErrorMessage = "username is not valid";
                }
                else
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

        public objResponse sheduleService(ServiceOrderViewModel serviceOrder)
        {
            objResponse response = new objResponse();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[10];

                sqlParameter[0] = new SqlParameter("@SO_s_id", SqlDbType.Int, 10);
                sqlParameter[0].Value = serviceOrder.ServiceOrder_Service_ID_FK;

                sqlParameter[1] = new SqlParameter("@SO_q_id", SqlDbType.Int, 10);
                sqlParameter[1].Value = serviceOrder.ServiceOrder_QuestionnareID;

                sqlParameter[2] = new SqlParameter("@SO_shedule_date", SqlDbType.DateTime, 100);
                sqlParameter[2].Value = serviceOrder.ServiceOrder_Scheduled_Date_Time;

                sqlParameter[3] = new SqlParameter("@SO_status", SqlDbType.NVarChar, 20);
                sqlParameter[3].Value = serviceOrder.Status;

                sqlParameter[4] = new SqlParameter("@SO_createddate", SqlDbType.DateTime, 100);
                sqlParameter[4].Value = serviceOrder.CreatedDate;

                sqlParameter[5] = new SqlParameter("@SO_createdby", SqlDbType.NVarChar, 100);
                sqlParameter[5].Value = serviceOrder.CreatedBy;

                sqlParameter[6] = new SqlParameter("@SO_updatedby", SqlDbType.NVarChar, 100);
                sqlParameter[6].Value = serviceOrder.UpdatedBy;

                sqlParameter[7] = new SqlParameter("@SO_updateddate", SqlDbType.DateTime, 100);
                sqlParameter[7].Value = serviceOrder.UpdatedDate;

                sqlParameter[8] = new SqlParameter("@SO_stage", SqlDbType.Int, 1);
                sqlParameter[8].Value = serviceOrder.ServiceOrder_Stage;

                sqlParameter[9] = new SqlParameter("@username", SqlDbType.NVarChar, 100);
                sqlParameter[9].Value = serviceOrder.username;

               DATA_ACCESS.Fill(response.ResponseData, "usp_SheduleService", sqlParameter, Constants.Constants.ConnectionString);
            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return response;
        }


        public List<OK_BaseFare> GetBaseFareForDropDown()
        {
            List<OK_BaseFare> categoryList = new List<OK_BaseFare>();

            objResponse response = new objResponse();
            try
            {

                DATA_ACCESS.Fill(response.ResponseData, "usp_GetBaseFareForDropDown", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    OK_BaseFare objBaseFare = new OK_BaseFare();
                    objBaseFare.BaseFare_ID_Auto_PK = Convert.ToInt32(dr["BaseFare_ID_Auto_PK"]);
                    objBaseFare.BaseFare_Desc = Convert.ToString(dr["BaseFare_Desc"]);
                    objBaseFare.Base_Fare = Convert.ToDecimal(dr["Base_Fare"]);
                    categoryList.Add(objBaseFare);
                }
            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return categoryList;
        }

        public objResponse getQuestionnare(int Service_Id_Pk)
        {
            objResponse response = new objResponse();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[1];

                sqlParameter[0] = new SqlParameter("@S_id", SqlDbType.Int, 10);
                sqlParameter[0].Value = Service_Id_Pk;

               DATA_ACCESS.Fill(response.ResponseData, "usp_GetQuestionnare", sqlParameter, Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return response;
        }

        public objResponse getQuestionnareDetails(int Service_Id_Pk, int questionnare_id)
        {
            objResponse response = new objResponse();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[2];

                sqlParameter[0] = new SqlParameter("@S_id", SqlDbType.Int, 10);
                sqlParameter[0].Value = Service_Id_Pk;

                sqlParameter[1] = new SqlParameter("@Q_id", SqlDbType.Int, 10);
                sqlParameter[1].Value = questionnare_id;

               DATA_ACCESS.Fill(response.ResponseData, "usp_GetQuestionnareDetails", sqlParameter, Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return response;
        }

        public objResponse getAnswerForQuestionnare(int questionnare_id)
        {
            objResponse response = new objResponse();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[1];

                sqlParameter[0] = new SqlParameter("@Q_id", SqlDbType.Int, 10);
                sqlParameter[0].Value = questionnare_id;

                DATA_ACCESS.Fill(response.ResponseData, "usp_getAnswerForQuestionnare", sqlParameter, Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
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
