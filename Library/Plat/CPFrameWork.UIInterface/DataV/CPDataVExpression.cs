using CPFrameWork.Global;
using NVelocity;
using System;
using System.Collections.Generic;
using System.Text;

namespace CPFrameWork.UIInterface.DataV
{
   

    [CPName("数据统计", 5)]
    public class CPDataVExpression
    {
        public const string DataRowKey = "DataVDR_D6ED5027-744D-4D9F-988D-536242C6DD9E";
        private VelocityContext _vltContext;
        public CPDataVExpression(VelocityContext context)
        {
            this._vltContext = context;
        }
        [CPName("获取字段值")]
        public string Field([CPName("字段名")]string fieldName)
        {
            object obj = "";
            dynamic FormData = this._vltContext.Get(DataRowKey) as dynamic;
            obj = FormData[fieldName];
            if (obj == null)
                return "";
            else
                return obj.ToString();

        }
    }
}
