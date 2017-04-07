<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
html, body{
	padding:0;
	margin:0;
	position:relative;
	background:url(../img/body.jpg);
	background-repeat:repeat;
	color:#fff;
	letter-spacing:1px;
	font-family:Georgia, "Times New Roman", Times, serif;
}
</style>
<script type="text/javascript">
	if(top.location == location) {
		top.location.href="/BoMa/admin/loginSuccess";
	}
</script>
</head>
<body>
<div align="left" id="container">
	<table class="zebra">
		<tr>
			<td>编号</td>
			<td>推荐岗位</td>
			<td>被推荐人</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${recommends}" var="recommend">
			<tr>
				<td>${recommend.id }</td>
				<td>${recommend.job.name }</td>
				<td>${recommend.person.name}</td>
				<td><a href="recommendDetail?id=${recommend.id }">显示详细信息</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>