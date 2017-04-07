<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加管理员</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/recruit/addRecruit.css">
</head>
<body>
	<form action="#">
		<input type="hidden" id="msg" value="${msg }"/>
		<input type="hidden" id="getName" value="${name }"/>
		<input type="hidden" id="getUsername" value="${username }"/>
		<input type="hidden" id="getPassword" value="${password }"/>
	</form>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form class="contact_form"
						action="${pageContext.request.contextPath }/admin/addAdmin"
						method="post" name="contact_form">
						<ul>
							<li><h2>新增管理员</h2> <span class="required_notification">*
									表示必填项</span></li>
							<li><label for="name" style="font-size: 20px;">管理员名称：</label><input
								id="name" class="notEmpty" type="text" name="name"
								placeholder="name" required /></li>
							<li><label for="username" style="font-size: 20px;">用户名:</label><input
								id="username" class="notEmpty" type="text" name="username"
								placeholder="username" required /></li>
							<li><label for="password" style="font-size: 20px;">密码:</label><input
								id="password" class="notEmpty" type="password" name="password"
								placeholder="password" required /></li>
							<li><label for="checkPassword" style="font-size: 20px;">确认密码:</label><input
								id="checkPassword" class="notEmpty" type="password" name="checkPassword"
								placeholder="checkPassword" required /><span id="checkSpan"></span></li>
							<li><button id="addAdmin" class="submit" type="submit">添加</button>
								<button class="submit" type="reset">重置</button></li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin_js.js"></script>
</html>