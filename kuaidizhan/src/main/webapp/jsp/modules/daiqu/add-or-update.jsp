<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑待取件表</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">待取件表管理</li>
                        <li class="breadcrumb-item active">编辑待取件表</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">待取件表信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6">
                                        <label></label>
                                        <div>
                                            <select id="yonghuSelect" name="yonghuSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>学号</label>
                                        <input id="studentnumber" name="studentnumber" class="form-control"
                                               placeholder="学号" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>用户名称</label>
                                        <input id="name" name="name" class="form-control"
                                               placeholder="用户名称" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>性别</label>
                                        <input id="sexValue" name="sexValue" class="form-control"
                                               placeholder="性别" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>头像</label>
                                        <img id="imgPhotoImg" src="" width="100" height="100">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>快递站点</label>
                                        <div>
                                            <select id="zhandianSelect" name="zhandianSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>站点地址</label>
                                        <input id="address" name="address" class="form-control"
                                               placeholder="站点地址" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6">
                                        <label>快递名称</label>
                                        <input id="dqname" name="dqname" class="form-control"
                                               placeholder="快递名称">
                                    </div>
                                <input id="zhandianId" name="zhandianId" type="hidden">
                                <input id="yonghuId" name="yonghuId" type="hidden">
                                   <div class="form-group col-md-6">
                                       <label>快递大小</label>
                                       <select id="kddxTypesSelect" name="kddxTypes" class="form-control">
                                       </select>
                                   </div>
                                <div class="form-group col-md-6">
                                    <label>手机号</label>
                                    <input id="dqphone" name="dqphone" class="form-control"
                                           onchange="dqphoneChickValue(this)"  placeholder="手机号">
                                </div>
                                <div class="form-group col-md-12 mb-3">
                                    <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                    <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js">
