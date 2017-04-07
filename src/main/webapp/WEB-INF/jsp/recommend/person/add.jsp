<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>推荐人信息添加</title>
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
<body class="body">
	<div class="content-box">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form class="contact_form"
						action="${pageContext.request.contextPath }/person/insert"
						method="post" name="contact_form" id="personInsertForm">
						<ul>
							<li>
								<h2>增加推荐信息</h2> <span class="required_notification">*
									表示必填项</span>
							</li>
							<li><label for="name">名字:</label> <input class="addRec" type="text"
								name="name" required/> 
							</li>
							<li><label for="birth">出生:</label> <input class="addRec" type="text"
								placeholder="2000-1-1" name="birth" required/>  </li>
							<li><label for="gender">性别:</label> <input type="radio"
								name="gender" value="1">男 <input type="radio"
								name="gender" value="0">女 </li>
							<li><label for="marry">婚姻:</label> <input type="radio"
								name="marry" value="1">已婚 <input type="radio"
								name="marry" value="0">未婚 </li>
							<li><label for="educational">学历:</label> <input class="addRec" type="text"
								placeholder="本科" name="educational" required/> </li>
							<li><label for="registry">籍贯:</label> <input class="addRec" type="text"
								placeholder="浙江杭州" name="registry" required/> </li>
							<li><label for="height">身高:</label> <input class="addRec" type="text"
								name="height" required/> </li>
							<li><label for="domicile">现在所在地:</label> <input class="addRec" type="text"
								placeholder="浙江杭州" name="domicile" required/> </li>
							<li><label for="description">个人评价:</label> <textarea
									class="addRec" name="description" cols="40" rows="6" placeholder="个人评价"
									required></textarea></li>
							<li><label for="requireJob">希望岗位:</label> <textarea
									class="addRec" name="requireJob" cols="40" rows="6" placeholder="希望岗位"
									required></textarea></li>
							<li>
								<button id="addPersonBtn" class="submit" type="button">添加</button>
								<button id="backToListBtn" class="submit" type="button">返回</button>
							</li>
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
	src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/recommend.js"></script>
</html>