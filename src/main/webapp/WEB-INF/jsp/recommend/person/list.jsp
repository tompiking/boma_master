<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<p id="page-intro">当前位置:>>显示被推荐人信息</p>
			<div class="content-box">
				<table>
					<thead>
						<tr>
							<th width="15%">姓名</th>
							<th width="10%">性别</th>
							<th width="15%">出生日期</th>
							<th width="15%">学历</th>
							<th width="15%">籍贯</th>
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
					<tbody id="tbodyPerson">
					<c:forEach items="${personPage.datas }" var="person">
						<tr class="person${person.id }">
							<td>${person.name }
								<a href="lookInfo?id=${person.id }" title="查看详情">
									<img src="${pageContext.request.contextPath }/img/imagesN/icons/look_info.png" 
									alt="LookInfo" />
								</a>
							</td>
							<c:if test="${person.gender }"><td>男</td></c:if>
							<c:if test="${!person.gender }"><td>女</td></c:if>
							<td><fmt:formatDate type="date" value="${person.birth}"/></td>
							<td>${person.educational }</td>
							<td>${person.registry }</td>
							<td>
							<a href="${pageContext.request.contextPath }/person/edit?id=${person.id }&pageno=${personPage.currentno }" title="编辑">
								<img src="${pageContext.request.contextPath }/img/imagesN/icons/pencil.png" alt="Edit" />
							</a>
							<a href="javascript:void(0)" title="删除">
								<img src="${pageContext.request.contextPath }/img/imagesN/icons/cross.png" alt="Delete" 
									onclick="deletePerson(${person.id },1);"/></a>	
							</td>
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
	src="${pageContext.request.contextPath }/js/person_page/jquery.personPagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/person_page/personPage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/recommend.js"></script>	
</html>