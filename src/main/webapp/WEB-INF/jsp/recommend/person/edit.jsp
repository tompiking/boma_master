<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>推荐人信息编辑</title>
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
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form class="contact_form"
						action="${pageContext.request.contextPath }/person/update"
						method="post" name="contact_form" id="personUpdateForm">
						<ul>
							<li>
								<h2>修改推荐信息</h2> <span class="required_notification">* 表示必填项</span>
							</li>
							<li>
								<input type="hidden" id="id" name="id" value="${person.id }">
							</li>
							<li>
								<label for="name">名字:</label>
								<input class="addRec" type="text" name="name" value="${person.name }" required/>
							</li>
							<li>
								<label for="birth">出生:</label>
								<input class="addRec" required type="text" placeholder="2000-1-1" name="birth" value='<fmt:formatDate type="date" value="${person.birth}"/>'/>
							</li>
							<li>
								<label for="gender">性别:</label>
								<input id="gender1" type="radio" name="gender" value="1" ${person.gender?'checked':'' }>男
								<input id="gender0" type="radio" name="gender" value="0" ${!person.gender?'checked':'' }>女
							</li>
							<li>
								<label for="marry">婚姻:</label>
								<input type="radio" name="marry" value="1" ${person.marry?'checked':'' }>已婚
								<input type="radio" name="marry" value="0" ${!person.marry?'checked':'' }>未婚
							</li>
							<li>
								<label for="educational">学历:</label>
								<input class="addRec" type="text" placeholder="本科" name="educational" value="${person.educational }" required/>
							</li>
							<li>
								<label for="registry">籍贯:</label>
								<input class="addRec" type="text" placeholder="浙江杭州" name="registry" value="${person.registry }" required/>
							</li>
							<li>
								<label for="height">身高:</label>
								<input class="addRec" type="text"  name="height" value="${person.height }" required/>
							</li>
							<li>
								<label for="domicile">现在所在地:</label>
								<input class="addRec" type="text" placeholder="浙江杭州" name="domicile" value="${person.domicile }" required/>
							</li>
							<li>
								<label for="description">个人评价:</label>
								<textarea class="addRec" name="description" cols="40" rows="6" placeholder="个人评价" required>${person.description }</textarea>
							</li>
							<li>
								<label for="requireJob">希望岗位:</label>
								<textarea class="addRec" name="requireJob" cols="40" rows="6" placeholder="希望岗位" required>${person.requireJob }</textarea>
							</li>
							<li>
								<button id="updatePersonBtn" class="submit" type="button">确认修改</button>
								<%-- <button id="backupdatePersonBtn" class="submit" type="button" onclick="updatePersonAfter(${pageno});">返回显示页面</button> --%>
								<button id="cancelUpdatePersonBtn" type="button" class="submit" >撤回修改</button>
							</li>	
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/recommend.js"></script>
</html>