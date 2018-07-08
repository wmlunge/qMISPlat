//全局传入参数start 
var CPDataVGlobal_DataVCode = $.CPGetQuery("DataVCode"); if (CPDataVGlobal_DataVCode == null || CPDataVGlobal_DataVCode == undefined) CPDataVGlobal_DataVCode = "";
var CPDataVGlobal_LayoutCode = $.CPGetQuery("LayoutCode"); if (CPDataVGlobal_LayoutCode == null || CPDataVGlobal_LayoutCode == undefined) CPDataVGlobal_LayoutCode = "";

//下级页面时会自动传入
var CPDataVGlobal_StatisticsId = $.CPGetQuery("StatisticsId"); if (CPDataVGlobal_StatisticsId == null || CPDataVGlobal_StatisticsId == undefined) CPDataVGlobal_StatisticsId = "";
var CPDataVGlobal_sWhere = $.CPGetQuery("sWhere"); if (CPDataVGlobal_sWhere == null || CPDataVGlobal_sWhere == undefined) CPDataVGlobal_sWhere = "";
if (CPDataVGlobal_sWhere != "")
    CPDataVGlobal_sWhere = unescape(CPDataVGlobal_sWhere);
//全局传入参数end

//全局变量start 
//全局对象
var CPDataVGlobal_DataVObj = null;


