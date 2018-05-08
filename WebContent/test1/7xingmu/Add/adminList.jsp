<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>添加用户</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="<%=basePath%>/musicFront/BeginnerAdmin/plugins/layui/css/layui.css"
	media="all">
</head>

<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 50px;">
		<legend>添加用户</legend>
	</fieldset>
	<div style="display: block; left: 20px; position: absolute;">
		<form class="layui-form layui-form-pane"
			action="../../../AdminServlet?action=add" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="adminname" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux"></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="password" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux"></div>
			</div>
			<div class="layui-form-item">
				<button id="button" class="layui-btn" lay-submit=""
					lay-filter="demo2">跳转式提交</button>
			</div>
		</form>
	</div>
	<script
		src="<%=basePath%>musicFront/BeginnerAdmin/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>musicFront/js/jquery-3.2.1.js"
		type="text/javascript" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		$(function() {
			$("input").eq(0).focus(
					function() {
						if ($(this).val().length == 0) {
							$(this).parent().next("div").text(
									"支持中文，字母，数字，'-'，'_'的多种组合");
						}
					})
			$("input").eq(1).focus(
					function() {
						if ($(this).val().length == 0) {
							$(this).parent().next("div").text(
									"建议使用字母、数字和符号两种以上的组合，6-20个字符");
						}
					})
			//input各种判断
			//用户名：
			$("input")
					.eq(0)
					.blur(
							function() {
								if ($(this).val().length == 0) {
									$(this).parent().next("div")
											.text("账号不能为空！");
									document.getElementById("button").disabled = true;
								} else if ($(this).val().length > 0
										&& $(this).val().length < 4) {
									$(this).parent().next("div").text(
											"长度只能在4-20个字符之间");
									document.getElementById("button").disabled = true;
								} else if ($(this).val().length >= 4
										&& !isNaN($(this).val())) {
									$(this).parent().next("div").text(
											"用户名不能为纯数字");
									document.getElementById("button").disabled = true;
								} else {
									$(this).parent().next("div").text("");
									document.getElementById("button").disabled = false;
								}
							})
			//密码
			$("input")
					.eq(1)
					.blur(
							function() {
								if ($(this).val().length == 0) {
									$(this).parent().next("div")
											.text("密码不能为空！");
									document.getElementById("button").disabled = true;
								} else if ($(this).val().length > 0
										&& $(this).val().length < 6) {
									$(this).parent().next("div").text(
											"长度只能在6-20个字符之间");
									document.getElementById("button").disabled = true;
								} else {
									$(this).parent().next("div").text("");
									document.getElementById("button").disabled = false;
								}

							})
			//	确认密码
			$("input").mouseleave(
			function(e) {
			if ($("input").eq(0).val() != $("input").eq(1).val()) {
						$("input").eq(1).parent().next("div").text("");
							$("button").disabled = false;
						}else{
						$("input").eq(1).parent().next("div").text(
									"账号密码不能相同！");
							$("button").disabled = true;
							}
		})
			$("button").mouseover(
					function(e) {
						if ($("input").eq(0).val() == $("input").eq(1).val()) {
							$("button").disabled = true;
						}else{
							$("button").disabled = false;
							}
					});
		});
	</script>

</body>

</html>