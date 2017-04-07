<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link style="text/css"
	href="${pageContext.request.contextPath}/css/Case_css.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/css.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/simplePagination.css"
	type="text/css" media="screen" />
	
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/simpla.jquery.configuration.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Case_ajax.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Case_js.js"></script>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/case_page2/jquery.simplePagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/case_page2/index.js"></script>

</head>
<body>
	<ul id="selectul">
		<c:forEach items="${companies.keySet() }" var="trade">
			<li class="trade${trade.id }"><span
				style="color: gray; font-size: 30px">服务行业：${trade.getName() }</span>
				<button onclick="delectTrade(${trade.id},${page.currentPage })"
					class="submit" type="button">删除</button>
				<hr>
				<ul>
					<li><span style="color: gray; font-size: 20px">LOGO</span>
						<ul class="imgul" style="width: 500px;">
							<c:forEach items="${companies.get(trade) }" var="company">
								<li class="img${company.id }"
									style="width: 100px; margin-right: 15px; line-height: 20px;"><img
									alt="加载失败" src="/pic/${company.logo.img }" height="100"
									width="100"></li>
							</c:forEach>
						</ul></li>
					<li><span style="color: gray; font-size: 20px">服务公司</span>
						<ul>
							<c:forEach items="${companies.get(trade) }" var="company">
								<li><p class="company${company.id }">${company.getName() }
										<img alt="加载失败"
											src="${pageContext.request.contextPath}/img/imagesN/icons/cross.png"
											onclick="delectCompany(${company.id})">
									</p></li>
							</c:forEach>
						</ul></li>
					<li><span style="color: gray; font-size: 20px">服务岗位</span>
						<ul>
							<c:forEach items="${jobs.get(trade) }" var="job">
								<li><p class="job${job.id }${trade.id }">${job.getName() }
										<img alt="加载失败"
											src="${pageContext.request.contextPath}/img/imagesN/icons/cross.png"
											onclick="deletebyIds(${job.id }, ${trade.id })">
									</p></li>
							</c:forEach>
						</ul></li>
				</ul>
				<hr id="one"></li>
		</c:forEach>
	</ul>
	<div id="light-pagination" class="pagination"></div>
</body>

</html>