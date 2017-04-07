<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新公司</title>
<style>
.contact_form {
	padding-top: 40px;
}
</style>
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
<script
	src="${pageContext.request.contextPath}/js/select/select_company.js"></script>
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
						action="${pageContext.request.contextPath }/company/updateCompanySubmit"
						method="post" name="contact_form" enctype="multipart/form-data">
						<ul>
							<li>
								<h2>更新公司</h2> <span class="required_notification">* 表示必填项</span>
							</li>
							<li><label for=companyName">公司名:</label> <input type="text"
								placeholder="公司名" name="name" class="inputCompany" value="${company.name }" required />
								<span class="checkCompanyName"></span>
								<input type="hidden" value="${company.id }" name="id" /> <input
								type="hidden" value="${company.logo.img } " name="logo.img" /></li>
							<li><label>LOGO:</label><input type="file" name="file0"
								id="file0" /></li>
							<li><img width="200px" id="img0"
								src="/pic/${company.logo.img }"></li>
							<li><label for="trade">行业:</label> <select
								class="selecttrade" class="combobox" name="trade.id"
								placeholder="行业">
									<option value="0">--请选择--</option>
									<c:forEach items="${trades }" var="trade">
										<option value="${trade.id }"
											<c:if test="${trade.id == company.trade.id}">
											selected
											</c:if>>${trade.name }</option>
									</c:forEach>
							</select><span class="cheackSelect"><img
									src="${pageContext.request.contextPath }/img/red_asterisk.png" /></span></li>
							<li><label for="parentCompany">总公司:</label> <select
								class="selecttrade2"
								class="combobox2"
								name="parentCompany.id">
									<option value="0">--请选择--</option>
									<c:choose>
										<c:when test="${not empty company.parentCompany }">
											<c:forEach items="${companies }" var="com">
												<option value="${com.id }"
													<c:if test="${com.id == company.parentCompany.id}">
													selected														
													</c:if>>${com.name }</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach items="${companies }" var="com">
												<option value="${com.id }">${com.name }</option>
											</c:forEach>
										</c:otherwise>
									</c:choose>
							</select></li>
							<li><label for="description">简介:</label> <textarea
									name="description" cols="40" rows="6" placeholder="简介">${company.description }</textarea></li>
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