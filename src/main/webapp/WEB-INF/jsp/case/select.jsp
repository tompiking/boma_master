<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<link style="text/css"
	href="${pageContext.request.contextPath}/css/Case_css.css"
	rel="stylesheet">
<!-- 分页css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/css.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/simplePagination.css"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Case_js.js"></script>
<!-- 分页js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/case_page/jquery.simplePagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/case_page/index.js"></script>
</head>
<body>
	<ul id="selectul">
		<c:forEach items="${trades }" var="trade">
			<li><span style="color: gray; font-size: 30px">服务行业：${trade.getName() }</span>
				<hr>
				<ul>
					<li>
						<ul class="imgul" style="width: 500px;">
							<c:forEach items="${companies.get(trade) }" var="company">
								<li class="imgli"
									style="width: 100px; margin-right: 15px; line-height: 20px;"><img
									alt="加载失败" src="/pic/${company.logo.img }" height="100"
									width="100"></li>
							</c:forEach>
						</ul>
					</li>
					<li><span style="color: gray; font-size: 20px">服务客户：</span>
						<ul>
							<c:forEach items="${companies.get(trade) }" var="company">
								<li><p>${company.getName() },</p></li>
							</c:forEach>
						</ul></li>
					<li><span style="color: gray; font-size: 20px">服务岗位：</span>
						<ul>
							<c:forEach items="${jobs.get(trade) }" var="job">
								<li><p>${job.getName() },</p></li>
							</c:forEach>
						</ul></li>
				</ul>
				<hr id="one"></li>
		</c:forEach>
	</ul>
	<div id="light-pagination" class="pagination"></div>
</body>

</html>