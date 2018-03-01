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
    public class CommonTaskManager
    {


        /// <summary>
        /// Change Status For All tables
        /// </summary>
        /// <param name="id_auto_pk"></param>
        /// <param name="tbl_name"></param>
        public string changeStatus(string id_auto_pk, string tbl_name)
        {
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[2];

                sqlParameter[0] = new SqlParameter("@id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = id_auto_pk;

                sqlParameter[1] = new SqlParameter("@tbl_name", SqlDbType.NVarChar, 30);
                sqlParameter[1].Value = tbl_name;


                DATA_ACCESS.Fill(response.ResponseData, "usp_ManageStatus", sqlParameter, Constants.Constants.ConnectionString);

                dt = response.ResponseData.Tables[0];
                response.ErrorCode = 0;
                response.ErrorMessage = "Success";

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return Convert.ToString(dt.Rows[0][0]);
        }


        /// <summary>
        /// Change Service Type 
        /// </summary>
        /// <param name="id_auto_pk"></param>
        /// <param name="tbl_name"></param>
        public string changeServiceType(string id_auto_pk, string tbl_name)
        {
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[2];

                sqlParameter[0] = new SqlParameter("@id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = id_auto_pk;

                sqlParameter[1] = new SqlParameter("@tbl_name", SqlDbType.NVarChar, 30);
                sqlParameter[1].Value = tbl_name;


               DATA_ACCESS.Fill(response.ResponseData, "usp_ManageServiceType", sqlParameter, Constants.Constants.ConnectionString);

                dt = response.ResponseData.Tables[0];
                response.ErrorCode = 0;
                response.ErrorMessage = "Success";

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return Convert.ToString(dt.Rows[0][0]);
        }

        public string deleteTblData(string id_auto_pk, string tbl_name)
        {
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[2];

                sqlParameter[0] = new SqlParameter("@id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = id_auto_pk;

                sqlParameter[1] = new SqlParameter("@tbl_name", SqlDbType.NVarChar, 30);
                sqlParameter[1].Value = tbl_name;

                DATA_ACCESS.Fill(response.ResponseData, "usp_DeleteTblData", sqlParameter, Constants.Constants.ConnectionString);

                dt = response.ResponseData.Tables[0];
                response.ErrorCode = 0;
                response.ErrorMessage = "Success";

                return Convert.ToString(dt.Rows[0][0]);

            }
            catch (Exception ex)
            {

                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;

            }
            return Convert.ToString(dt.Rows[0][0]);
        }

        public objResponse deleteQuestionnare(int Service_id_auto_pk, int Questionnare_Id_Pk)
        {
            objResponse response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[2];

                sqlParameter[0] = new SqlParameter("@S_id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = Service_id_auto_pk;

                sqlParameter[1] = new SqlParameter("@Q_id_auto_pk", SqlDbType.Int, 30);
                sqlParameter[1].Value = Questionnare_Id_Pk;

                DATA_ACCESS.Fill(response.ResponseData, "usp_DeleteQuestionnare", sqlParameter, Constants.Constants.ConnectionString);

                dt = response.ResponseData.Tables[0];
                response.ErrorCode = 0;
                response.ErrorMessage = Convert.ToString(dt.Rows[0][0]);

                return response;

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
