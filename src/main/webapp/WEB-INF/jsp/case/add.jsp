<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>增加负责人</title>
<style>
.contact_form {
	padding-top: 40px;
}
</style>
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select/jquery-ui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select/select.css">
</head>
<body>
	<form class="contact_form">
		<span style="color: gray; font-size: 30px">添加成功案例</span>
		<hr>
		<table width="100%" style="border-spacing: 10px;">
			<tr>
				<td><span style="color: gray; font-size: 20px">请选择行业：</span></td>
				<td><select id="select1">
						<option value="0">请选择</option>
						<c:forEach items="${trades }" var="trade">
							<option value=${trade.id }>${trade.name }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><span style="color: gray; font-size: 20px">请选择岗位：</span></td>
				<td><select id="selectjob">
						<option value="0">请选择</option>
				</select></td>
				<td style="text-align: right">
					<button id="jbtn" class="submit" type="button">提交</button>
				</td>
			</tr>
			<tr>
				<td><span style="color: gray; font-size: 20px">请选择公司：</span></td>
				<td><select id="selectcompany">
						<option value="0">请选择</option>
				</select></td>
				<td style="text-align: right">
					<button id="cbtn" class="submit" type="button">提交</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Case_ajax.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Case_js.js"></script>
<script
	src="${pageContext.request.contextPath}/js/select/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/select/select3.js"></script>
<script src="${pageContext.request.contextPath}/js/select/select4.js"></script>
<script src="${pageContext.request.contextPath}/js/select/select5.js"></script>
</html>