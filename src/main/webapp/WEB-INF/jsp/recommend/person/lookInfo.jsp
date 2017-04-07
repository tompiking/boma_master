<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>推荐人详细信息</title>
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
							<h2>被推荐人详细信息</h2>
						</li>
						<li><label for="name">名字:</label> <input type="text"
							name="name" value="${person.name }" disabled="disabled"/></li>
						<li><label for="birth">出生:</label> <input type="text"
							name="birth"
							value='<fmt:formatDate type="date" value="${person.birth}"/>' disabled="disabled"/>
						</li>
						<li><label for="gender">性别:</label> <input id="gender1"
							type="radio" name="gender" value="1"
							${person.gender?'checked':'' } disabled="disabled">男 <input id="gender0"
							type="radio" name="gender" value="0"
							${!person.gender?'checked':'' } disabled="disabled">女</li>
						<li><label for="marry">婚姻:</label> <input type="radio"
							name="marry" value="1" ${person.marry?'checked':'' } disabled="disabled">已婚 <input
							type="radio" name="marry" value="0"
							${!person.marry?'checked':'' } disabled="disabled">未婚</li>
						<li><label for="educational">学历:</label> <input type="text"
							name="educational" value="${person.educational }" disabled="disabled"/></li>
						<li><label for="registry">籍贯:</label> <input type="text"
							name="registry" value="${person.registry }" disabled="disabled"/></li>
						<li><label for="height">身高:</label> <input type="text"
							name="height" value="${person.height }" disabled="disabled"/></li>
						<li><label for="domicile">现在所在地:</label> <input type="text"
							name="domicile" value="${person.domicile }" disabled="disabled"/></li>
						<li><label for="description">个人评价:</label> <textarea
								name="description" cols="40" rows="6" disabled="disabled">${person.description }</textarea>
						</li>
						<li><label for="requireJob">希望岗位:</label> <textarea
								name="requireJob" cols="40" rows="6" disabled="disabled">${person.requireJob }</textarea>
						</li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>