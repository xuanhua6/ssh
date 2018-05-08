
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="utf-8">
		<title>账户信息</title>
		<link rel="stylesheet" href=" ../../plugins/layui/css/layui.css" media="all">
	</head>

	<body>
		<form class="layui-form layui-form-pane" action="../../../AccountServlet?action=add" method="post" enctype="multipart/form-data" style="width: 100%; margin-left: 100px; margin-top: 20px;">
			<div class="layui-form-item">
				<div class="layui-input-inline" style="width: 100px;">
					<select name="province">
						<option value="">请选择查询条件</option>
						<option value="浙江" selected="">班级</option>
						<option value="你的工号">老师</option>
						<option value="你最喜欢的老师">姓名</option>
					</select>
				</div>
				<div class="layui-input-inline">
						<input type="text" name="truename" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
					<input type="submit" value="查询" lay-verify="required" autocomplete="off" class="layui-btn">
			</div>
			
		</form>
		<hr>
		<table class="layui-table">
			<thead>
				<tr class="layui-table1">
					<th>反馈批次</th>
					<th>老师</th>
					<th>班级名</th>
					<th>课程名</th>
					<th>反馈类型</th>
					<th>统计分数</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${data }" var="aco">
					<tr>
						
						<th>${aco.truename }</th>
						<th>${aco.sex }</th>
						<th>${aco.age }</th>
						<th>${aco.birthday }</th>
						<th>${aco.addresses }</th>
						<th>
						</th>
						<th>
							<a href="AccountServlet?action=del&id=${aco.id }" style="color: #DD691D;">删除</a>
						</th>
					</tr>
				</c:forEach>
			</thead>
		</table>
		<div class="layui-table-tool">
			<div class="layui-inline layui-table-page" id="layui-table-page">
				<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-39">
					${pageStr }
					<span class="layui-laypage-limits\">
						<select lay-ignore="">
							<option value="10" selected="">10 条/页</option>
							<option value="20">20 条/页</option>
							<option value="30">30 条/页</option>
							<option value="40">40 条/页</option>
							<option value="50">50 条/页</option>
							<option value="60">60 条/页</option>
							<option value="70">70 条/页</option>
							<option value="80">80 条/页</option>
							<option value="90">90 条/页</option>
						</select>
					</span>
				</div>
			</div>
		</div>
		<script src="../plugins/layui/layui.js"></script>
		<script>
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate;

				//日期
				//创建一个编辑器
				var editIndex = layedit.build('LAY_demo_editor');

				
			});
		</script>
	</body>

</html>