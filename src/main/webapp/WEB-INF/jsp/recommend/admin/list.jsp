<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台推荐信息</title>
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
			<p id="page-intro">当前位置:>>显示推荐信息</p>
			<div class="content-box">
				<table>
					<thead>
						<tr>
							<td width="35%">推荐岗位</td>
							<td width="35%">被推荐人</td>
							<td width="15%">查看详细信息</td>
							<td width="15">操作</td>
						</tr>
					<tfoot>
						<tr>
							<td colspan="6">
								<div id="light-pagination" class="pagination"></div>
								<div class="clear"></div>
							</td>
						</tr>
					</tfoot>
					<tbody id="tBodyRecommend">
						<c:forEach items="${recommendPage.datas}" var="recommend">
							<tr class="recommend${recommend.id }">
								<td>${recommend.job.name }</td>
								<td>${recommend.person.name}</td>
								<td><a
									href="${pageContext.request.contextPath }/recommend/lookInfo?id=${recommend.id }"
									title="查看详情"> <img
										src="${pageContext.request.contextPath }/img/imagesN/icons/look_info.png"
										alt="LookInfo" />
								</a></td>
								<td><a
									href="${pageContext.request.contextPath }/recommend/edit?id=${recommend.id }"
									title="编辑"> <img
										src="${pageContext.request.contextPath }/img/imagesN/icons/pencil.png"
										alt="Edit" />
								</a> <a href="javascript:void(0)" title="删除"> <img
										src="${pageContext.request.contextPath }/img/imagesN/icons/cross.png"
										alt="Delete" onclick="deleteRecommend(${recommend.id },1);" />
								</a></td>
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
	src="${pageContext.request.contextPath }/js/person_page/jquery.recommendPagination.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/person_page/recommendPage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/recommend.js"></script>	
</html>