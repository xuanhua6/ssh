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
<title>添加歌曲</title>
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
		<legend>添加歌曲</legend>
	</fieldset>
	<div style="display: block; left: 20px; position: absolute;">
		<form class="layui-form layui-form-pane"
			action="../../../MusicServlet?action=add" method="post"
			enctype="multipart/form-data">
			<div class="layui-form-item">
				<label class="layui-form-label">专辑名</label>
				<div class="layui-input-inline">
					<input type="text" name="specialName" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">

				</div>
				<div class="layui-form-mid layui-word-aux">请务必填写真实名字</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">歌曲名</label>
				<div class="layui-input-inline">
					<input type="text" name="musicname" lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">

				</div>
				<div class="layui-form-mid layui-word-aux">请填写正确歌曲名</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">上传歌词</label>
				<div class="layui-input-inline">
					<i class="layui-icon " layedit-event=""> <input type="file"
						name="images"> </i>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">创作时间</label>
						<div class="layui-input-block">
							<input type="text" name="greatetime" id="date1"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">语种</label>
					<div class="layui-input-inline">
						<div class="layui-input-inline">
							<select name="language">
								<option value="">请选择语言</option>
								<option value="汉语" selected="selected">汉语</option>
								<option value="英语">英语</option>
								<option value="日语">日语</option>
								<option value="俄语">俄语</option>
								<option value="其他">其他</option>
							</select>
						</div>
					</div>
				</div>
				<div>
					<label class="layui-form-label">风格</label> <input type="checkbox"
						name="style" value="古典"> 古典 <input type="checkbox"
						name="style" value="摇滚"> 摇滚 <input type="checkbox"
						name="style" value="轻柔"> 轻柔 <input type="checkbox"
						name="style" value="流行"> 流行 <input type="checkbox"
						name="style" value="嘻哈"> 嘻哈 <input type="checkbox"
						name="style" value="爵士"> 爵士 <input type="checkbox"
						name="style" value="乡村"> 乡村<br>
				</div>
				<br>
				<div>
					<label class="layui-input-inline">情感</label> <select name="emotion">
						<option value="">请选择情感</option>
						<option value="怀旧" selected="">怀旧</option>
						<option value="清新">清新</option>
						<option value="浪漫">浪漫</option>
						<option value="性感">性感</option>
						<option value="治愈">治愈</option>
						<option value="伤感">伤感</option>
						<option value="放松">放松</option>
						<option value="孤独">孤独</option>
						<option value="感动">感动</option>
						<option value="兴奋">兴奋</option>
						<option value="快乐">快乐</option>
						<option value="安静">安静</option>
						<option value="思念">思念</option>

					</select>

				</div>
				<br>
				<div>
					<label class="layui-input-inline">场景</label> <select name="scene">
						<option value="场景">请选择场景</option>
						<option value="清晨" selected="">清晨</option>
						<option value="夜晚">夜晚</option>
						<option value="学习">学习</option>
						<option value="工作">工作</option>
						<option value="午休">午休</option>
						<option value="下午茶">下午茶</option>
						<option value="地铁">地铁</option>
						<option value="驾车">驾车</option>
						<option value="运动">运动</option>
						<option value="旅行">旅行</option>
						<option value="散步">散步</option>
						<option value="酒吧">酒吧</option>
					</select>
				</div>
				<!-- <div class="layui-form-item">
					<label class="layui-form-label">点击量</label>
					<div class="layui-input-inline">
						<input type="text" name="username" lay-verify="required"  autocomplete="off" class="layui-input">

					</div>
				</div> -->
				<div class="layui-form-item">
					<label class="layui-form-label">上传歌曲</label>
					<div class="layui-input-inline">
						<i class="layui-icon " layedit-event=""> <input type="file"
							name="AccountImages"> </i>
					</div>
				</div>

			</div>
			<div class="layui-form-item">
				<button class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
			</div>
		</form>
	</div>
	<script
		src="<%=basePath%>/musicFront/BeginnerAdmin/plugins/layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui
				.use(
						[ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

							//日期
							laydate.render({
								elem : '#date'
							});
							laydate.render({
								elem : '#date1'
							});

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');

							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 5) {
										return '标题至少得5个字符啊';
									}
								},
								pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

							//监听指定开关
							form.on('switch(switchTest)', function(data) {
								layer.msg('开关checked：'
										+ (this.checked ? 'true' : 'false'), {
									offset : '6px'
								});
								layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
										data.othis)
							});

							//监听提交
							form.on('submit(demo2)', function(data) {
								layer.alert(JSON.stringify(s), {
									title : '最终的提交信息'
								})
								return false;
							});

						});
	</script>

</body>

</html>