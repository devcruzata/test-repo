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

namespace BAL.ServiceOrder
{
    public class ServiceOrderManager
    {
        public List<ServiceOrderListingViewModel> GetServiceOrderListings()
        {
            List<ServiceOrderListingViewModel> serviceOrderList = new List<ServiceOrderListingViewModel>();

            objResponse response = new objResponse();
            try
            {


                DATA_ACCESS.Fill(response.ResponseData, "GetServiceOrderListings", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    //if ((Convert.ToString(dr["ServiceOrder_Stage"]).Equals("1")))
                    //{

                    //}
                    //else
                    //{
                    ServiceOrderListingViewModel objServiceOrderListing = new ServiceOrderListingViewModel();
                    objServiceOrderListing.ServiceOrder_ID_Auto_PK = Convert.ToInt32(dr["ServiceOrder_ID_Auto_PK"]);
                    objServiceOrderListing.ServiceOrder_Service_ID_FK = Convert.ToInt32(dr["ServiceOrder_Service_ID_FK"]);
                    objServiceOrderListing.ServiceOrder_QuestionnareID = Convert.ToInt32(dr["ServiceOrder_QuestionnareID"]);
                    objServiceOrderListing.ServiceOrder_Address1 = Convert.ToString(dr["ServiceOrder_Address1"]);
                    objServiceOrderListing.ServiceOrder_Address2 = Convert.ToString(dr["ServiceOrder_Address2"]);
                    objServiceOrderListing.ServiceOrder_ContantPerson = Convert.ToString(dr["ServiceOrder_ContantPerson"]);
                    objServiceOrderListing.ServiceOrder_ContactMobile = Convert.ToString(dr["ServiceOrder_ContactMobile"]);
                    //objServiceOrderListing.Service_IsPaid = Convert.ToBoolean(dr["Service_IsPaid"]);
                    objServiceOrderListing.ServiceOrder_TimeSlot = Convert.ToString(dr["ServiceOrder_TimeSlot"]);
                    objServiceOrderListing.UpdatedDate = Convert.ToDateTime(dr["UpdatedDate"]);
                    objServiceOrderListing.ServiceOrder_Stage = Convert.ToString(dr["ServiceOrder_Stage"]);
                    objServiceOrderListing.Status = Convert.ToString(dr["Status"]);
                    objServiceOrderListing.Service_Name = Convert.ToString(dr["Service_Name"]);
                    objServiceOrderListing.ServiceOrder_Scheduled_Date_Time = Convert.ToDateTime(dr["ServiceOrder_Scheduled_Date_Time"]);
                    serviceOrderList.Add(objServiceOrderListing);
                    //}                  

                }

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return serviceOrderList;
        }

        public objResponse getQuestionnareForOrder(int s_order_id)
        {
            objResponse Response = new objResponse();

            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[1];

                sqlParameter[0] = new SqlParameter("@id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = s_order_id;

              DATA_ACCESS.Fill(Response.ResponseData, "usp_GetQuestionnareForOrder", sqlParameter, Constants.Constants.ConnectionString);

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

        public objResponse getQuestionnareForOrder(int s_order_id, int q_id)
        {
            objResponse Response = new objResponse();

            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[2];

                sqlParameter[0] = new SqlParameter("@id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = s_order_id;

                sqlParameter[1] = new SqlParameter("@q_id", SqlDbType.Int, 10);
                sqlParameter[1].Value = q_id;

                DATA_ACCESS.Fill(Response.ResponseData, "usp_GetAnswersetOfOrder", sqlParameter, Constants.Constants.ConnectionString);

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

        public objResponse changeOrderAction(int Order_id, string Action)
        {
            objResponse Response = new objResponse();
            try
            {
                SqlParameter[] sqlParameter = new SqlParameter[2];

                sqlParameter[0] = new SqlParameter("@id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = Order_id;

                sqlParameter[1] = new SqlParameter("@action", SqlDbType.NVarChar, 20);
                sqlParameter[1].Value = Action;

                DATA_ACCESS.Fill(Response.ResponseData, "usp_ChangeOrderAction", sqlParameter, Constants.Constants.ConnectionString);

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
    }
}
