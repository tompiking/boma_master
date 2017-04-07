<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加推荐信息</title>
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
<link rel="stylesheet" href="../css/select/jquery-ui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/select/addRecommend.css">
</head>
<body>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form class="contact_form"
						action="${pageContext.request.contextPath }/recommend/insert"
						method="post" name="contact_form" id="recommendInserForm">
						<ul>
							<li>
								<h2>增加推荐信息</h2> <span class="required_notification">* 表示必填项</span>
							</li>
							<li>
								<label for="job.name">推荐岗位:</label>
								<select id="selectAJob" name="job.id" class="addRec" placeholder="岗位">
									<option value="0">--请选择!如无请添加--</option>
										<c:forEach items="${jobs }" var="job">
											<option value="${job.id }">${job.name }</option>
										</c:forEach>
							    </select> 
							    <span id="selectJob"></span>
							</li>
							<li>
								<label for="person.name">被推荐人:</label>
								<select id="selectAPerson" name="person.id" class="addRec" placeholder="姓名">
									<option value="0">--请选择!如无请添加--</option>
										<c:forEach items="${persons }" var="person">
											<option value="${person.id }">${person.name }</option>
										</c:forEach>
							    </select>
								<span id="selectPerson"></span>
							</li>
							<li>
								<label for="recommend.isShow">是否展示:</label>
								<input type="radio" name="recommend.isShow" value="1">是
								<input type="radio" name="recommend.isShow" value="0">否
								<span class="cheackSelect">
									<img src="../img/red_asterisk.png"/>
								</span>
							</li>
							<li>
								<button id="addRecommendBtn" class="submit" type="button">添加</button>
							</li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/browser.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/recommend.js"></script>
<script src="${pageContext.request.contextPath}/js/select/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/select/addRecommend_select.js"></script>
<script src="${pageContext.request.contextPath}/js/select/addRecommend_selectP.js"></script>
</html>