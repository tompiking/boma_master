<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>公司总览</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/BoMa_table_css.css"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/simpla.jquery.configuration.js"></script>
<!-- 分页css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/css.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/simplePagination.css"
	type="text/css" media="screen" />
<script type="text/javascript">
	if(top.location == location) {
		top.location.href="/BoMa/admin/loginSuccess";
	}
</script>
</head>
<body class="body">
	<div id="body-wrapper">
		<div id="main-content">
			<p id="page-intro">当前位置:>>公司总览</p>
			<div>
				<p id="page-intro">
					<a class="page-link" href="${pageContext.request.contextPath }/company/addCompany" target="_myblank">添加企业</a>
				</p>
			</div>
			<div class="content-box">
				<table>
					<thead>
						<tr>
							<th width="15%">公司LOGO</th>
							<th width="15%">公司名</th>
							<th width="10%">所属行业</th>
							<th width="15%">总公司</th>
							<th width="35%">公司简介</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="6">
								<div id="light-pagination" class="pagination"></div>
								<div class="clear"></div>
							</td>
						</tr>
					</tfoot>
					<tbody id="tbodyCompany">
						<c:forEach items="${companies }" var="company">
							<tr class="company${company.id }">
								<td><img src="/pic/${company.logo.img }" width="100px" /></td>
								<td>${company.name }</td>
								<td>${company.trade.name }</td>
								<td>${not empty company.parentCompany?company.parentCompany.name:"无" }</td>
								<td>${company.description }</td>
								<td><a
									href="${pageContext.request.contextPath }/company/updateCompany/${company.id}"
									title="Edit"><img
										src="${pageContext.request.contextPath }/img/imagesN/icons/pencil.png"
										alt="Edit" /></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<!-- 分页js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/js_page_company/jquery.simplePagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/js_page_company/index.js"></script>
</html>