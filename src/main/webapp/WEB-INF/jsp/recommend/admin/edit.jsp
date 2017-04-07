<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改推荐信息</title>
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
						action="${pageContext.request.contextPath }/recommend/update"
						method="post" name="contact_form" id="recommendUpdateForm">
						<ul>
							<li>
								<h2>修改推荐信息</h2> <span class="required_notification">* 表示必填项</span>
							</li>
							<li>
								<input type="hidden" name="recommend.id" value="${recommend.id }">
							</li>
							<li>
								<label for="job.name">推荐岗位:</label>
								<select id="selectAJob" name="job.id" class="addRec">
									<option value="${recommend.job.id }">${recommend.job.name }</option>
										<c:forEach items="${jobs }" var="job">
											<option value="${job.id }">${job.name }</option>
										</c:forEach>
							    </select>
							    <span id="selectJob"></span>
							</li>
							<li>
								<label for="recommend.isShow">是否展示:</label>
								<input type="radio" name="recommend.isShow" value="1" ${recommend.isShow?'checked':'' }>是
								<input type="radio" name="recommend.isShow" value="0" ${!recommend.isShow?'checked':''}>否
							</li>
							<li>
								<input type="hidden" name="person.id" value="${recommend.person.id }">
							</li>
							<li>
								<label for="person.name">名字:</label>
								<input class="addRec" type="text" name="person.name" value="${recommend.person.name }" required/>
							</li>
							<li>
								<label for="person.birth">出生:</label>
								<input class="addRec" type="text" required placeholder="2000-1-1" name="person.birth" value='<fmt:formatDate type="date" value="${recommend.person.birth}"/>'/>
							</li>
							<li>
								<label for="person.gender">性别:</label>
								<input id="gender1" type="radio" name="person.gender" value="1" ${recommend.person.gender?'checked':'' }>男
								<input id="gender0" type="radio" name="person.gender" value="0" ${!recommend.person.gender?'checked':'' }>女
							</li>
							<li>
								<label for="person.marry">婚姻:</label>
								<input type="radio" name="person.marry" value="1" ${recommend.person.marry?'checked':'' }>已婚
								<input type="radio" name="person.marry" value="0" ${!recommend.person.marry?'checked':'' }>未婚
							</li>
							<li>
								<label for="person.educational">学历:</label>
								<input class="addRec" type="text" required placeholder="本科" name="person.educational" value="${recommend.person.educational }"/>
							</li>
							<li>
								<label for="person.registry">籍贯:</label>
								<input class="addRec" type="text" required placeholder="浙江杭州" name="person.registry" value="${recommend.person.registry }"/>
							</li>
							<li>
								<label for="person.height">身高:</label>
								<input class="addRec" type="text" required  name="person.height" value="${recommend.person.height }"/>
							</li>
							<li>
								<label for="person.domicile">现在所在地:</label>
								<input class="addRec" type="text" required placeholder="浙江杭州" name="person.domicile" value="${recommend.person.domicile }"/>
							</li>
							<li>
								<label for="person.description">个人评价:</label>
								<textarea class="addRec" name="person.description" cols="40" rows="6" placeholder="个人评价" required>${recommend.person.description }</textarea>
							</li>
							<li>
								<label for="person.requireJob">希望岗位:</label>
								<textarea class="addRec" name="person.requireJob" cols="40" rows="6" placeholder="希望岗位" required>${recommend.person.requireJob }</textarea>
							</li>
							<li>
								<button id="updateRecommendBtn" class="submit" type="button">确认修改</button>
								<button id="cancelUpdateRecommendBtn" type="button" class="submit" >撤回修改</button>
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
</html>