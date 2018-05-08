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
		<form class="layui-form layui-form-pane" action="Feenback_save.action" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">指标类别</label>
				<div class="layui-input-inline">
					<input type="text" name="feenback.feenback_name"
						lay-verify="feenback_name" placeholder="请输入" autocomplete="off"
						class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">请填写指标类别</div>
			</div><br/>
			<div class="layui-form-item">
				<button id="but" class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
			</div>
		</form>
	</div>
	<script src="../../plugins/layui/layui.js"></script>
	
	<script src="../../plugins/layui/lay/modules/jquery-3.2.1.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use([ 'form','table','laypage' ], function() {
			var table = layui.table,
				layer = layui.layer,
				form = layui.form,
				laypage = layui.laypage;
			//自定义验证规则
			form.verify({
				feenback_name : function(value, item) { //value：表单的值、item：表单的DOM对象
					if (null==value) {
						return '请填写相关内容';
					}
					if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$")
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
			
			form.on('submit(demo2)', function(data) {
				console.log(data);
				$.ajax({
					url:"Feenback_save.action"
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