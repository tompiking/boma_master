<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<title>找工作，找伯 & 马</title>
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
						action="${pageContext.request.contextPath }/recruit/updateRecruit"
						method="post" name="contact_form">
						<ul>
							<li><input type="hidden" name="id" value="${recruit.id }" />
							<h2>修改招聘信息</h2> <span class="required_notification">*
									表示必填项</span></li>
							<li><label for="title">标题：</label><input id="title" class="addRec"
								type="text" name="title" value="${recruit.title }" required /></li>
							<li><label for="companyDescription">企业简介:</label>
							<textarea id="companyDescription" class="addRec" name="description" rows="10"
									cols="50" required>${recruit.description }</textarea></li>
							<li><label for="salary">年薪：</label><input id="salary" class="addRec"
								type="text" name="salary" value="${recruit.salary }" required /></li>
							<li><label for="address">工作点：</label><input id="address" class="addRec"
								type="text" name="address" value="${recruit.address }" required /></li>
							<li><label for="requirement">岗位职责和要求：</label>
							<textarea id="requirement" class="addRec" name="requirement" rows="10" cols="50"
									required>${recruit.requirement }</textarea></li>
							<li><button id="submit" class="submit" type="submit">提交</button>
								<button class="submit" type="reset">重置</button></li>
						</ul>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../js/recruit_js.js"></script>
</html>