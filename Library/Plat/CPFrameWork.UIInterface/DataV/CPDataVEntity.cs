using CPFrameWork.Utility.DbOper;
using System;
using System.Collections.Generic;
using System.Text;

namespace CPFrameWork.UIInterface.DataV
{

    /// <summary>
    /// 下拉列表数据源用
    /// </summary>
    public class CPDataVTextValue
    {
        public string Text { get; set; }
        public string Value { get; set; }
    }

    #region CPDataV
    public class CPDataV:BaseEntity
    {
        public CPDataV()
        {
           
        }
        
        public string DataVCode { get; set; } 
        public string DataVTitle { get; set; }
        public int? SysId { get; set; }
        public string FuncTitle { get; set; }
        public bool? IsControlByRight { get; set; }
        public string RoleNames { get; set; }
        public string RoleIds { get; set; }
        public string UserNames { get; set; }
        public string UserIds { get; set; }
        public string DepNames { get; set; }
        public string DepIds { get; set; }
        public string JSEx { get; set; }

        public List<CPDataVStatistics> StatisticsCol { get; set; }

        public List<CPDataVLayout> LayoutCol { get; set; }

        public override void FormatInitValue()
        {
            base.FormatInitValue();
            if (this.IsControlByRight.HasValue == false)
                this.IsControlByRight = false;
        }
    }
    #endregion

    #region CPDataVChart
    public class CPDataVStatistics : BaseOrderEntity
    { 
        public int DataVId { get; set; }
        public int ParentStatisticsId { get; set; }
        public CPDataVEnum.StatisticsTypeEnum StatisticsType { get; set; }
        public string XDataSourceInstance { get; set; }
        public string XDataSource { get; set; }
        /// <summary>
        /// 用来存储X轴的数据源，key为真正值值 ,value为显示值
        /// </summary>
        public List<string > XDataSourceCol { get; set; }
        public string StatisticsTitle { get; set; }

        public CPDataVEnum.StatisticsYTypeEnum StatisticsYType { get; set; }
        public bool? IsShowTitle { get; set; }
        public int? StatisticsHeight { get; set; }

        [Newtonsoft.Json.JsonIgnore]//webapi时，json序列化时不返回客户端
        public CPDataV DataV { get; set; }

        public List<CPDataVChartSeries> SeriesCol { get; set; }

        public List<CPDataVChartSearch> SearchCol { get; set; }
        public override void FormatInitValue()
        {
            base.FormatInitValue();
            if (this.IsShowTitle.HasValue == false)
                this.IsShowTitle = true;
            if (this.StatisticsHeight.HasValue == false)
                this.StatisticsHeight = 300;
        }

    }
    #endregion

    #region CPDataVChartSeries
    public class CPDataVChartSeries : BaseEntity
    { 
        public int StatisticsId { get; set; }
        public int DataVId { get; set; }
        public string SeriesTitle { get; set; } 
        public CPDataVEnum.DataSourceTypeEnum? MainDataSourceType { get; set; }
        public string MainDataSourceInstance { get; set; }
        public string MainDataSource { get; set; }
        /// <summary>
        /// 存储主数据源真实的数据
        /// </summary>
        public string MainDataSourceJson { get; set; }
        public string XField { get; set; }
        public string YTitle { get; set; }
        public string YField { get; set; }
        public bool? IsShowData { get; set; }

        public CPDataVEnum.LevelOpenTypeEnum LevelOpenType { get; set; }
        public string LevelCondition { get; set; }
        public string YSumPointNum { get; set; }
        public string DataPrefix { get; set; }
        public string DataSuffix { get; set; }

        [Newtonsoft.Json.JsonIgnore]//webapi时，json序列化时不返回客户端
        public CPDataVStatistics Statistics { get; set; }

        public override void FormatInitValue()
        {
            base.FormatInitValue();
            if (this.IsShowData.HasValue == false)
                this.IsShowData = true; 
            if (this.MainDataSourceType.HasValue == false)
                this.MainDataSourceType = CPDataVEnum.DataSourceTypeEnum.Sql;
        }
    }
    #endregion

    #region CPDataVChartSearch
    public class CPDataVChartSearch : BaseOrderEntity
    { 
        public int StatisticsId { get; set; }
        public int DataVId { get; set; }
        public string SearchTitle { get; set; }
        public string FieldName { get; set; }
        public CPDataVEnum.SearchShowTypeEnum? SearchShowType { get; set; }
        public string FieldEnumDataIns { get; set; }
        public string FieldEnumDataSource { get; set; }

        /// <summary>
        /// 用来存储X轴的数据源，key为真正值值 ,value为显示值
        /// </summary>
        public List<CPDataVTextValue> FieldEnumDataSourceCol { get; set; }
        public string DefaultValue { get; set; }
        [Newtonsoft.Json.JsonIgnore]//webapi时，json序列化时不返回客户端
        public CPDataVStatistics Statistics { get; set; }
        public override void FormatInitValue()
        {
            base.FormatInitValue();
            if (this.SearchShowType.HasValue == false)
                this.SearchShowType = CPDataVEnum.SearchShowTypeEnum.Textbox;
        }
    }
    #endregion

    #region
    public class CPDataVLayout : BaseEntity
    { 
        public int DataVId { get; set; }
        public string LayoutTitle { get; set; }
        public string LayoutCode { get; set; }
        public CPDataVEnum.LayoutTypeEnum LayoutType { get; set; }
        public string LayoutHTML { get; set; }
        [Newtonsoft.Json.JsonIgnore]//webapi时，json序列化时不返回客户端
        public CPDataV DataV { get; set; }
    }
    #endregion
}
