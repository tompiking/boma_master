<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人中心</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/recruit/addRecruit.css">
</head>
<body>
	<form action="#">
		<input type="hidden" id="msg" value="${msg }"> <input
			type="hidden" id="getOldPassword" value="${oldPassword }"> <input
			type="hidden" id="getNewPassword" value="${newPassword }">
	</form>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form class="contact_form"
						action="${pageContext.request.contextPath }/admin/updatePassword"
						method="post" name="contact_form">
						<ul>
							<li><h2>修改密码</h2> <span class="required_notification">*
									表示必填项</span></li>
							<li><label for="oldPassword" style="font-size: 20px;">旧密码:</label><input
								id="oldPassword" class="notEmpty" type="password" name="oldPassword"
								placeholder="oldPassword" required /></li>
							<li><label for="password" style="font-size: 20px;">新密码:</label><input
								id="password" class="notEmpty" type="password" name="newPassword"
								placeholder="newPassword" required /></li>
							<li><label for="checkPassword" style="font-size: 20px;">确认新密码:</label><input
								id="checkPassword" class="notEmpty" type="password" name="checkPassword"
								placeholder="checkPassword" required /><span id="checkSpan"></span></li>
							<li><button id="updatePassword" class="submit" type="submit">确认</button>
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