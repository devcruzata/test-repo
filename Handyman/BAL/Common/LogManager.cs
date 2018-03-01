using DAL;
using Project.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Common
{
    public partial class LogManager
    {
        List<ParamEntity> lstParameters;

        /// <summary>
        /// Save Log
        /// </summary>
        /// <param name="obj"></param>
        public void Save(Log obj)
        {
            try
            {
                lstParameters = new List<ParamEntity>();
                lstParameters.Add(new ParamEntity("@Id", System.Data.DbType.Int32, obj.Id));
                lstParameters.Add(new ParamEntity("@CreatedOnUtc", System.Data.DbType.DateTime, obj.CreatedOnUtc));
                lstParameters.Add(new ParamEntity("@UserId", System.Data.DbType.Int32, obj.CustomerId));
                lstParameters.Add(new ParamEntity("@FullMessage", System.Data.DbType.String, obj.FullMessage));
                lstParameters.Add(new ParamEntity("@IpAddress", System.Data.DbType.String, obj.IpAddress));
                lstParameters.Add(new ParamEntity("@IsErrorDisplay", System.Data.DbType.Boolean, obj.IsErrorDisplay));
                lstParameters.Add(new ParamEntity("@LogLevelId", System.Data.DbType.Int32, obj.LogLevelId));
                lstParameters.Add(new ParamEntity("@PageUrl", System.Data.DbType.String, obj.PageUrl));
                lstParameters.Add(new ParamEntity("@ReferrerUrl", System.Data.DbType.String, obj.ReferrerUrl));
                lstParameters.Add(new ParamEntity("@SentEmail", System.Data.DbType.Int32, obj.SentEmail));
                lstParameters.Add(new ParamEntity("@ShortMessage", System.Data.DbType.String, obj.ShortMessage));
                DataHelper.ExecuteScalar("spSaveLog", lstParameters);
            }
            catch (Exception ex)
            {
                //throw ex;
            }
            finally
            {
                if (lstParameters != null)
                    GC.SuppressFinalize(lstParameters);
            }
        }
    }
}
