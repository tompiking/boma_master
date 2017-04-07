<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新负责人信息</title>
<style>
.contact_form {
	padding-top: 40px;
}
</style>

<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/select/jquery-ui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/select/select.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/select/jquery-ui.min.js"></script>
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
					<form id="formUpdateManager" class="contact_form"
						action="${pageContext.request.contextPath }/manager/updateManagerByIdSubmit/${manager.id}"
						method="post" name="contact_form">
						<ul>
							<li>
								<h2>更新负责人</h2> <span class="required_notification">*
									表示必填项</span>
							</li>
							<li><label for="managerName">负责人姓名:</label> <input
								type="text" class="managerName" placeholder="负责人姓名" name="name"
								value="${manager.name }" required /><input type="hidden"
								name="isPraise" value="${manager.isPraise }"></li>
							<li><label for="showName">称呼:</label><input type="text"
								placeholder="XX总" name="showname" value="${manager.showName }"
								class="inputTrade" /></li>
							<li><label for="job">职位:</label><input type="text"
								placeholder="职位" value="${manager.job }" name="job" /></li>
							<li><label for="company">公司:</label> <select
								name="company.id" 
								class="selecttrade"
								class="combobox" placeholder="公司" >
									<option value="0">--请选择--</option>
									<c:forEach items="${companys }" var="company">
										<option value="${company.id }"
											<c:if test="${company.id == manager.company.id}">
											selected
											</c:if>>${company.name }</option>
									</c:forEach>
							</select>
							</li>
							<li><label for="comment">评语:</label> <textarea
									class="comment" name="comment" cols="40" rows="6" placeholder="评语" required>${manager.comment }</textarea></li>
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