//生成统计图
function SetChartClickEvent(myChart) {

    //添加点击事件（单击），还有其他鼠标事件和键盘事件等等
    myChart.on("click", function (param) {
        console.log(param);
        // alert(param.dataIndex + ':' + option.series[0].data[param.dataIndex].name);
        if (param.data.ClickInfo != null && param.data.ClickInfo != "") {
            if (param.data.LevelOpenType == 1) {
                //内置本页面联动
                LoadChildChart(param);
            }
            else if (param.data.LevelOpenType == 2) {
                //内置弹出页面
                LoadChildChart(param);
            }
            else if (param.data.LevelOpenType == 3) {
                //执行自定义脚本
                eval(param.data.ClickInfo);
            }
        }
    });
}
function CreateChart(curStatistics, containerHTMLId) {
    if (curStatistics.StatisticsType == 1) {
        //饼图start       
        //20,50, 80
        // 27 71 
        var xAxisArray = new Array();
        // xAxisArray = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
        $.each(curStatistics.XDataSourceCol, function (nIndex, nObj) {
            xAxisArray.push(nObj);
        });
        var seriesArray = new Array();
        var oneCenter = 100 / (curStatistics.SeriesCol.length + 1);
        $.each(curStatistics.SeriesCol, function (nSeriesIndex, nSeriesObj) {
            //系列信息 
            var sObj = new Object();
            sObj.name = nSeriesObj.SeriesTitle;
            sObj.type = "pie"; 
            if (curStatistics.SeriesCol.length <= 1) {
                sObj.radius = '80%';
            }
            else if (curStatistics.SeriesCol.length == 2) {
                sObj.radius = '70%';
            }
            else if (curStatistics.SeriesCol.length == 3) {
                sObj.radius = '70%';
            }
            else if (curStatistics.SeriesCol.length > 3) {
                sObj.radius = '65%';
            }
          
            var tmpCenter = oneCenter + oneCenter * nSeriesIndex - 5;
            if (curStatistics.SeriesCol.length <= 1)
                tmpCenter = 50;
            sObj.center = ['' + tmpCenter.toString() + '%', '50%'];
            sObj.data = new Array(); 
            var dataObj = JSON.parse(nSeriesObj.MainDataSourceJson);
            //按X轴顺序添加 
            $.each(xAxisArray, function (xIndex, xObj) {
                $.each(dataObj, function (dIndex, dObj) {
                    if (xObj == dObj[nSeriesObj.XField]) {
                        var tmpValue = Number(dObj[nSeriesObj.YField]);
                      //  sObj.data.push({ value: tmpValue, name: xObj }); 
                        var sObjTmp = new Object();
                        sObjTmp.value = tmpValue;
                        sObjTmp.name = xObj;
                        sObjTmp.ClickInfo = dObj["CPDataVLevelCondition"];
                        sObjTmp.LevelOpenType = nSeriesObj.LevelOpenType;
                        sObjTmp.StatisticsId = curStatistics.Id;
                        sObj.data.push(sObjTmp);
                    }
                });
            }); 
            if (nSeriesObj.IsShowData) {
                sObj.label = {
                    normal: {
                        show: true,
                        position: 'outside'
                    }
                };
            }
            else {
                sObj.label = {
                    normal: {
                        show: false,
                        position: 'outside'
                    }
                };
            }
            seriesArray.push(sObj);
        });

        var containerHeight = $("#" + containerHTMLId).height(); 
        $("#" + containerHTMLId).height(Number(containerHeight) + 30);
        var dom = document.getElementById(containerHTMLId);
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title: {
                text: curStatistics.StatisticsTitle,
                show: curStatistics.IsShowTitle,
                x: 'left',
                left: "20px"
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                x: 'center',
                y: 'bottom',
                height:'20px',
                top: (containerHeight + 10).toString() + "px",
                data: xAxisArray
            },
            toolbox: {
                show: true,
                feature: {
                    mark: { show: true },
                    dataView: { show: true, readOnly: false },
                    magicType: {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore: { show: true },
                    saveAsImage: { show: true }
                }
            },
            calculable: true,
            series: seriesArray
           /* [
                {
                    name: '半径模式',
                    type: 'pie',
                    radius: '70%',
                    center: ['27%', '50%'],

                    data: [
                        { value: 10, name: 'rose1' },
                        { value: 5, name: 'rose2' },
                        { value: 15, name: 'rose3' },
                        { value: 25, name: 'rose4' },
                        { value: 20, name: 'rose5' },
                        { value: 35, name: 'rose6' },
                        { value: 30, name: 'rose7' },
                        { value: 40, name: 'rose8' }
                    ]
                },
                {
                    name: '面积模式',
                    type: 'pie',
                    radius: '70%',
                    center: ['71%', '50%'],

                    data: [
                        { value: 10, name: 'rose1' },
                        { value: 5, name: 'rose2' },
                        { value: 15, name: 'rose3' },
                        { value: 25, name: 'rose4' },
                        { value: 20, name: 'rose5' },
                        { value: 35, name: 'rose6' },
                        { value: 30, name: 'rose7' },
                        { value: 40, name: 'rose8' }
                    ]
                } 
            ]*/
        };

        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        SetChartClickEvent(myChart);

         //饼图end
    }
    else if (curStatistics.StatisticsType == 2) {
        //折线图start
        var xAxisArray = new Array();
       // xAxisArray = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
        $.each(curStatistics.XDataSourceCol, function (nIndex, nObj) {
            xAxisArray.push(nObj);
        });
        var legendArray = new Array();
       // legendArray = ['邮件营销', '联盟广告'];
        var seriesArray = new Array();
        //seriesArray = [
        //    {
        //        name: '邮件营销',
        //        type: 'line',
        //        stack: '总量',
        //        data: [120, 132, 101, 134, 90, 230, 210]
        //    },
        //    {
        //        name: '联盟广告',
        //        type: 'line',
        //        stack: '总量',
        //        data: [220, 182, 191, 234, 290, 330, 310]
        //    }
        //];
        var yAxisArray = new Array();
        $.each(curStatistics.SeriesCol, function (nSeriesIndex, nSeriesObj) {
            //系列信息
            legendArray.push(nSeriesObj.SeriesTitle);
            var sObj = new Object();
            sObj.name = nSeriesObj.SeriesTitle;
            sObj.type = "line";
            sObj.stack = nSeriesObj.YTitle;
            sObj.data = new Array();
            if (curStatistics.StatisticsYType == 2) {
                sObj.yAxisIndex = nSeriesIndex;
            }
            var dataObj = JSON.parse(nSeriesObj.MainDataSourceJson);
            //按X轴顺序添加
            var YMax = 0; 
            $.each(xAxisArray, function (xIndex, xObj) {
                $.each(dataObj, function (dIndex, dObj) {
                    if (xObj == dObj[nSeriesObj.XField]) {
                        var tmpValue = Number(dObj[nSeriesObj.YField]);
                        var sObjTmp = new Object();
                        sObjTmp.value = tmpValue;
                        sObjTmp.ClickInfo = dObj["CPDataVLevelCondition"];
                        sObjTmp.LevelOpenType = nSeriesObj.LevelOpenType;
                        sObjTmp.StatisticsId = curStatistics.Id;
                        sObj.data.push(sObjTmp);
                        if (tmpValue > YMax)
                            YMax = tmpValue; 
                    }
                });
            });
            if (curStatistics.StatisticsYType == 2) {
                var formatter = "{value}";
                if (nSeriesObj.DataPrefix != "")
                    formatter = nSeriesObj.DataPrefix + " " + formatter;
                if (nSeriesObj.DataSuffix != "") {
                    formatter = formatter + " " + nSeriesObj.DataSuffix;
                }
                if (nSeriesIndex == 0) {
                    yAxisArray.push({
                        type: 'value',
                        scale: true,
                        name: nSeriesObj.YTitle,
                        max: YMax, position: 'left',
                        min: 0,
                        axisLabel: {
                            formatter: formatter
                        }
                    });
                }
                else {
                    yAxisArray.push({
                        type: 'value',
                        scale: true,
                        name: nSeriesObj.YTitle,
                        max: YMax, position: 'right', offset: 46 * (nSeriesIndex-1),
                        min: 0,
                        axisLabel: {
                            formatter: formatter
                        }
                    });
                }
            }
            if (nSeriesObj.IsShowData) {
                sObj.label = {
                    normal: {
                        show: true,
                        position: 'top'
                    }
                };
            }
            seriesArray.push(sObj);
        });
          
        var yObj;
        var RightPadding = 0;
        if (curStatistics.StatisticsYType == 2) {
            yObj = yAxisArray;
            if (yAxisArray.length - 2 > 0) {
                RightPadding += (yAxisArray.length - 2) * 46;
            }
            else
                RightPadding = 20;
        }
        else {
            RightPadding = 20;
            yObj = {
                type: 'value'
            };
        }
        var dom = document.getElementById(containerHTMLId);
        var myChart = echarts.init(dom);
        var app = {};
        option = null; 
        option = {
            title: {
                text: curStatistics.StatisticsTitle,
                show: curStatistics.IsShowTitle,
                left:"20px",
                textStyle: {
                    align: 'center'
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross'
                }
            },
            legend: {
                data: legendArray
            },
            grid: {
                left: '20px',
                right: RightPadding.toString() + "px",
                bottom: '20px',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {},
                    //dataZoom: {}
                    magicType: {
                        type: ['line', 'bar',  'tiled']
                    },
                    restore: { show: true }
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: xAxisArray
            },
            yAxis: yObj,            
            series: seriesArray
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }

        SetChartClickEvent(myChart);
         //折线图end
    }
    else if (curStatistics.StatisticsType == 3) {
        //柱状图start
        var xAxisArray = new Array();
        // xAxisArray = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
        $.each(curStatistics.XDataSourceCol, function (nIndex, nObj) {
            xAxisArray.push(nObj);
        });
        var legendArray = new Array();
        // legendArray = ['邮件营销', '联盟广告'];
        var seriesArray = new Array();
        //seriesArray = [
        //    {
        //        name: '邮件营销',
        //        type: 'line',
        //        stack: '总量',
        //        data: [120, 132, 101, 134, 90, 230, 210]
        //    },
        //    {
        //        name: '联盟广告',
        //        type: 'line',
        //        stack: '总量',
        //        data: [220, 182, 191, 234, 290, 330, 310]
        //    }
        //];
        var yAxisArray = new Array();
        $.each(curStatistics.SeriesCol, function (nSeriesIndex, nSeriesObj) {
            //系列信息
            legendArray.push(nSeriesObj.SeriesTitle);
            var sObj = new Object();
            sObj.name = nSeriesObj.SeriesTitle;
            sObj.type = "bar";
            //sObj.stack = nSeriesObj.YTitle;
            sObj.data = new Array();
            if (curStatistics.StatisticsYType == 2) {
                sObj.yAxisIndex = nSeriesIndex;
            }
            var dataObj = JSON.parse(nSeriesObj.MainDataSourceJson);
            //按X轴顺序添加
            var YMax = 0;
            $.each(xAxisArray, function (xIndex, xObj) {
                $.each(dataObj, function (dIndex, dObj) {
                    if (xObj == dObj[nSeriesObj.XField]) {
                        var tmpValue = Number(dObj[nSeriesObj.YField]);
                        var sObjTmp = new Object();
                        sObjTmp.value = tmpValue;
                        sObjTmp.ClickInfo = dObj["CPDataVLevelCondition"];
                        sObjTmp.LevelOpenType = nSeriesObj.LevelOpenType;
                        sObjTmp.StatisticsId = curStatistics.Id;
                        sObj.data.push(sObjTmp);
                        if (tmpValue > YMax)
                            YMax = tmpValue;
                    }
                });
            });
            if (curStatistics.StatisticsYType == 2) {
                var formatter = "{value}";
                if (nSeriesObj.DataPrefix != "")
                    formatter = nSeriesObj.DataPrefix + " " + formatter;
                if (nSeriesObj.DataSuffix != "") {
                    formatter = formatter + " " + nSeriesObj.DataSuffix;
                }
                if (nSeriesIndex == 0) {
                    yAxisArray.push({
                        type: 'value',
                        scale: true,
                        name: nSeriesObj.YTitle,
                        max: YMax, position: 'left',
                        min: 0,
                        axisLabel: {
                            formatter: formatter
                        }
                    });
                }
                else {
                    yAxisArray.push({
                        type: 'value',
                        scale: true,
                        name: nSeriesObj.YTitle,
                        max: YMax, position: 'right', offset: 46 * (nSeriesIndex - 1),
                        min: 0,
                        axisLabel: {
                            formatter: formatter
                        }
                    });
                }
            }
            if (nSeriesObj.IsShowData) {
                sObj.label = {
                    normal: {
                        show: true,
                        position: 'top'
                    }
                };
            }
            seriesArray.push(sObj);
        });

        var yObj;
        var RightPadding = 0;
        if (curStatistics.StatisticsYType == 2) {
            yObj = yAxisArray;
            if (yAxisArray.length - 2 > 0) {
                RightPadding += (yAxisArray.length - 2) * 46;
            }
            else
                RightPadding = 20;
        }
        else {
            RightPadding = 20;
            yObj = {
                type: 'value'
            };
        }
        var dom = document.getElementById(containerHTMLId);
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title: {
                text: curStatistics.StatisticsTitle,
                show: curStatistics.IsShowTitle,
                left: "20px",
                textStyle: {
                    align: 'center'
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross'
                }
            },
            legend: {
                data: legendArray
            },
            grid: {
                left: '20px',
                right: RightPadding.toString() + "px",
                bottom: '20px',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {},
                    //dataZoom: {}
                    magicType: {
                        type: ['line', 'bar']
                    },
                    restore: { show: true }
                }
            },
            xAxis: {
                type: 'category',
              //  boundaryGap: false,
                data: xAxisArray
            },
            yAxis: yObj,
            series: seriesArray
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        //添加点击事件（单击），还有其他鼠标事件和键盘事件等等
        SetChartClickEvent(myChart);
         //柱状图end
    }
}
function LoadChildChart(param) {
    if (param.data.LevelOpenType == 2) {
        //内置弹出页面
        var url = CPWebRootPath + "/Plat/DataV/DataVView?DataVCode=" + CPDataVGlobal_DataVCode + "&LayoutCode=" + CPDataVGlobal_LayoutCode;
        url += "&StatisticsId=" + param.data.StatisticsId + "&sWhere=" + escape(param.data.ClickInfo);
        try {
            top.OpenNewModel(url, param.name, 9000, 9000);
        }
        catch (e) {
            OpenNewModel(url, param.name, 9000, 9000);
        }
        return;

    }


    var getDataUrl = CPWebRootPath + "/api/DataVEngine/GetDataVStatisticsInfo?DataVCode=" + CPDataVGlobal_DataVCode +
        "&StatisticsId=" + param.data.StatisticsId + "&sWhere=" + escape(param.data.ClickInfo) + "&CurUserId=" + CPCurUserId + "&CurUserIden=" + CPCurUserIden;
    //为了表达式，需要把URL里其它字段再加上
    //再加其它参数
    var sResultArray = CPGetQueryString();
    for (var mm = 0; mm < sResultArray.length; mm++) {
        var tempSarray = sResultArray[mm].split('=');
        if (tempSarray[0].toLowerCase() == "datavcode"
            || tempSarray[0].toLowerCase() == "curuserid"
            || tempSarray[0].toLowerCase() == "curuseriden"
            || tempSarray[0].toLowerCase() == "statisticsid"
            || tempSarray[0].toLowerCase() == "swhere"
        )
            continue;
        getDataUrl += "&" + sResultArray[mm];
    }
    $.getJSON(getDataUrl, function (data) {
        if (data.Result == false) {
            alert(data.ErrorMsg);
            return false;
        }
        var sArrayNew = new Array();
        $.each(CPDataVGlobal_DataVObj.StatisticsCol, function (nIndexStatistics, nObjStatistics) {
            var bNew = false; var nobjNew = null;
            $.each(data.DataV.StatisticsCol, function (newIndex, newObj) {
                if (nObjStatistics.Id != newObj.Id) {
                    bNew = true;
                    nobjNew = newObj;
                    return;
                }
            });
            if (bNew == false) {
                sArrayNew.push(nObjStatistics);
            }
            else {
                sArrayNew.push(nobjNew);
            }
        });
        CPDataVGlobal_DataVObj.StatisticsCol = sArrayNew;
        if (param.data.LevelOpenType == 1) {
            //内置本页面联动
            $.each(data.DataV.StatisticsCol, function (nIndex, nObj) {
                CreateChart(nObj, "divStatistics_" + nObj.Id);
            });
        }
         
    });
   
}

