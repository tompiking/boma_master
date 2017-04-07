<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>找工作，找伯 & 马</title>
<link style="text/css" href="../css/recruit/showAllRecruit.css"
	rel="stylesheet">
<link style="text/css" href="../css/yyh_css.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/simplePagination.css"
	type="text/css" media="screen" />
<script type="text/javascript">
	if(top.location == location) {
		top.location.href="/BoMa/admin/loginSuccess";
	}
</script>
</head>
<body>
	<form action="#">
		<input id="msg" type="hidden" value="${msg }" />
	</form>
	<div id="allRecruit">
		<%
			int num = 1;
		%>
		<table style="width: 100%">
			<tr>
				<td
					style="background-color: #8dd834; width: 150px; height: 50px; font-size: 25px; color: white; text-shadow: 0 0 7px #8bb379; text-align: center;"><span>招聘信息</span></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"
					style="border: none; border-top: 5px ridge #46abf3; box-shadow: 0 0 13px #4bd00d;"></td>
			</tr>
		</table>
		<div id="showRecruits">
			<c:forEach items="${recruits }" var="recruit" varStatus="index">
				<div>
					<table class="recruit${recruit.id }">
						<tr>
							<td style="width: 60%" colspan="6">
								<h1>${(page.currentPage-1)*3+1+index.index}、${recruit.title}</h1>
							</td>
							<td style="width: 10%" colspan="1"><a
								href="/BoMa/recruit/toUpdateRecruit?recruit=${recruit.id }"><img
									alt="加载失败" src="../img/imagesN/icons/pencil.png" /></a></td>
							<td style="width: 30%" colspan="3"><a
								href="javascript:void(0)"><img alt="加载失败"
									src="../img/imagesN/icons/cross.png"
									onclick="deleteRecruit(${recruit.id},${page.currentPage })" /></a></td>
						</tr>
						<tr>
							<td colspan="10"><hr
									style="height: 5px; border: none; border-top: 5px ridge #12d212;"></td>
						</tr>
						<tr>
							<td colspan="10"><h2 class='recruit_h2'>【企业简介】</h2></td>
						</tr>
						<tr>
							<td colspan="10"><p>${recruit.description }</p></td>
						</tr>
						<tr>
							<td colspan="2" style="width: 20%"><p>年薪:
									${recruit.salary }</p></td>
							<td colspan="8"><p>工作地: ${recruit.address }</p></td>
						</tr>
						<tr>
							<td colspan="10"><br />
						</tr>
						<tr>
							<td colspan="10"><h2 class='recruit_h2'>岗位职责和要求:</h2></td>
						</tr>
						<tr>
							<td colspan="10"><p>${recruit.requirement }</p></td>
						</tr>
					</table>
					<%
						num += 1;
					%>
				</div>
			</c:forEach>
		</div>
		<table style="float: right;">
			<tr>
				<td colspan="10">
					<div id="light-pagination" class="pagination"></div>
					<div class="clear"></div>
				</td>
			</tr>
		</table>
		<!-- End .pagination -->
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/recruit_ajax.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/recruit_js.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/addRecruit_page/jquery.simplePagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/addRecruit_page/index.js"></script>
</html>