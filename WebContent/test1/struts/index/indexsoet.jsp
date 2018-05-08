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
	<div class="layui-btn-group demoTable">
		<button class="layui-btn" data-type="getCheckData">删除选中行数据</button>
		<button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
		<button class="layui-btn" data-type="isAll">验证是否全选</button>
	</div>
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

		layui.use(['table','laypage'], function() {
			var table = layui.table,
			laypage = layui.laypage;
			table.render({
    			elem: '#test'
    			,url:'Feenback_find.action'
    			,width:900
    			,cellMinWidth:20
    			,cols: [[
					{type:'checkbox', fixed: 'left'}
	     			,{field:'feenback_id' ,width:80, title: '序号', sort: true}
	     			,{field:'feenback_name' , title: '用户名'}
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
					getCheckLength: function() { //获取选中数目
						var checkStatus = table.checkStatus('test'),
							data = checkStatus.data;
							$.ajax({url:"",async:true,success:function(result){
								layer.msg('选中了：' + data.length + ' 个');
							}});
					},
					isAll: function() { //验证是否全选
						var checkStatus = table.checkStatus('test');
						layer.msg(checkStatus.isAll ? '全选' : '未全选')
					}
				};

			$('.demoTable .layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});
			var count= function(){
				var c = "${count }";
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
		});
	</script>
</html>