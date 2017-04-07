<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>增加行业</title>
<style>
.contact_form {
	padding-top: 40px;
}
</style>
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	if (top.location == location) {
		top.location.href = "/BoMa/admin/loginSuccess";
	}
</script>
</head>
<body>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form class="contact_form"
						action="${pageContext.request.contextPath }/trade/addTradeSubmit"
						method="post" name="contact_form">
						<ul>
							<li>
								<h2>增加行业&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #d45252;">${not empty msg?msg:"" }</span></h2> <span
								class="required_notification">* 表示必填项</span>
							</li>
							<li><label for="name">行业名:</label> <input type="text"
								placeholder="行业名" name="name" class="inputTrade" required /><span
								class="checkTradeName"></span></li>
							<li><button class="submit" type="submit">提交</button></li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/Praise_company.js"></script>
</html>