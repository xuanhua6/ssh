<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>指标类别</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../plugins/layui/css/layui.css"
	media="all">
</head>

<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 50px;">
		<legend>指标类别</legend>
	</fieldset>
	<div style="display: block; left: 20px; position: absolute;">
		<form class="layui-form layui-form-pane" action="Feenback_save.action"
			method="get">
			<div class="layui-form-item">
				<label class="layui-form-label">指标类别</label>
				<div class="layui-input-inline">
					<input type="text" name="feenback.feenback_name"
						lay-verify="feenback_name" placeholder="请输入" autocomplete="off"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">请填写指标类别</div>
			</div>
			<br />
			<div class="layui-btn-group demoTable">
				<button class="layui-btn layui-btn-primary" data-type="getCheckData">删除选中行数据</button>
				<button class="layui-btn layui-btn-primary" data-type="isAll">验证是否全选</button>
				<button class="layui-btn layui-btn-primary" data-type="add">新增</button>
			</div>
			<hr />
			<table class="layui-hide" id="test" lay-filter="test1"></table>
			<div id="demo"></div>
			<script type="text/html" id="barDemo">
				<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
				<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="edit">编辑</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			</script><br>
			<script type="text/html" id="switchTpl">
  				<input type="checkbox" name="fid" value="{{d.fb_id}}" lay-skin="primary" lay-filter="sexDemo">
			</script>
			<div class="layui-form-item">
				<button id="but" class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
			</div>
		</form>
	</div>
	<script src="../../plugins/layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use([ 'form', 'table', 'laypage' ],function() {
							var form = layui.form, layer = layui.layer;
							//自定义验证规则
							form.verify({
								feenback_name : function(value, item) { //value：表单的值、item：表单的DOM对象
									if (null == value) {
										return '请填写相关内容';
									}
									if (!new RegExp(
											"^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$")
											.test(value)) {
										return '不能有特殊字符';
									}
									if (/(^\_)|(\__)|(\_+$)/.test(value)) {
										return '首尾不能出现下划线\'_\'';
									}
									if (/^\d+\d+\d$/.test(value)) {
										return '不能全为数字';
									}

								}
							});
							//监听提交
							var table = layui.table,
							laypage = layui.laypage;
							table.render({
				    			elem: '#test'
				    			,url:'Feenbackitem_find.action'
				    			,width:900
				    			,cellMinWidth:20
				    			,cols: [[
				    			     {type:'numbers'}  
									,{field:'feenback.feenback',title: '选择', templet: '#switchTpl', unresize: true}
					     			,{field:'fb_name' , title: '指标项内容'}
					     			,{field:'fb_score' , title: '分值'}
					     			,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}
								 ]]
								,request: {
									pageName: 'page' //页码的参数名称，默认：page
									,limitName: 'limit' //每页数据量的参数名，默认：limit
								}
								,response: {
									statusName: 'code' //数据状态的字段名称，默认：code
									,statusCode: 0 //成功的状态码，默认：0
									,msgName: 'msg' //状态信息的字段名称，默认：msg
									,countName: 'count' //数据总数的字段名称，默认：count
									,dataName: 'data' //数据列表的字段名称，默认：data
								}
							});
							form.on('checkbox(sexDemo)', function(data) {
							console.log(data);
							console.log(data.elem); //得到checkbox原始DOM对象
							  console.log(data.elem.checked); //是否被选中，true或者false
							  console.log(data.value); //复选框value值，也可以通过data.elem.value得到
							  console.log(data.othis); //得到美化后的DOM对象
							});
							//监听表格复选框选择
							table.on('checkbox(test1)', function(obj) {
								//console.log(obj)
							});
							//监听工具条
							table.on('tool(test1)', function(obj) {
								var data = obj.data;
								if(obj.event === 'detail') {
									console.log(obj);
									layer.msg('ID：' + data.id + ' 的查看操作');
								} else if(obj.event === 'del') {
									layer.confirm('真的删除行么', function(index) {
										$.ajax({url:"Feenback_delete.action?feenback.feenback_id="+obj.data.feenback_id,async:true,success:function(result){
										}});
										obj.del();
										layer.close(index);
									});
								} else if(obj.event === 'edit') {
									layer.alert('编辑行：<br>' + JSON.stringify(data))
								}
							});

							var $ = layui.$,
								active = {
									getCheckData: function() { //删除选中数据
										var checkStatus = table.checkStatus('test'),
											data = checkStatus.data;
										layer.confirm('真的删除行么', function(index) {
											for(var i=0;i<data.length;i++){
												$.ajax({url:"Feenback_delete.action?feenback.feenback_id="+data[i].feenback_id,async:true,success:function(result){
												}});
											}
											window.location.reload();
										});
									
									},
									isAll: function() { //验证是否全选
										var checkStatus = table.checkStatus('test');
										layer.msg(checkStatus.isAll ? '全选' : '未全选')
									},
									add: function(){
										$(location).attr('href', 'addindexsort.jsp');  
									}
								};

							$('.demoTable .layui-btn').on('click', function() {
								var type = $(this).data('type');
								active[type] ? active[type].call(this) : '';
							});
							var count= function(){
								var c = "${count1 }";
								if(c>0){
									return c;
								}else{
									return 10;
								}
							}; 
							laypage.render({
								 elem: 'demo'
								,count: count() //数据总数，从服务端得到
							    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']			
							    ,jump: function(obj,first){
							    	//obj包含了当前分页的所有参数，比如：
							        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
							        console.log(obj.limit); //得到每页显示的条数
							        
							        //首次不执行
							        if(!first){
							          //do something
							        }
							    }
							});
							form.on('submit(demo2)', function(data) {
								return true;
							});

						});
	</script>

</body>

</html>