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
		<title>添加指标项</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all">
	</head>

	<body>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
			<legend>添加指标项
		<div style="display: block; left: 20px; position: absolute;">
			<form class="layui-form layui-form-pane" action="Feenbackitem_save.action" method="post" >
				<input type="hidden" name="3" value="300"/>
				<div class="layui-form-item">
					<label class="layui-form-label">指标项</label>
					<div class="layui-input-inline">
						<input type="text" name="feenback_item.fb_name" lay-verify="fb_name" placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">分值</label>
					<div class="layui-input-inline">
						<input type="text" name="feenback_item.fb_score" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<button id="but" class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
				</div>
			</form>
		</div>
		<script src="../../plugins/layui/layui.js"></script>
		<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
		<script>
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate;

				//日期
				laydate.render({
					elem: '#date'
				});
				laydate.render({
					elem: '#date1'
				});

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

				//监听指定开关
				form.on('switch(switchTest)', function(data) {
					layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
						offset: '6px'
					});
					layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
				});

				//监听提交
				
				form.on('submit(demo2)', function(msg) {
					layer.alert(JSON.stringify(s), {
						title: '最终的提交信息'
					})
					return false;
				});

			});
		</script>

	</body>

</html>