<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link rel="stylesheet"
	href="../../plugins/layui/css/layui.css"
	media="all">
</head>

<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 50px;">
		<legend>修改指标类别</legend>
	</fieldset>
	<div style="display: block; left: 20px; position: absolute;">
		<form class="layui-form layui-form-pane" action="Feenback_update.action" method="post">
		<input type="hidden" name ="feenback.feenback_id" value="${feenback.feenback_id }"/>
			<div class="layui-form-item">
				<label class="layui-form-label">指标类别</label>
				<div class="layui-input-inline">
					<input type="text" name="feenback.feenback_name" lay-verify="required" value="${feenback.feenback_name }" placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">请输入指标类别</div>
			</div>
		
			<div class="layui-form-item">
				<button id="but" class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
			</div>
		</form>
	</div>
	<script
		src="../../plugins/layui/layui.js"></script>
		<script src="../../plugins/layui/lay/modules/jquery-3.2.1.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate;

				

				//创建一个编辑器
				var editIndex = layedit.build('LAY_demo_editor');

				//自定义验证规则
				form.verify({
					title: function(value) {
						if(value.length < 5) {
							return '标题至少得5个字符啊';
						}
					},
					pass: [/(.+){6,12}$/, '密码必须6到12位'],
					content: function(value) {
						layedit.sync(editIndex);
					}
				});


				//监听提交
				function getCookie(name) {
					var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
					if(arr = document.cookie.match(reg))
						return unescape(arr[2]);
					else
						return null;
				}
				form.on('submit(demo2)', function(data) {
					$.ajax({
						url:"Feenback_update.action"
						,data: data.field
						,async:true
						,success:function(result){
							layer.open({
								title: '添加指标类别'
								,content: '成功！'
								,yes: function(){
									//do something
									var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
									parent.layer.close(index); //再执行关闭
								}
							})
						}
					})
					return false;
				});

			});
		</script>

</body>

</html>