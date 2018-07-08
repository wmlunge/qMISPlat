//点击树节点执行方法
function ConfigDataVNodeClick() {
    var url = CPWebRootPath +"/Plat/Tab/TabView?TabCode=Tab201806170829070012";
    url += "&DataVId=" + $.CPGetQuery("DataVId");
    url += "&StatisticsId=" + CPTreeGlobal_CurSelNodeData.NodeAttrEx;
    CPTreeSetFrameUrl(url);
}
//新增
function ConfigDataVAdd() {
    //console.log(CPTreeGlobal_CurSelNodeData);
    var url = CPWebRootPath + "/Plat/Form/FormView?FormCode=Form201806170810310038&SceneCode=Scene201806170811480040&ViewCode=View201806170811480041&DeviceType=1&InitGroupCode=Group201806170817120037";
    url += "&DataVId=" + $.CPGetQuery("DataVId");
    if (CPTreeGlobal_CurSelNodeData == null) {
        url += "&ParentStatisticsId=-1";
    }
    else {
        url += "&ParentStatisticsId=" + CPTreeGlobal_CurSelNodeData.NodeAttrEx;
    }
    CPTreeSetFrameUrl(url);
}
//打开预览界面
function OpenDataVPreview(DataVId) {
    var url = CPWebRootPath + "/Plat/Form/FormView?FormCode=Form201806252108530042&SceneCode=Scene201806252109120044&ViewCode=View201806252109120045&DeviceType=1&InitGroupCode=Group201806252111500041&DataVId=" + DataVId;
    top.OpenNewModel(url, "预览", 500, 300);
}

//获取表单预览地址
function PreviewDataV() {
    if (CPFormGlobal_FormObj.Data.DataV_Preview.LayoutCode == "") {
        alert("请选择布局！");
        return;
    } 
    var url = CPWebRootPath + "/Plat/DataV/DataVView?DataVCode=" + CPFormGlobal_FormObj.Data.DataV_Preview.DataVCode +
        "&LayoutCode=" + CPFormGlobal_FormObj.Data.DataV_Preview.LayoutCode;
    
    var IsGetUrl = $.CPGetQuery("IsGetUrl");
    if (IsGetUrl != null && IsGetUrl == "true") {
        parent.window.opener.SelectPageUrl_SetReturn(url);
        parent.window.close();
    }
    else {
        window.open(url);
    }
}


//导出配置
function DataVExportConfig() {
    var sSel = CPGridGetSelChkData();
    if (sSel == "") {
        alert("请选择要导出的数据统计！");
        return false;
    }
    var url = CPWebRootPath + "/api/DataVEngine/DownloadDataVConfig?DataVIds=" + sSel + "&CurUserId=" + CPCurUserId + "&CurUserIden=" + CPCurUserIden;
    window.location.href = url;
}
//更新配置
function DataVUpateConfig(sysId) {
    var url = CPWebRootPath + "/Plat/DataV/ManaConfig?IsCreateNew=false&TargetSysId=" + sysId + "&CurUserId=" + CPCurUserId + "&CurUserIden=" + CPCurUserIden;
    OpenNewModel(url, "更新配置", 400, 200);
}
//从配置文件创建新列表
function DataVCreateByConfigFile(sysId) {
    var url = CPWebRootPath + "/Plat/DataV/ManaConfig?IsCreateNew=true&TargetSysId=" + sysId + "&CurUserId=" + CPCurUserId + "&CurUserIden=" + CPCurUserIden;
    OpenNewModel(url, "从配置文件全新创建", 400, 200);
}