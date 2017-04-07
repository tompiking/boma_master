<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>找工作，找伯 & 马</title>
<link href="../css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/select/jquery-ui.min.css">
<link rel="stylesheet" href="../css/zw/addRecruit.css">
<script type="text/javascript">
	if(top.location == location) {
		top.location.href="/BoMa/admin/loginSuccess";
	}
</script>
<link rel="stylesheet" href="../css/recruit/addRecruit.css">
</head>
<body>
	<div align="left">
		<table border="1" width="47%" height="250" style="border-width: 0px">
			<tr>
				<td style="border-style: none; border-width: medium">
					<form class="contact_form"
						action="${pageContext.request.contextPath }/recruit/addRecruit"
						method="post" name="contact_form">
						<ul>
							<li><h2>增加招聘信息</h2> <span class="required_notification">*
									表示必填项</span></li>
							<li><label for="selectACompany" style="font-size: 18px;">选择公司：</label>
								<select id="selectACompany" class="addRec" name="company"
								required>
									<option value="0">--请选择--</option>
									<c:forEach items="${companies }" var="company">
										<option>${company.name }</option>
									</c:forEach>
							</select><span id="selectCom"></span></li>
							<li><label for="title" style="font-size: 18px;">招聘标题：</label>
								<input id="title" class="addRec" type="text" name="title"
								placeholder="recruit title" required /></li>
							<li><label for="companyDescription" style="font-size: 18px;">企业简介：</label>
								<textarea id="companyDescription" class="addRec"
									name="description" placeholder="company's description" rows="6"
									cols="40" required></textarea></li>
							<li><label for="salary" style="font-size: 20px;">年薪：</label>
								<input id="salary" class="addRec" type="text" name="salary"
								placeholder="yearly salary" required /></li>
							<li><label for="address" style="font-size: 20px;">工作地：</label>
								<input id="address" class="addRec" type="text" name="address"
								placeholder="company's address" required /></li>
							<li><label for="requirement" style="font-size: 18px;">岗位职责和要求：
							</label> <textarea id="requirement" class="addRec" name="requirement"
									placeholder="job's requirement" rows="6" cols="40" required></textarea></li>
							<li><button id="submit" class="submit" type="submit">添加</button>
								<button class="submit" type="reset">重置</button></li>
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
	src="${pageContext.request.contextPath}/js/recruit_ajax.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/recruit_js.js"></script>
<script
	src="${pageContext.request.contextPath}/js/select/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/select/addRecruit_select.js"></script>
</html>