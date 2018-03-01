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

namespace BAL.Category
{
    public class CategoryManager
    {

        public List<OK_Categories> GetCategoriesListForDropDown()
        {
            List<OK_Categories> categoryList = new List<OK_Categories>();

            objResponse response = new objResponse();
            try
            {

                DATA_ACCESS.Fill(response.ResponseData, "usp_GetCategoriesListForDropDown", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    OK_Categories objCategories = new OK_Categories();
                    objCategories.Category_ID_Auto_PK = Convert.ToInt32(dr["Category_ID_Auto_PK"]);
                    objCategories.Category_Code = Convert.ToString(dr["Category_Code"]);
                    objCategories.Category_Name = Convert.ToString(dr["Category_Name"]);
                    categoryList.Add(objCategories);
                }
            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return categoryList;
        }

        public List<CategoriesListingViewModel> GetCategoryListings()
        {
            List<CategoriesListingViewModel> categoryList = new List<CategoriesListingViewModel>();

            objResponse response = new objResponse();
            try
            {

                DATA_ACCESS.Fill(response.ResponseData, "usp_GetCategoriesListings", Constants.Constants.ConnectionString);

                response.ErrorCode = 0;
                response.ErrorMessage = "Success";
                DataTable dt = new DataTable();
                dt = response.ResponseData.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    CategoriesListingViewModel objCategoryListing = new CategoriesListingViewModel();
                    objCategoryListing.Category_ID_Auto_PK = Convert.ToInt32(dr["Category_ID_Auto_PK"]);
                    objCategoryListing.Category_Code = Convert.ToString(dr["Category_Code"]);
                    objCategoryListing.Category_Name = Convert.ToString(dr["Category_Name"]);
                    objCategoryListing.Category_Description = Convert.ToString(dr["Category_Description"]);
                    objCategoryListing.Category_IconUrl = Convert.ToString(dr["Category_IconUrl"]);
                    objCategoryListing.Category_ImageUrl = Convert.ToString(dr["Category_ImageUrl"]);
                    objCategoryListing.Status = Convert.ToString(dr["Status"]);
                    categoryList.Add(objCategoryListing);
                }
            }
            catch (Exception ex)
            {
                response.ErrorCode = 2001;
                response.ErrorMessage = "Error while processing: " + ex.Message;
            }
            return categoryList;
        }

        public DataTable AddCategories(OK_Categories objCategories)
        {
            objResponse Response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[7];

                sqlParameter[0] = new SqlParameter("@C_name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objCategories.Category_Name;

                sqlParameter[1] = new SqlParameter("@C_description", SqlDbType.NVarChar, 200);
                sqlParameter[1].Value = objCategories.Category_Description;

                sqlParameter[2] = new SqlParameter("@C_CreatedDate", SqlDbType.DateTime, 100);
                sqlParameter[2].Value = objCategories.CreatedDate;

                sqlParameter[3] = new SqlParameter("@C_UpdatedDate", SqlDbType.DateTime, 100);
                sqlParameter[3].Value = objCategories.UpdatedDate;

                sqlParameter[4] = new SqlParameter("@C_CreatedBy", SqlDbType.NVarChar, 50);
                sqlParameter[4].Value = objCategories.CreatedBy;

                sqlParameter[5] = new SqlParameter("@C_UpdatedBy", SqlDbType.NVarChar, 50);
                sqlParameter[5].Value = objCategories.UpdatedBy;

                sqlParameter[6] = new SqlParameter("@C_status", SqlDbType.NVarChar, 20);
                sqlParameter[6].Value = objCategories.Status;

                //sqlParameter[9] = new SqlParameter("@C_isparent", SqlDbType.Bit, 1);
                //sqlParameter[9].Value = objCategories.Category_IsParent;

                //sqlParameter[10] = new SqlParameter("@C_cat_parent_id_fk", SqlDbType.Int, 20);
                //sqlParameter[10].Value = objCategories.Category_Parent_ID_FK;


               DATA_ACCESS.Fill(Response.ResponseData, "usp_SetCategories", sqlParameter, Constants.Constants.ConnectionString);
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

        public DataTable AddCategoryImage(string fname, int id_auto_pk)
        {
            objResponse Response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[3];

                sqlParameter[0] = new SqlParameter("@C_imageurl", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = fname;

                sqlParameter[1] = new SqlParameter("@C_iconurl", SqlDbType.NVarChar, 200);
                sqlParameter[1].Value = fname;

                sqlParameter[2] = new SqlParameter("@C_id_auto_pk", SqlDbType.Int, 20);
                sqlParameter[2].Value = id_auto_pk;


                DATA_ACCESS.Fill(Response.ResponseData, "usp_SetCategoryImage", sqlParameter, Constants.Constants.ConnectionString);
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


        public DataTable GetCategoryForUpdate(int id_auto_pk)
        {
            objResponse Response = new objResponse();
            DataTable dt = new DataTable();
            try
            {


                SqlParameter[] sqlParameter = new SqlParameter[1];

                sqlParameter[0] = new SqlParameter("@C_id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[0].Value = id_auto_pk;



                DATA_ACCESS.Fill(Response.ResponseData, "usp_GetCategory", sqlParameter, Constants.Constants.ConnectionString);
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

        public DataTable UpdateCategory(OK_Categories objCategory)
        {
            objResponse Response = new objResponse();
            DataTable dt = new DataTable();
            try
            {

                SqlParameter[] sqlParameter = new SqlParameter[5];

                sqlParameter[0] = new SqlParameter("@C_name", SqlDbType.NVarChar, 100);
                sqlParameter[0].Value = objCategory.Category_Name;

                sqlParameter[1] = new SqlParameter("@C_description", SqlDbType.NVarChar, 200);
                sqlParameter[1].Value = objCategory.Category_Description;

                sqlParameter[2] = new SqlParameter("@C_UpdatedDate", SqlDbType.DateTime, 100);
                sqlParameter[2].Value = objCategory.UpdatedDate;

                sqlParameter[3] = new SqlParameter("@C_UpdatedBy", SqlDbType.NVarChar, 50);
                sqlParameter[3].Value = objCategory.UpdatedBy;

                sqlParameter[4] = new SqlParameter("@C_id_auto_pk", SqlDbType.Int, 10);
                sqlParameter[4].Value = objCategory.Category_ID_Auto_PK;


                DATA_ACCESS.Fill(Response.ResponseData, "usp_UpdateCategory", sqlParameter, Constants.Constants.ConnectionString);
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


    }
}
