<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>指标类管理</title>
<link rel="stylesheet" href="../../plugins/layui/css/layui.css"
	media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 50px;">
		<legend>指标类别管理</legend>
	</fieldset>
	<div class="layui-btn-group demoTable">
		<button style="margin-left: 10px;" class="layui-btn layui-btn-primary" data-type="getCheckData">删除选中行数据</button>
		<button style="margin-left: 10px;" class="layui-btn layui-btn-primary" data-type="getCheckLength">获取选中数目</button>
		<button style="margin-left: 10px;" class="layui-btn layui-btn-primary" data-type="isAll">验证是否全选</button>
		<button style="margin-left: 10px;" class="layui-btn layui-btn-primary" data-type="add">新增</button>
	</div><hr/>
	<table class="layui-table" lay-data="{width:1000, url:'Feenbackscore_find.action',id:'test3'}" lay-filter="test3">
  <thead>
  	 <tr>
   	 	<th lay-data="{align:'center',width: 1000}" rowspan="1" colspan="4">指标类别</th>
   	 </tr>
    <tr>
    	<th lay-data="{type:'numbers'}" rowspan="2" >序号</th>
     	<th lay-data="{field:'feenback_name', width:500}" rowspan="2">指标</th>
     	<th lay-data="{field: 'fb_score', width: 100}" rowspan="2" >分值</th>
      	<th lay-data="{align:'center',width: 200}" colspan="2">老师</th>
    </tr>
    <tr>
      <th lay-data="{field:'score',width: 200, align:'center',edit: 'text'}" colspan="1">课程</th>
    </tr>
  </thead>
  </table>
	<div id="demo"></div>
</body>
<script src="../../plugins/layui/layui.js"></script>
<script>
		layui.use(['form','table','laypage'], function() {
			var table = layui.table,
			layer = layui.layer,
			form = layui.form,
			laypage = layui.laypage;
			//监听单元格编辑
			  table.on('edit(test3)', function(obj){
			    var value = obj.value //得到修改后的值
			    ,data = obj.data //得到所在行所有键值
			    ,field = obj.field; //得到字段
			    console.log(obj);
			    layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
			  });
			
		});
	</script>
</html>