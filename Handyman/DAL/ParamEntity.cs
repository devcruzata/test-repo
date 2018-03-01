using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ParamEntity
    {
        private object paramValue;
        private string paramName;
        private DbType paramType;
        private bool isOutParam = false;
        private int _Size = 0;

        public ParamEntity(string paramName, DbType paramType, object paramValue)
        {
            this.ParamName = paramName;
            this.ParamType = paramType;
            this.ParamValue = paramValue;
        }

        public ParamEntity(string paramName, DbType paramType, int size, bool isOutParam)
        {
            this.ParamName = paramName;
            this.ParamType = paramType;
            this._Size = size;
            this.IsOutParam = isOutParam;
        }

        public DbType ParamType
        {
            get { return paramType; }
            set { paramType = value; }
        }

        public string ParamName
        {
            get { return paramName; }
            set { paramName = value; }
        }

        public object ParamValue
        {
            get { return paramValue; }
            set { paramValue = value; }
        }
        public bool IsOutParam
        {
            get { return isOutParam; }
            set { isOutParam = value; }
        }

        public int Size
        {
            get { return _Size; }
            set { _Size = value; }
        }
    }
}
