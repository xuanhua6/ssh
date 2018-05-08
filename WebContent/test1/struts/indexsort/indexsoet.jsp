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
	<table class="layui-hide" id="test" lay-filter="test1"></table>
	<div id="demo"></div>
	<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
			<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
</body>
<script src="../../plugins/layui/layui.js"></script>
<script>
var limit1 = 10;  
var curr1 = 1;  
//列表查询方法  
function productsearch(curr,limit) { 
		layui.use(['form','table','laypage'], function() {
			var table = layui.table,
			layer = layui.layer,
			form = layui.form,
			laypage = layui.laypage;
			table.render({
    			elem: '#test'
    			,url:'Feenback_find.action?page1='+curr+'&limit1='+limit
    			,width:900
    			,cellMinWidth:20
    			,cols: [[
					{type:'checkbox', fixed: 'left'}
	     			,{type:'numbers', title: '序号'}
	     			,{field:'feenback_id' ,width:108, title: '编号'}
	     			,{field:'feenback_name' , title: '指标类别'}
	     			,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}
				 ]]
				,response: {
					statusName: 'code' //数据状态的字段名称，默认：code
					,statusCode: 0 //成功的状态码，默认：0
					,msgName: 'msg' //状态信息的字段名称，默认：msg
					,countName: 'count' //数据总数的字段名称，默认：count
					,dataName: 'data' //数据列表的字段名称，默认：data
				}
				,done: function(obj, curr, count){ 
					laypage.render({
						 elem: 'demo'
						,count: count //数据总数，从服务端得到
						,curr: curr1
					    ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']			
					    ,jump: function(obj,first){
					    	 if(!first){
						          //do something
						        	curr1 = obj.curr;
								    limit1 = obj.limit;
								   productsearch(curr1,limit1);
						        }
					  
					    }
					});
				}
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
							obj.del();
							layer.close(index);
							productsearch(curr1,limit1);
						}});
						
					});
				} else if(obj.event === 'edit') {
					layer.open({
						type:2
						,title: '添加指标类别'
						,content: 'Feenback_findbyid.action?feenback.feenback_id='+data.feenback_id
						,area: ['800px', '400px']
						,resize: true
						,end: function(){
							 productsearch(curr1,limit1);
						}
					})
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
									obj.del();
									layer.close(index);
								}});
							}
							window.location.reload();
						});
					
					},
					getCheckLength: function() { //获取选中数目
						var checkStatus = table.checkStatus('test'),
							data = checkStatus.data;
							layer.msg('选中了：' + data.length + ' 个');
					},
					isAll: function() { //验证是否全选
						var checkStatus = table.checkStatus('test');
						layer.msg(checkStatus.isAll ? '全选' : '未全选')
					},
					add: function(){
						layer.open({
							type:2
							,title: '添加指标类别'
							,content: 'http://ww:8090/ssh/test1/struts/indexsort/addindexsort.jsp'
							,area: ['800px', '400px']
							,resize: true
							,end: function(){
								window.location.reload();
							}
						})
					}
				};

			$('.demoTable .layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});
		});}
productsearch(curr1,limit1); 
	</script>
</html>