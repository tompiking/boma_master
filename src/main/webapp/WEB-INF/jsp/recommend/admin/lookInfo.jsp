<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>推荐详细信息</title>
<style>
.contact_form {
	padding-top: 40px;
}

.contact_form input[type="radio"] {
	height: 13px;
	width: 13px;
}
</style>
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	if(top.location == location) {
		top.location.href="/BoMa/admin/loginSuccess";
	}
</script>
</head>
<body>
	<div align="left" class="contact_form">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<ul>
						<li>
							<h2>推荐详细信息</h2>
						</li>
						<li><input type="hidden" name="recommend.id"
							value="${recommend.id }"></li>
						<li><label for="job.name">推荐岗位:</label> <select name="job.id"
							class="selectTrade">
								<option value="${recommend.job.id }">${recommend.job.name }</option>
								<c:forEach items="${jobs }" var="job">
									<option value="${job.id }">${job.name }</option>
								</c:forEach>
						</select></li>
						<li><label for="recommend.isShow">是否展示:</label> <input
							type="radio" name="recommend.isShow" value="1"
							${recommend.isShow?'checked':'' } disabled="disabled">是 <input type="radio"
							name="recommend.isShow" value="0"
							${!recommend.isShow?'checked':''} disabled="disabled">否</li>
						<li><input type="hidden" name="person.id"
							value="${recommend.person.id }" disabled="disabled"></li>
						<li><label for="person.name">名字:</label> <input type="text"
							name="person.name" value="${recommend.person.name }" disabled="disabled"/></li>
						<li><label for="person.birth">出生:</label> <input type="text"
							name="person.birth"
							value='<fmt:formatDate type="date" value="${recommend.person.birth}"/>' disabled="disabled"/>
						</li>
						<li><label for="person.gender">性别:</label> <input
							id="gender1" type="radio" name="person.gender" value="1"
							${recommend.person.gender?'checked':'' } disabled="disabled">男 <input
							id="gender0" type="radio" name="person.gender" value="0"
							${!recommend.person.gender?'checked':'' } disabled="disabled">女</li>
						<li><label for="person.marry">婚姻:</label> <input type="radio"
							name="person.marry" value="1"
							${recommend.person.marry?'checked':'' } disabled="disabled">已婚 <input
							type="radio" name="person.marry" value="0"
							${!recommend.person.marry?'checked':'' } disabled="disabled">未婚</li>
						<li><label for="person.educational">学历:</label> <input
							type="text" name="person.educational"
							value="${recommend.person.educational }" disabled="disabled"/></li>
						<li><label for="person.registry">籍贯:</label> <input
							type="text" name="person.registry"
							value="${recommend.person.registry }" disabled="disabled"/></li>
						<li><label for="person.height">身高:</label> <input type="text"
							name="person.height" value="${recommend.person.height }" disabled="disabled"/></li>
						<li><label for="person.domicile">现在所在地:</label> <input
							type="text" name="person.domicile"
							value="${recommend.person.domicile }" disabled="disabled"/></li>
						<li><label for="person.description">个人评价:</label> <textarea
								name="person.description" cols="40" rows="6" disabled="disabled">${recommend.person.description }</textarea>
						</li>
						<li><label for="person.requireJob">希望岗位:</label> <textarea
								name="person.requireJob" cols="40" rows="6" disabled="disabled">${recommend.person.requireJob }</textarea>
						</li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/browser.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/recommend.js"></script>
</html>