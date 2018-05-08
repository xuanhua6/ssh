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
<title>添加歌手</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="<%=basePath %>/musicFront/BeginnerAdmin/plugins/layui/css/layui.css" media="all">
	
</head>

<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 50px;">
		<legend>添加歌手</legend>
	</fieldset>
	<div style="display: block; left: 20px; position: absolute;">
		<form class="layui-form layui-form-pane"
			action="../../../SingerServlet?action=add" method="post"
			enctype="multipart/form-data">
			<div class="layui-form-item">
				<label class="layui-form-label">歌手名</label>
				<div class="layui-input-inline">
					<input type="text" name="truename" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">

				</div>
				<div class="layui-form-mid layui-word-aux">请务必填写真实名字</div>
			</div>


			<div class="layui-form-item" pane="">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="男" title="男" checked="checked">
						<input type="radio" name="sex" value="女" title="女"> 
						<input type="radio" name="sex" value="禁" title="禁用" disabled="">
					</div>
				</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">出生日期</label>
					<div class="layui-input-block">
						<input type="text" name="birthday" id="date1" autocomplete="off"
							class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">头像</label>
					<div class="layui-input-block">
						<div class="layui-layedit">
							<div class="layui-unselect layui-layedit-tool">
								<i class="layui-icon layedit-tool-image" title="图片"
									layedit-event="image"> <input type="file" name="images">
								</i>
							</div>
						</div>
					</div>
				</div>
			</div>
				<div class="layui-form-item">
					<label class="layui-form-label">地址</label>
					<div class="layui-input-inline">
						<select name="area">
						<option value="${sig.area }">${sig.area }</option>
							<option value="">请选择省</option>
							<option value="浙江" selected="">浙江省</option>
							<option value="你的工号">江西省</option>
							<option value="你最喜欢的老师">福建省</option>
						</select>
					</div>
					</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属国籍</label>
					<div class="layui-input-inline">
						<select name="nationality">
						<option value="${sig.nationality }">${sig.nationality }</option>
							<option value="">请选择国家</option>
							<option value="中国" selected="selected">中国</option>
							<option value="欧美">欧美</option>
							<option value="韩国">韩国</option>
							<option value="日本">日本</option>
							<option value="其他">其他</option>
						</select>
					</div>
				</div>
			<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">出道日期</label>
							<div class="layui-input-block">
							<input type="text" name="ctime" id="date1" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">简介</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入内容" class="layui-textarea" name="recommended"></textarea>
					</div>
				</div>
				
				<div class="layui-form-item">
					<button class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
				</div>
			</form>
		</div>
		<script src="<%=basePath %>/musicFront/BeginnerAdmin/plugins/layui/layui.js"></script>
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
				function getCookie(name) {
					var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
					if(arr = document.cookie.match(reg))
						return unescape(arr[2]);
					else
						return null;
				}
				var s1 = getCookie("msg");
				if(s1 == null) {
						s = "添加失败";
						return s;
				} else {
					s=s1;
					return s;
				}
				var s ="asd";
				console.log(data);
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