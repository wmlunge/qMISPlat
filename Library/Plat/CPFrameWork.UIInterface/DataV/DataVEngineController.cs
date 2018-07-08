using CPFrameWork.Global;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace CPFrameWork.UIInterface.DataV
{
    public  class DataVEngineController: CPWebApiBaseController
    {


        #region 获取配置信息
        public class GetDataVInfoReturn : CPWebApiBaseReturnEntity
        {
            public CPDataV DataV { get; set; }
            public bool IsHasSuperAdminRight { get; set; }
        }
        public GetDataVInfoReturn GetDataVInfoByDataVId(int DataVId, int CurUserId, string CurUserIden)
        {
            GetDataVInfoReturn re = new GetDataVInfoReturn();
            try
            {
                base.SetHeader();
                CurUserIden = CPAppContext.FormatSqlPara(CurUserIden);

                if (this.CheckUserIden(CurUserId, CurUserIden) == false)
                {
                    re.Result = false;
                    re.ErrorMsg = "系统检测到非法获取数据，请传入正确的用户会话Key与用户Id参数！";
                    return re;
                }
                string DataVCode = CPDataVEngine.Instance(CurUserId).GetDataVCode(DataVId);
                re.Result = true;
                re.DataV = CPDataVEngine.Instance(CurUserId).GetDataV(DataVCode, true, true);
                CPDataVEngine.Instance(CurUserId).LoadDataVRealData(re.DataV,"");
                if (re.DataV.SysId.HasValue && re.DataV.SysId.Value.Equals(CPAppContext.InnerSysId) == false)
                {
                    string UserAdminSysIds = CPExpressionHelper.Instance.RunCompile("${CPUser.UserAdminSysIds()}");
                    if (UserAdminSysIds.Split(',').ToList().Contains(re.DataV.SysId.ToString()))
                    {
                        re.IsHasSuperAdminRight = true;
                    }
                    else
                        re.IsHasSuperAdminRight = false;
                }
                return re;
            }
            catch (Exception ex)
            {
                re.Result = false;
                re.ErrorMsg = ex.Message.ToString();
                return re;
            }
        }
        [HttpGet]
        public GetDataVInfoReturn GetDataVInfo(string DataVCode,int CurUserId, string CurUserIden)
        {
            GetDataVInfoReturn re = new GetDataVInfoReturn();
            try
            {
                base.SetHeader();
                DataVCode = CPAppContext.FormatSqlPara(DataVCode);
                CurUserIden = CPAppContext.FormatSqlPara(CurUserIden);

                if (this.CheckUserIden(CurUserId, CurUserIden) == false)
                {
                    re.Result = false;
                    re.ErrorMsg = "系统检测到非法获取数据，请传入正确的用户会话Key与用户Id参数！";
                    return re;
                }
                re.Result = true;
                re.DataV = CPDataVEngine.Instance(CurUserId).GetDataV(DataVCode, true, true);
                CPDataVEngine.Instance(CurUserId).LoadDataVRealData(re.DataV,"");
                if (re.DataV.SysId.HasValue && re.DataV.SysId.Value.Equals(CPAppContext.InnerSysId) == false)
                {
                    string UserAdminSysIds = CPExpressionHelper.Instance.RunCompile("${CPUser.UserAdminSysIds()}");
                    if (UserAdminSysIds.Split(',').ToList().Contains(re.DataV.SysId.ToString()))
                    {
                        re.IsHasSuperAdminRight = true;
                    }
                    else
                        re.IsHasSuperAdminRight = false;
                }
                return re;
            }
            catch(Exception ex)
            {
                re.Result = false;
                re.ErrorMsg = ex.Message.ToString();
                return re;
            }
        }

        [HttpGet]
        public GetDataVInfoReturn GetDataVStatisticsInfo(string DataVCode,int StatisticsId,string sWhere, int CurUserId, string CurUserIden)
        {
            GetDataVInfoReturn re = new GetDataVInfoReturn();
            try
            {
                base.SetHeader();
                DataVCode = CPAppContext.FormatSqlPara(DataVCode);
                CurUserIden = CPAppContext.FormatSqlPara(CurUserIden);
                sWhere = System.Web.HttpUtility.UrlDecode(sWhere);
                if (this.CheckUserIden(CurUserId, CurUserIden) == false)
                {
                    re.Result = false;
                    re.ErrorMsg = "系统检测到非法获取数据，请传入正确的用户会话Key与用户Id参数！";
                    return re;
                }
                re.Result = true;
                re.DataV = CPDataVEngine.Instance(CurUserId).GetDataV(DataVCode, true, true);
                List<CPDataVStatistics> sCol = new List<CPDataVStatistics>();
                re.DataV.StatisticsCol.ForEach(t => {
                    if (t.ParentStatisticsId.Equals(StatisticsId))
                        sCol.Add(t);
                });
                re.DataV.StatisticsCol = sCol;
                CPDataVEngine.Instance(CurUserId).LoadDataVRealData(re.DataV,sWhere);
                return re;
            }
            catch (Exception ex)
            {
                re.Result = false;
                re.ErrorMsg = ex.Message.ToString();
                return re;
            }
        }
        #endregion


        #region 导出配置
        [HttpGet]
        public FileResult DownloadDataVConfig(string DataVIds, int CurUserId, string CurUserIden)
        {
            base.SetHeader();
            CurUserIden = CPAppContext.FormatSqlPara(CurUserIden);
            CPWebApiBaseReturnEntity re = new CPWebApiBaseReturnEntity();
            if (this.CheckUserIden(CurUserId, CurUserIden) == false)
            {
                throw new Exception("系统检测到非法获取数据，请传入正确的用户会话Key与用户Id参数！");
            }
            DataVIds = DataVIds.Replace("@", ",");
            DataVIds = CPAppContext.FormatSqlPara(DataVIds);
            List<int> col = new List<int>();
            DataVIds.Split(',').ToList().ForEach(t => {
                if (string.IsNullOrEmpty(t) == false)
                    col.Add(int.Parse(t));
            });
            string sXml = CPDataVEngine.Instance(CurUserId).GetDataVConfigXml(col);
            byte[] byteArray = System.Text.Encoding.Default.GetBytes(sXml);
            return File(byteArray, "application/x-msdownload", "数据统计配置.CPXml");
        }
        #endregion

        #region 根据配置文件新增或修改配置
        [HttpPost]
        public CPWebApiBaseReturnEntity SynDataVConfig(int TargetSysId, bool IsCreateNew, int CurUserId, string CurUserIden)
        {
            base.SetHeader();
            CurUserIden = CPAppContext.FormatSqlPara(CurUserIden);
            CPWebApiBaseReturnEntity re = new CPWebApiBaseReturnEntity();
            if (this.CheckUserIden(CurUserId, CurUserIden) == false)
            {
                re.Result = false;
                re.ErrorMsg = "系统检测到非法获取数据，请传入正确的用户会话Key与用户Id参数！";
                return re;
            }
            try
            {
                var files = Request.Form.Files;
                foreach (var file in files)
                {
                    //  var filename = ContentDispositionHeaderValue
                    //                   .Parse(file.ContentDisposition)
                    //                .FileName
                    //                .Trim('"');
                    ////  filename = _FilePath + $@"\{filename}";
                    //  size += file.Length;
                    byte[] bData = null;
                    using (var fileStream = file.OpenReadStream())
                    using (var ms = new MemoryStream())
                    {
                        fileStream.CopyTo(ms);
                        bData = ms.ToArray();
                        //var fileBytes = ms.ToArray();
                        //string s = Convert.ToBase64String(fileBytes);
                        //// act on the Base64 data
                    }
                    if (bData != null)
                    {
                        if (IsCreateNew)
                        {
                            re.Result = CPDataVEngine.Instance(CurUserId).InitDataVFromConfigXml(TargetSysId, bData);
                        }
                        else
                        {
                            re.Result = CPDataVEngine.Instance(CurUserId).SyncDataVFromConfigXml(TargetSysId, bData);
                        }
                    }
                }
                re.Result = true;
                return re;
            }
            catch (Exception ex)
            {
                re.Result = false;
                re.ErrorMsg = ex.Message.ToString();
                return re;
            }
        }
        #endregion
    }
}
