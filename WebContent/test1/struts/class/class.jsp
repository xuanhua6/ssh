
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
						<option value=""></option>
						<option value="浙江" selected="">1班</option>
						<option value="你的工号">2班</option>
						<option value="你最喜欢的老师"></option>
					</select>
				</div>

				<div class="layui-input-inline" style="width: 100px;">
					<select name="town">
						<option value="">请选择市</option>
						<option value="杭州">杭州</option>
						<option value="宁波" disabled="">宁波</option>
						<option value="温州">温州</option>
						<option value="温州">台州</option>
						<option value="温州">绍兴</option>
					</select>
				</div>
				<div class="layui-input-inline" style="width: 100px;">
					<select name="region">
						<option value="">请选择县/区</option>
						<option value="西湖区">西湖区</option>
						<option value="余杭区">余杭区</option>
						<option value="拱墅区">临安市</option>
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
					<th>班级名字</th>
					<th>班级人数</th>
					<th>班主任</th>
					<th>创建时间</th>
					<th>状态</th>
					<th colspan="2">操作</th>
				</tr>
				<c:forEach items="${data }" var="aco">
					<tr>
						<th>${aco.id }</th>
						<th>${aco.usid }</th>
						<th>${aco.truename }</th>
						<th>${aco.sex }</th>
						<th>${aco.sex }</th>
						<th>
							<a href="AccountServlet?action=findAll&id=${aco.id }" style="color: #DD691D;">修改</a>
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