</script><script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "daiqu";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var kddxTypesOptions = [];
    var kdztTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var yonghuOptions = [];
    var zhandianOptions = [];

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->

    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
           if($("#zhandianId") !=null){
               var zhandianId = $("#zhandianId").val();
               if(zhandianId == null || zhandianId =='' || zhandianId == 'null'){
                   alert("站点不能为空");
                   return;
               }
           }
           if($("#yonghuId") !=null){
               var yonghuId = $("#yonghuId").val();
               if(yonghuId == null || yonghuId =='' || yonghuId == 'null'){
                   alert("用户不能为空");
                   return;
               }
           }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                successMes = '添加成功';
            }
            httpJson("daiqu/" + urlParam, "POST", data, (res) => {
                if(res.code == 0)
                {
                    window.sessionStorage.removeItem('adddaiqu');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function kddxTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=kddx_types", "GET", {}, (res) => {
                if(res.code == 0){
                    kddxTypesOptions = res.data.list;
                }
            });
        }
        function kdztTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=kdzt_types", "GET", {}, (res) => {
                if(res.code == 0){
                    kdztTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function yonghuSelect() {
            //填充下拉框选项
            http("yonghu/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    yonghuOptions = res.data.list;
                }
            });
        }

        function yonghuSelectOne(id) {
            http("yonghu/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                yonghuShowImg();
                yonghuDataBind();
            }
        });
        }
        function zhandianSelect() {
            //填充下拉框选项
            http("zhandian/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    zhandianOptions = res.data.list;
                }
            });
        }

        function zhandianSelectOne(id) {
            http("zhandian/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                ruleForm = res.data;
                zhandianShowImg();
                zhandianDataBind();
            }
        });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationKddxtypesSelect(){
            var kddxTypesSelect = document.getElementById('kddxTypesSelect');
            if(kddxTypesSelect != null && kddxTypesOptions != null  && kddxTypesOptions.length > 0 ){
                for (var i = 0; i < kddxTypesOptions.length; i++) {
                    kddxTypesSelect.add(new Option(kddxTypesOptions[i].indexName,kddxTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationKdzttypesSelect(){
            var kdztTypesSelect = document.getElementById('kdztTypesSelect');
            if(kdztTypesSelect != null && kdztTypesOptions != null  && kdztTypesOptions.length > 0 ){
                for (var i = 0; i < kdztTypesOptions.length; i++) {
                    kdztTypesSelect.add(new Option(kdztTypesOptions[i].indexName,kdztTypesOptions[i].codeIndex));
                }
            }
        }

    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
    <!-- 初始化级联表的下拉框(要根据内容修改) -->
        function initializationyonghuSelect() {
            var yonghuSelect = document.getElementById('yonghuSelect');
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                        yonghuSelect.add(new Option(yonghuOptions[i].name, yonghuOptions[i].id));
                }

                $("#yonghuSelect").change(function(e) {
                        yonghuSelectOne(e.target.value);
                });
            }

        }

        function initializationzhandianSelect() {
            var zhandianSelect = document.getElementById('zhandianSelect');
            if(zhandianSelect != null && zhandianOptions != null  && zhandianOptions.length > 0 ) {
                for (var i = 0; i < zhandianOptions.length; i++) {
                        zhandianSelect.add(new Option(zhandianOptions[i].zdname, zhandianOptions[i].id));
                }

                $("#zhandianSelect").change(function(e) {
                        zhandianSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var kddxTypesSelect = document.getElementById("kddxTypesSelect");
        if(kddxTypesSelect != null && kddxTypesOptions != null  && kddxTypesOptions.length > 0 ) {
            for (var i = 0; i < kddxTypesOptions.length; i++) {
                if (kddxTypesOptions[i].codeIndex == ruleForm.kddxTypes) {//下拉框value对比,如果一致就赋值汉字
                        kddxTypesSelect.options[i].selected = true;
                }
            }
        }

        var kdztTypesSelect = document.getElementById("kdztTypesSelect");
        if(kdztTypesSelect != null && kdztTypesOptions != null  && kdztTypesOptions.length > 0 ) {
            for (var i = 0; i < kdztTypesOptions.length; i++) {
                if (kdztTypesOptions[i].codeIndex == ruleForm.kdztTypes) {//下拉框value对比,如果一致就赋值汉字
                        kdztTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var yonghuSelect = document.getElementById("yonghuSelect");
            if(yonghuSelect != null && yonghuOptions != null  && yonghuOptions.length > 0 ) {
                for (var i = 0; i < yonghuOptions.length; i++) {
                    if (yonghuOptions[i].id == ruleForm.yonghuId) {//下拉框value对比,如果一致就赋值汉字
                        yonghuSelect.options[i+1].selected = true;
                        $("#yonghuSelect" ).selectpicker('refresh');
                    }
                }
            }
            var zhandianSelect = document.getElementById("zhandianSelect");
            if(zhandianSelect != null && zhandianOptions != null  && zhandianOptions.length > 0 ) {
                for (var i = 0; i < zhandianOptions.length; i++) {
                    if (zhandianOptions[i].id == ruleForm.zhandianId) {//下拉框value对比,如果一致就赋值汉字
                        zhandianSelect.options[i+1].selected = true;
                        $("#zhandianSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function dqphoneChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('adddaiqu');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                dqname: "required",
                zhandianId: "required",
                yonghuId: "required",
                kddxTypes: "required",
                dqphone: "required",
                takecode: "required",
                kdztTypes: "required",
                pickupTime: "required",
            },
            messages: {
                dqname: "快递名称不能为空",
                zhandianId: "站点不能为空",
                yonghuId: "用户不能为空",
                kddxTypes: "快递大小不能为空",
                dqphone: "手机号不能为空",
                takecode: "取件码不能为空",
                kdztTypes: "快递状态不能为空",
                pickupTime: "取件时间不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var adddaiqu = window.sessionStorage.getItem("adddaiqu");
        if (adddaiqu != null && adddaiqu != "" && adddaiqu != "null") {
            window.sessionStorage.removeItem('adddaiqu');
            //注册表单验证
            $(validform());
            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("daiqu/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {

    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        yonghuDataBind();
        zhandianDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#dqname").val(ruleForm.dqname);
        $("#zhandianId").val(ruleForm.zhandianId);
        $("#yonghuId").val(ruleForm.yonghuId);
        $("#dqphone").val(ruleForm.dqphone);
        $("#takecode").val(ruleForm.takecode);
        $("#pickupTime-input").val(ruleForm.pickupTime);

    }
    <!--  级联表的数据回显  -->
    function yonghuDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#yonghuId").val(ruleForm.id);

        $("#studentnumber").val(ruleForm.studentnumber);
        $("#name").val(ruleForm.name);
        $("#username").val(ruleForm.username);
        $("#password").val(ruleForm.password);
        $("#sexValue").val(ruleForm.sexValue);
        $("#dqphone").val(ruleForm.phone);
        $("#zhuSuLou").val(ruleForm.zhuSuLou);
        $("#dormitory").val(ruleForm.dormitory);
        $("#role").val(ruleForm.role);
    }

    function zhandianDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#zhandianId").val(ruleForm.id);

        $("#zdname").val(ruleForm.zdname);
        $("#address").val(ruleForm.address);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->

        <!--  级联表的图片  -->
        yonghuShowImg();
        zhandianShowImg();
    }


    <!--  级联表的图片  -->

    function yonghuShowImg() {
        debugger
        $("#imgPhotoImg").attr("src",ruleForm.imgPhoto);
    }


    function zhandianShowImg() {
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            kddxTypesSelect();
            kdztTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            yonghuSelect();
            zhandianSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationKddxtypesSelect();
            initializationKdzttypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationyonghuSelect();
            initializationzhandianSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') != '管理员') {
            $('#jifen').attr('readonly', 'readonly');
            //$('#money').attr('readonly', 'readonly');
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>