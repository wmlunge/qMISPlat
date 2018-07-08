using CPFrameWork.Global;
using CPFrameWork.Utility;
using CPFrameWork.Utility.DbOper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace CPFrameWork.UIInterface.DataV
{
  public   class CPDataVEngine
    {
        #region 获取实例 

        /// <summary>
        /// 获取节点对象服务类
        /// </summary>
        /// <returns></returns>
        public static void StartupInit(IServiceCollection services, IConfigurationRoot Configuration)
        {
            // Add framework services.
            services.AddDbContext<CPCommonDbContext>(options =>//手工高亮
                options.UseSqlServer(Configuration.GetConnectionString("CPCommonIns")));

            services.TryAddTransient<ICPCommonDbContext, CPCommonDbContext>();
            services.TryAddTransient<BaseCPDataVRep, CPDataVRep>();
            services.TryAddTransient<BaseRepository<CPDataVStatistics>, CPDataVStatisticsRep>();
            services.TryAddTransient<BaseRepository<CPDataVChartSeries>, CPDataVChartSeriesRep>();
            services.TryAddTransient<BaseRepository<CPDataVChartSearch>, CPDataVChartSearchRep>();
            services.TryAddTransient<BaseRepository<CPDataVLayout>, CPDataVLayoutRep>();
            services.TryAddTransient<CPDataVEngine, CPDataVEngine>();
        }
        public static CPDataVEngine Instance(int curUserId)
        {
            CPDataVEngine iObj = CPAppContext.GetService<CPDataVEngine>();
            iObj.CurUserId = curUserId;
            return iObj;
        }


        #endregion
        public int CurUserId { get; set; }


        private BaseCPDataVRep _CPDataVRep;
        private BaseRepository<CPDataVStatistics> _CPDataVStatisticsRep;
        private BaseRepository<CPDataVChartSeries> _CPDataVChartSeriesRep;
        private BaseRepository<CPDataVChartSearch> _CPDataVChartSearchRep;
        private BaseRepository<CPDataVLayout> _CPDataVLayoutRep;

        public CPDataVEngine(
            BaseCPDataVRep CPDataVRep,
            BaseRepository<CPDataVStatistics> CPDataVStatisticsRep,
            BaseRepository<CPDataVChartSeries> CPDataVChartSeriesRep,
            BaseRepository<CPDataVChartSearch> CPDataVChartSearchRep,
            BaseRepository<CPDataVLayout> CPDataVLayoutRep

            )
        {
            this._CPDataVRep = CPDataVRep;
            this._CPDataVStatisticsRep = CPDataVStatisticsRep;
            this._CPDataVChartSeriesRep = CPDataVChartSeriesRep;
            this._CPDataVChartSearchRep = CPDataVChartSearchRep;
            this._CPDataVLayoutRep = CPDataVLayoutRep;

        }
        public string GetDataVCode(int dataVId)
        {
           CPDataV dataV =   this._CPDataVRep.Get(dataVId);
            return dataV.DataVCode;
        }
        public CPDataV GetDataV(string dataVCode,bool isLoadStatistics, bool isLoadLayout)
        {
            int nCount = 0;
            if (isLoadStatistics)
            {
                nCount++;
            }
            if (isLoadLayout)
            {
                nCount++;
            }
           
            Expression<Func<CPDataV, dynamic>>[] eagerLoadingProperties = new Expression<Func<CPDataV, dynamic>>[nCount];
            int nIndex = 0;
            if (isLoadStatistics)
            {
                eagerLoadingProperties[nIndex] = t => t.StatisticsCol;
                nIndex++;
            }
            if (isLoadLayout)
            {
                eagerLoadingProperties[nIndex] = t => t.LayoutCol;
                nIndex++;
            }
          
            ISpecification<CPDataV> specification;
            specification = new ExpressionSpecification<CPDataV>(t => t.DataVCode.Equals(dataVCode));
            IList<CPDataV> col = this._CPDataVRep.GetByCondition(specification, eagerLoadingProperties);
            if (col.Count <= 0)
                return null;
            else
            {
                CPDataV dataV =  col[0];
                if(isLoadStatistics)
                {
                    if(dataV.StatisticsCol != null)
                    {
                        dataV.StatisticsCol = dataV.StatisticsCol.OrderBy(c => c.ShowOrder).ToList();
                        dataV.StatisticsCol.ForEach(t => {
                            ISpecification<CPDataVChartSeries> specificationSeries;
                            specificationSeries = new ExpressionSpecification<CPDataVChartSeries>(c => c.StatisticsId.Equals(t.Id));
                            t.SeriesCol =  this._CPDataVChartSeriesRep.GetByCondition(specificationSeries).ToList();
                            
                            ISpecification<CPDataVChartSearch> specificationSearch;
                            specificationSearch = new ExpressionSpecification<CPDataVChartSearch>(c => c.StatisticsId.Equals(t.Id));
                            t.SearchCol = this._CPDataVChartSearchRep.GetByCondition(specificationSearch).ToList();
                            t.SearchCol = t.SearchCol.OrderBy(c => c.ShowOrder).ToList();
                        });
                    }
                }
                return dataV;
            }
        }

        public bool LoadDataVRealData(CPDataV dataV,string sWhere )
        {
            if (dataV == null)
                return true;
            if(dataV.StatisticsCol!= null && dataV.StatisticsCol.Count >0)
            {
                dataV.StatisticsCol.ForEach(t => {
                    #region 统计图X轴数据源
                    if (string.IsNullOrEmpty(t.XDataSource)==false && string.IsNullOrEmpty(t.XDataSourceInstance)==false)
                    {
                        DbHelper _helper = new DbHelper(t.XDataSourceInstance, CPAppContext.CurDbType());
                        string strSql = t.XDataSource;
                        strSql = CPExpressionHelper.Instance.RunCompile(strSql);
                        DataTable dt = _helper.ExecuteDataTable(strSql);
                        t.XDataSourceCol = new List<string >();
                        foreach(DataRow dr in dt.Rows)
                        { 
                            string text = Convert.IsDBNull(dr[0]) ? "" : dr[0].ToString().Trim();
                            if (t.XDataSourceCol.Contains(text)==false)
                            { 
                                t.XDataSourceCol.Add(text);
                            }
                        }
                    }
                    #endregion

                    string defaultSearch = "";
                    #region 查询数据源
                    if(t.SearchCol != null && t.SearchCol.Count >0)
                    {
                        t.SearchCol.ForEach(search => {
                            if(search.SearchShowType == CPDataVEnum.SearchShowTypeEnum.DropDownList)
                            {
                                if(string.IsNullOrEmpty(search.FieldEnumDataIns)==false && string.IsNullOrEmpty(search.FieldEnumDataSource)==false)
                                {
                                    search.FieldEnumDataSourceCol = new List<CPDataVTextValue>();
                                    DbHelper _helper = new DbHelper(search.FieldEnumDataIns, CPAppContext.CurDbType());
                                    string strSql = search.FieldEnumDataSource;
                                    strSql = CPExpressionHelper.Instance.RunCompile(strSql);
                                    DataTable dt = _helper.ExecuteDataTable(strSql); 
                                    foreach (DataRow dr in dt.Rows)
                                    {
                                        string value = Convert.IsDBNull(dr[1]) ? "" : dr[1].ToString().Trim();
                                        string text = Convert.IsDBNull(dr[0]) ? "" : dr[0].ToString().Trim();
                                       
                                        if (search.FieldEnumDataSourceCol.Where(c=>c.Value.Equals(value)).ToList().Count <=0)
                                        {
                                            CPDataVTextValue item = new CPDataVTextValue();
                                            item.Text = text;
                                            item.Value = value;
                                            search.FieldEnumDataSourceCol.Add(item);
                                        }
                                    }
                                }
                            }
                            if(string.IsNullOrEmpty(search.DefaultValue)==false)
                            {
                                //默认值，如是时间字段，则用@分隔两上值
                                string tWhere = "";
                                if(search.SearchShowType== CPDataVEnum.SearchShowTypeEnum.TimeSelect)
                                {
                                    if(search.DefaultValue.IndexOf("@") != -1)
                                    {
                                        string[] sArray = search.DefaultValue.Split('@');
                                        tWhere = search.FieldName + " between '" + sArray[0] + "' AND '" + sArray[1] + "' ";
                                    }
                                    else
                                    {
                                        DateTime dTime = Convert.ToDateTime(search.DefaultValue);
                                        tWhere = search.FieldName + " between '" + dTime.ToShortDateString() + " 00:00:00' AND '" + dTime.ToShortDateString() +  " 23:59:59' ";
                                    }
                                }
                                else if( search.SearchShowType == CPDataVEnum.SearchShowTypeEnum.DropDownList)
                                {
                                    tWhere = search.FieldName + "='" + search.DefaultValue + "' ";
                                }
                                else
                                {
                                    tWhere = search.FieldName + " like '%" + search.DefaultValue + "%' ";
                                }
                                if (string.IsNullOrEmpty(defaultSearch))
                                    defaultSearch = tWhere;
                                else
                                    defaultSearch += " AND " + tWhere;
                            }
                        });
                    }
                    #endregion

                    #region 系列数据
                    if(t.SeriesCol != null && t.SeriesCol.Count >0)
                    {
                        t.SeriesCol.ForEach(series => {
                            if(series.MainDataSourceType == CPDataVEnum.DataSourceTypeEnum.Sql)
                            {
                                DbHelper _helper = new DbHelper(series.MainDataSourceInstance, CPAppContext.CurDbType());
                                string strSql = series.MainDataSource;
                                strSql = CPExpressionHelper.Instance.RunCompile(strSql);
                                if (string.IsNullOrEmpty(defaultSearch) == false)
                                {
                                    strSql = " SELECT * FROM (" + strSql + ") AS CPDataVContainerTable where " + defaultSearch;
                                    if (string.IsNullOrEmpty(sWhere) == false)
                                        strSql += " AND " + sWhere;
                                }
                                else
                                {
                                    if (string.IsNullOrEmpty(sWhere) == false)
                                    {
                                        strSql = " SELECT * FROM (" + strSql + ") AS CPDataVContainerTable where " + sWhere;
                                    }
                                }
                                DataTable dt = _helper.ExecuteDataTable(strSql);
                                DataColumn dc = new DataColumn();
                                dc.ColumnName = "CPDataVLevelCondition";
                                dc.DataType = typeof(System.String);
                                dt.Columns.Add(dc);
                                foreach(DataRow dr in dt.Rows)
                                {
                                    if(string.IsNullOrEmpty(series.LevelCondition)==false)
                                    {
                                        CPExpressionHelper.Instance.Add(CPDataVExpression.DataRowKey, dr);
                                        string sTmp = CPExpressionHelper.Instance.RunCompile(series.LevelCondition);
                                        CPExpressionHelper.Instance.Remove(CPDataVExpression.DataRowKey);
                                        dr["CPDataVLevelCondition"] = sTmp;
                                    }
                                    else
                                    {
                                        dr["CPDataVLevelCondition"] = "";
                                    }
                                   
                                }
                                series.MainDataSourceJson = CPUtils.DataTable2Json(dt);
                            }
                            else
                            {
                                throw new Exception("系列主数据源扩展类库未实现");
                            }
                        });
                    }
                    #endregion

                });
            }
            return true;
        }


        #region 配置导出，同步相关
        public string GetDataVConfigXml(List<int> dataVIdCol)
        {

            if (dataVIdCol.Count <= 0)
                return "";
            DataSet ds = this._CPDataVRep.GetConfig(dataVIdCol);
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            ds.WriteXml(ms);
            byte[] bData = ms.GetBuffer();
            ms.Close();
            return System.Text.UTF8Encoding.UTF8.GetString(bData);
        }
        /// <summary>
        /// 从xml创建新的列表配置实例 
        /// </summary>
        /// <param name="funcId"></param>
        /// <param name="sysId"></param>
        /// <param name="xml"></param>
        /// <returns></returns>
        public bool InitDataVFromConfigXml(int targetSysId, byte[] bData)
        {
            DataSet ds = new DataSet();
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            ms.Write(bData, 0, bData.Length);
            ms.Position = 0;
            ds.ReadXml(ms);
            ms.Close();
            bool b = true;
            b = _CPDataVRep.SyncConfigFromDataSet(targetSysId, ds, true);
            return b;
        }
        public bool SyncDataVFromConfigXml(int targetSysId, byte[] bData)
        {
            DataSet ds = new DataSet();
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            ms.Write(bData, 0, bData.Length);
            ms.Position = 0;
            ds.ReadXml(ms);
            ms.Close();
            bool b = true;
            b = _CPDataVRep.SyncConfigFromDataSet(targetSysId, ds, false);
            return b;
        }
        #endregion      
    }
}