$(function () {
    var getDataUrl = CPWebRootPath + "/api/DataVEngine/GetDataVInfo";
    if (CPDataVGlobal_StatisticsId != "") {
        getDataUrl = CPWebRootPath + "/api/DataVEngine/GetDataVStatisticsInfo";
    }
    getDataUrl += "?DataVCode=" + CPDataVGlobal_DataVCode + "&CurUserId=" + CPCurUserId + "&CurUserIden=" + CPCurUserIden;
    if (CPDataVGlobal_StatisticsId != "") {
        getDataUrl += "&StatisticsId=" + CPDataVGlobal_StatisticsId + "&sWhere=" + escape(CPDataVGlobal_sWhere);
    }
    //为了表达式，需要把URL里其它字段再加上
    //再加其它参数
    var sResultArray = CPGetQueryString();
    for (var mm = 0; mm < sResultArray.length; mm++) {
        var tempSarray = sResultArray[mm].split('=');
        if (tempSarray[0].toLowerCase() == "datavcode"
            || tempSarray[0].toLowerCase() == "curuserid"
            || tempSarray[0].toLowerCase() == "curuseriden"
        )
            continue;
        getDataUrl += "&" + sResultArray[mm];
    }
    $.getJSON(getDataUrl, function (data) {
        if (data.Result == false) {
            alert(data.ErrorMsg);
            return false;
        }
        CPDataVGlobal_DataVObj = data.DataV;
        CPDataVGlobal_DataVObj.IsHasSuperAdminRight = data.IsHasSuperAdminRight;
        var curLayoutObj;
        $.each(CPDataVGlobal_DataVObj.LayoutCol, function (nLayoutIndex, nLayoutObj) {
            //读取布局
            if (nLayoutObj.LayoutCode == CPDataVGlobal_LayoutCode) {
                curLayoutObj = nLayoutObj; return;
               
            }
        });
        if (curLayoutObj == null) {
            alert("未找到布局编号为【" + CPDataVGlobal_LayoutCode + "】的配置信息");
            return;
        }
        var tArray = new Array(); tArray.push(curLayoutObj);
        CPDataVGlobal_DataVObj.LayoutCol = tArray;
        if (CPDataVGlobal_StatisticsId != "")
            CPDataVGlobal_DataVObj.LayoutCol[0].LayoutType = 1;
        console.log(CPDataVGlobal_DataVObj);
        var sHTML = "";
        if (CPDataVGlobal_DataVObj.LayoutCol[0].LayoutType == 1) {
            //一行一列式
            $.each(CPDataVGlobal_DataVObj.StatisticsCol, function (nIndexStatistics, nObjStatistics) {
                //看看子级的要不要在页面显示
                var bShow = true;
                if (nObjStatistics.ParentStatisticsId != -1) {
                    var parentStatistics = null;
                    $.each(CPDataVGlobal_DataVObj.StatisticsCol, function (nIndexTmp, nObjTmp) {
                        if (nObjTmp.Id == nObjStatistics.ParentStatisticsId) {
                            parentStatistics = nObjTmp;
                            return;
                        }
                    });
                   
                    if (parentStatistics != null &&　parentStatistics.SeriesCol != null && parentStatistics.SeriesCol.length > 0 && parentStatistics.SeriesCol[0].LevelOpenType != 1) {
                        bShow = false;
                    }
                }
                if (bShow) {
                    sHTML += "<div id='divStatistics_" + nObjStatistics.Id + "' class='OneRowOneCellDivContainer' style='height:" + nObjStatistics.StatisticsHeight + "px;'></div>";
                }
            });
        }
        else if (CPDataVGlobal_DataVObj.LayoutCol[0].LayoutType == 2) {
            //一行两列式，各占50%
            $.each(CPDataVGlobal_DataVObj.StatisticsCol, function (nIndexStatistics, nObjStatistics) {
                //看看子级的要不要在页面显示
                var bShow = true;
                if (nObjStatistics.ParentStatisticsId != -1) {
                    var parentStatistics = null;
                    $.each(CPDataVGlobal_DataVObj.StatisticsCol, function (nIndexTmp, nObjTmp) {
                        if (nObjTmp.Id == nObjStatistics.ParentStatisticsId) {
                            parentStatistics = nObjTmp;
                            return;
                        }
                    });
                    if (parentStatistics != null &&　parentStatistics.SeriesCol != null && parentStatistics.SeriesCol.length > 0 && parentStatistics.SeriesCol[0].LevelOpenType != 1) {
                        bShow = false;
                    }
                }
                if (bShow) {
                    sHTML += "<div id='divStatistics_" + nObjStatistics.Id + "' class='OneRowTwoCellDivContainer' style='height:" + nObjStatistics.StatisticsHeight + "px; width:49.5%;float:left;'></div>";
                }
            });
        }
        else if (CPDataVGlobal_DataVObj.LayoutCol[0].LayoutType == 10) {
            //自定义HTML式
            sHTML = CPDataVGlobal_DataVObj.LayoutCol[0].LayoutHTML;
        }
        $("#divDataVContainer").append(sHTML);
        //循环生成统计图
        $.each(CPDataVGlobal_DataVObj.StatisticsCol, function (nIndexStatistics, nObjStatistics) {
            if (CPDataVGlobal_StatisticsId == "") {
                if (nObjStatistics.ParentStatisticsId == -1) {
                    //默认只生成根
                    if (nObjStatistics.StatisticsType == 1
                        || nObjStatistics.StatisticsType == 2
                        || nObjStatistics.StatisticsType == 3
                    ) {
                        CreateChart(nObjStatistics, "divStatistics_" + nObjStatistics.Id);
                    }
                    else if (nObjStatistics.StatisticsType == 10) {
                        alert("统计表未实现");
                    }
                }
            }
            else {
                if (nObjStatistics.StatisticsType == 1
                    || nObjStatistics.StatisticsType == 2
                    || nObjStatistics.StatisticsType == 3
                ) {
                    CreateChart(nObjStatistics, "divStatistics_" + nObjStatistics.Id);
                }
                else if (nObjStatistics.StatisticsType == 10) {
                    alert("统计表未实现");
                }
            }
        });
        //加载扩展脚本
        if (CPDataVGlobal_DataVObj.JSEx != null && CPDataVGlobal_DataVObj.JSEx != "") {
            // document.write(CPFormGlobal_FormObj.Config.UseSceneCol[0].FormScript)
            $("#divDataVJSContainer").html(CPDataVGlobal_DataVObj.JSEx);
        }
        //内置修改按钮
        if (CPDataVGlobal_StatisticsId == "") {
            if (CPDataVGlobal_DataVObj.IsHasSuperAdminRight) {
                $("#divInnerButton").show();
            }
        }

    });
});
//修改配置
function CPDataVUpdateConfig() {
    var url = CPWebRootPath + "/Plat/Tab/TabView?TabCode=Tab201806170755330011&DataVId=" + CPDataVGlobal_DataVObj.Id;
    try {
        top.OpenNewModel(url, "修改配置", 9000, 9000);
    }
    catch (e) {
        OpenNewModel(url, "修改配置", 9000, 9000);
    }
}