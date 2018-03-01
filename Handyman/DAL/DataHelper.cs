using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace DAL
{
    public static class DataHelper
    {
        #region Private Variables

        private static DatabaseProviderFactory factory = null;
        private static Database database = null;

        #endregion Private Variables

        #region Public Methods

        /// <summary>
        ///  Use for insert/update or execute procedure command.
        /// </summary>
        /// <param name="storedProcedureName"></param>
        /// <param name="parameters"></param>
        /// <param name="connectionStringName"></param>
        public static void ExecuteScalar(string storedProcedureName, List<ParamEntity> parameters = null, string connectionStringName = null)
        {
            DbCommand dbCommand = null;
            try
            {
                //Database db = GetDatabase(connectionStringName);
                GetDatabase(connectionStringName);

                dbCommand = database.GetStoredProcCommand(storedProcedureName);

                if (parameters != null && parameters.Any())
                {
                    foreach (ParamEntity pE in parameters)
                    {
                        if (pE.IsOutParam)
                            database.AddOutParameter(dbCommand, pE.ParamName, pE.ParamType, pE.Size);
                        else
                            database.AddInParameter(dbCommand, pE.ParamName, pE.ParamType, pE.ParamValue);
                    }
                };

                database.ExecuteScalar(dbCommand);

                ////Retrieve the value of the output parameter
                if (parameters != null)
                    foreach (ParamEntity oParam in parameters)
                    {
                        if (oParam.IsOutParam)
                        {
                            oParam.ParamValue = database.GetParameterValue(dbCommand, oParam.ParamName);
                        }
                    }

            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                dbCommand.Dispose();
                GC.SuppressFinalize(dbCommand);
            }
        }

        /// <summary>
        /// To get dataset form database in case of multiple table output
        /// </summary>
        /// <param name="storedProcedureName"></param>
        /// <param name="parameters"></param>
        /// <param name="connectionStringName"></param>
        /// <returns></returns>
        public static DataSet GetDataSet(string storedProcedureName, List<ParamEntity> parameters = null, string connectionStringName = null)
        {
            DbCommand dbCommand = null;
            try
            {
                GetDatabase(connectionStringName);
                string sqlCommand = storedProcedureName;
                dbCommand = database.GetStoredProcCommand(sqlCommand);
                if (parameters != null && parameters.Any())
                {
                    foreach (ParamEntity pE in parameters)
                    {
                        if (pE.IsOutParam)
                        {
                            database.AddOutParameter(dbCommand, pE.ParamName, pE.ParamType, pE.Size);
                        }
                        else
                        {
                            database.AddInParameter(dbCommand, pE.ParamName, pE.ParamType, pE.ParamValue);
                        }
                    }
                }
                DataSet LookupDataSet = null;
                LookupDataSet = database.ExecuteDataSet(dbCommand);

                //Retrieve the value of the output parameter
                if (parameters != null)
                    foreach (ParamEntity oParam in parameters)
                    {
                        if (oParam.IsOutParam)
                        {
                            oParam.ParamValue = database.GetParameterValue(dbCommand, oParam.ParamName);
                        }
                    }

                return LookupDataSet;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dbCommand.Dispose();
                GC.SuppressFinalize(dbCommand);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="strCommandText"></param>
        /// <param name="parameters"></param>
        /// <param name="connectionStringName"></param>
        /// <returns></returns>
        public static List<T> ExecuteReaderStoredProcedure<T>(string strCommandText, List<ParamEntity> parameters = null, string connectionStringName = null)
        {
            return ExecuteReader<T>(strCommandText, CommandType.StoredProcedure, parameters, connectionStringName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="strCommandText"></param>
        /// <param name="parameters"></param>
        /// <param name="connectionStringName"></param>
        /// <returns></returns>
        public static T ExecuteStoredProcedure<T>(string strCommandText, List<ParamEntity> parameters = null, string connectionStringName = null)
        {
            T obj = default(T);
            var list = ExecuteReader<T>(strCommandText, CommandType.StoredProcedure, parameters, connectionStringName);
            if (list != null && list.Any())
            {
                return list.FirstOrDefault();
            }
            return obj;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="strCommandText"></param>
        /// <param name="parameters"></param>
        /// <param name="connectionStringName"></param>
        /// <returns></returns>
        public static List<T> ExecuteReaderCommand<T>(string strCommandText, List<ParamEntity> parameters = null, string connectionStringName = null)
        {
            return ExecuteReader<T>(strCommandText, CommandType.Text, parameters, connectionStringName);
        }

        #endregion Public Methods

        #region Private Methods

        private static Database GetDatabase(string dbName = null)
        {
            try
            {
                factory = new DatabaseProviderFactory();
                database = null;
                if (dbName == null)
                {
                    return database = factory.CreateDefault();
                }
                else
                {
                    return database = factory.Create(dbName);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                factory.Dispose();
                GC.SuppressFinalize(factory);
            }
        }

        private static List<T> ExecuteReader<T>(string strCommandText, CommandType commandType = CommandType.StoredProcedure, List<ParamEntity> parameters = null, string connectionStringName = null)
        {
            DbCommand dbCommand = null;
            try
            {
                List<T> TList = new List<T>();
                GetDatabase(connectionStringName);


                if (commandType == CommandType.Text)
                {
                    dbCommand = database.GetSqlStringCommand(strCommandText);
                }
                else
                {
                    dbCommand = database.GetStoredProcCommand(strCommandText);
                }

                dbCommand.CommandTimeout = 200;

                if (parameters != null && parameters.Any())
                {
                    foreach (ParamEntity pE in parameters)
                    {
                        if (pE.IsOutParam)
                            database.AddOutParameter(dbCommand, pE.ParamName, pE.ParamType, pE.Size);
                        else
                            database.AddInParameter(dbCommand, pE.ParamName, pE.ParamType, pE.ParamValue);
                    }
                }

                using (IDataReader dataReader = database.ExecuteReader(dbCommand))
                    TList = DataReaderMapToList<T>(dataReader);

                ////Retrieve the value of the output parameter
                if (parameters != null)
                    foreach (ParamEntity oParam in parameters)
                    {
                        if (oParam.IsOutParam)
                        {
                            oParam.ParamValue = database.GetParameterValue(dbCommand, oParam.ParamName);
                        }
                    }

                return TList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dbCommand.Dispose();
                GC.SuppressFinalize(dbCommand);
            }
        }

        private static List<T> DataReaderMapToList<T>(IDataReader dr)
        {
            List<T> list = new List<T>();
            T obj = default(T);
            while (dr.Read())
            {
                obj = Activator.CreateInstance<T>();
                PropertyInfo[] propertyInfos = typeof(T).GetProperties();
                for (int i = 0; i < dr.FieldCount; i++)
                {
                    foreach (PropertyInfo prop in propertyInfos)
                    {
                        if (prop.Name == dr.GetName(i))
                        {
                            if (!object.Equals(dr[prop.Name], DBNull.Value))
                            {
                                prop.SetValue(obj, dr[prop.Name], null);
                            }
                            break;
                        }
                    }
                }

                list.Add(obj);
            }
            return list;
        }

        #endregion Private Methods
    }
}
