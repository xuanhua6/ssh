

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<title>查看课程</title>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="../../../css/style.css"/>
	</head>

	<body>
		<div class="header">
			<div class="search_wrapper">
				<div class="search_input">
					<input type="text">
					<div class="searh_btn">
						<a href="">搜索</a>
					</div>
				</div>
			</div>
			<div class="topNav fr">
				<div class="login_area">
					<div id="login_in" class="clearfix">
						<div class="nav">
								<a style="border: 1px solid #FFFFFF; background-color: #FFFFE1; color: #000000;" href="../Add/userList.jsp" >添加</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
			<table class="layui-table">
				<thead>
					<tr class="layui-table1">
						<th>老师</th>
						<th>课程名</th>
						<th>课时</th>
						<th>状态</th>
						
						
						
						<th colspan="2">操作</th>
					</tr>
					<c:forEach items="${data }" var="aco">
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							
							
							<th><a href="AccountServlet?action=findAll&id=${aco.id }" style="color: #DD691D;">修改</a>
							</th>
							<th><a href="AccountServlet?action=del&id=${aco.id }" style="color: #DD691D;">删除</a>
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
	</body>
</html>