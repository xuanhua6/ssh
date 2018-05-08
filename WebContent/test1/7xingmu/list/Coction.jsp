<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<title>账户信息</title>
		<link rel="stylesheet" href="<%=basePath %>musicFront/BeginnerAdmin/plugins/layui/css/layui.css" media="all">
		<link rel="stylesheet" href="<%=basePath %>musicFront/css/style.css" />
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
							<li>
								<a style="border: 1px solid #FFFFFF; background-color: #FFFFE1; color: #000000;" href="form.jsp">添加</a>
							</li>
						</div>
						<div class="event" id="login_box" style="display: none;">
							<div class="login">
								<div class="title">
									<span class="t_txt">添加</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<table class="layui-table">
				<thead>
					<tr class="layui-table1">
						<th>ID</th>
						<th>uid</th>
						<th>fid</th>
						<th>头像</th>
						<th>类型</th>
						<th>创建时间</th>
						<th>歌单名称</th>
						<th>歌曲数量</th>
						<th>点击人数</th>
						<th>收藏数</th>
						<th colspan="2" style="width: 300px;">操作</th>
					</tr>
					<c:forEach items="${data }" var="con">
						<tr>
							<th>${con.id }</th>
							<th>${con.cname }</th>
							<th>${con.uid }</th>
							<th>${con.foundTime }</th>
							<th>${con.fid }</th>
							<th>${con.type }</th>
							<th><img src="${con.images }" width="40px" height="40px">
							</th>
							<th>
								<a href="CoctionServlet?action=findAll&id=${con.id }" style="color: #DD691D;">修改</a>
							</th>
							<th><a href="CoctionServlet?action=del&id=${con.id }" style="color: #DD691D;">删除</a>
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
		</div>

	</body>

</html>