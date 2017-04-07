<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>口碑印证</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/BoMa_table_css.css"
	type="text/css" media="screen" />
<!-- 分页css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/css.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/css_page/simplePagination.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/simpla.jquery.configuration.js"></script>
	
<script type="text/javascript">
	if(top.location == location) {
		top.location.href="/BoMa/admin/loginSuccess";
	}
</script>
</head>
<body class="body">
	<div id="body-wrapper">
		<div id="main-content">
			<p id="page-intro">当前位置:>>已显示口碑印证案例</p>
			<div class="content-box">
				<table>
					<thead>
						<tr>
							<th width="20%">公司LOGO</th>
							<th width="10%">公司名</th>
							<th width="10%">负责人</th>
							<th width="50%">口碑评语</th>
							<th width="40px">操作</th>
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
					<tbody id="tbodyManager">
						<c:forEach items="${managerList }" var="manager">
							<tr class="manager${manager.id }">
								<td><img src="/pic/${manager.company.logo.img }"
									width="100px"></td>
								<td><c:choose>
										<c:when test="${not empty manager.company.parentCompany}">
										${manager.company.parentCompany.name }&${manager.company.name }
									</c:when>
										<c:otherwise>
										${manager.company.name}
										</c:otherwise>
									</c:choose></td>
								<td>${manager.name }</td>
								<td>${manager.comment }</td>
								<td><a href="javascript:void(0);" title="取消显示"
									onclick="removePraise(${manager.id }, 1);"> <img alt="取消显示"
										src="${pageContext.request.contextPath }/img/imagesN/icons/cross_circle.png">
								</a> <a href="javascript:void(0);" title="修改"
									onclick="updateManagerById(${manager.id})"> <img
										src="${pageContext.request.contextPath }/img/imagesN/icons/pencil.png"
										alt="修改" />
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/Praise_company.js"></script>
<!-- 分页js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/js_Page_praise/jquery.simplePagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/js_Page_praise/index.js"></script>

</html>