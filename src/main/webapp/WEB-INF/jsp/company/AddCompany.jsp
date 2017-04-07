<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>增加公司</title>
<style>
.contact_form {
	padding-top: 40px;
}
</style>
<link href="${pageContext.request.contextPath }/css/styles.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/select/jquery-ui.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/select/select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/select/select2.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/select/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/select/select_trade.js"></script>
<script src="${pageContext.request.contextPath}/js/select/select_company.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/Praise_company.js"></script>
<script type="text/javascript">
	if(top.location == location) {
		top.location.href="/BoMa/admin/loginSuccess";
	}
</script>
</head>
<body>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form class="contact_form"
						action="${pageContext.request.contextPath }/company/addCompanySubmit"
						method="post" name="contact_form" enctype="multipart/form-data">
						<ul>
							<li>
								<h2>增加公司</h2> <span class="required_notification">* 表示必填项</span>
							</li>
							<li><label for="name">公司名:</label> <input type="text"
								placeholder="公司名" name="name" class="inputCompany" required /><span class="checkCompanyName"></span></li>
							<li><label for="logo">logo:</label> <input type="file"
								name="file0" id="file0" required />
							<li><label for="trade">行业:</label> <select name="trade.id"
								class="selecttrade"
										class="combobox" placeholder="行业">
									<option value="0">--请选择--</option>
									<c:forEach items="${trades }" var="trade">
										<option value="${trade.id }">${trade.name }</option>
									</c:forEach>
							</select></li>
							<li id="parentCompany"><label for="company">总公司: </label> <select
								name="parentCompany.id" class="selecttrade2"
										class="combobox2">
									<option value="0">--请选择--</option>
									<option value="0">无</option>
									<c:forEach items="${companys }" var="company">
										<option value="${company.id }">${company.name }</option>
									</c:forEach>
							</select></li>
							<li><label for="description">简介:</label> <textarea
									name="description" cols="40" rows="6" placeholder="公司简介"></textarea>
							</li>
							<li>
								<button class="submit" type="submit">提交</button>
							</li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>