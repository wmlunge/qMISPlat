using System;
using System.Collections.Generic;
using System.Text;

namespace CPFrameWork.UIInterface.DataV
{
   public  class CPDataVEnum
    {
     
        public enum DataSourceTypeEnum
        {
            Sql = 1,
            ExtendClass = 2
        }
        public enum SearchShowTypeEnum
        {
            Textbox = 1,
            TimeSelect = 2,
            DropDownList = 3
        }

        public enum LayoutTypeEnum
        {
            OneRowOneColumn = 1,
            CustomHTML = 10
        }

        public enum LevelOpenTypeEnum
        {
            SelfPage = 1,
            OpenPage = 2,
            CustomJS = 3
        }
       public enum StatisticsTypeEnum
        {

            PieChart = 1,
            LineChart = 2,
            ColumnChart = 3,
            List = 10
        }

        public enum StatisticsYTypeEnum
        {
            OneY = 1,
            MultiY = 2
        }
    }
}
