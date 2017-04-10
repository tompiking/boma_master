<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>伯&马</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/cssN/style.css" type="text/css"
	media="screen" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/scriptsN/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/scriptsN/simpla.jquery.configuration.js"></script>
</head>
<body>
	<div id="body-wrapper">
		<!-- Wrapper for the radial gradient background -->
		<div id="sidebar">
			<div id="sidebar-wrapper">
				<!-- Sidebar with logo and menu -->
				<h1 id="sidebar-title">
					<a href="#">伯 & 马</a>
				</h1>
				<!-- Logo (221px wide) -->
				<a href="#"><img id="logo"
					src="${pageContext.request.contextPath }/img/imagesN/logo.png"
					alt="Simpla Admin logo" /></a>
				<!-- Sidebar Profile links -->
				<div id="profile-links">
					欢迎您管理员, <a href="${pageContext.request.contextPath }/admin/toUpdatePassword" title="Edit your profile" target="_myblank">${user.name }</a> <br />
					<a href="${pageContext.request.contextPath }/admin/signOut" title="退出登录">注销</a>
				</div>

				<ul id="main-nav">
					<!-- Accordion Menu -->
					<li><a id="main" href="javascript:void(0);"
						class="nav-top-item current" onclick="changeColor('#main')"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
							企业管理
					</a>
						<ul>
							<li>
								<a class="current" target="_myblank" href="${pageContext.request.contextPath }/company/showAllCompanies">企业列表</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/trade/addTrade" target="_myblank">添加行业</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/case/insert" target="_myblank">添加岗位</a>
							</li>
							<li><a
								href="${pageContext.request.contextPath }/company/addCompany"
								target="_myblank">添加企业</a></li>
						</ul></li>
					<li><a id="parise" href="javascript:void(0);"
						class="nav-top-item" onclick="changeColor('#parise')"> <!-- Add the class "current" to current menu item -->
							口碑印证
					</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/manager/getManagerIsPraise "
								target="_myblank">口碑列表</a></li>
							<!-- Add class "current" to sub menu items also -->
							<li><a
								href="${pageContext.request.contextPath}/manager/addShowPraise"
								target="_myblank">显示口碑</a></li>
							<li><a
								href="${pageContext.request.contextPath }/manager/addManager"
								target="_myblank">添加口碑</a></li>
						</ul></li>
					<li><a id="case" href="#" class="nav-top-item"
						onclick="changeColor('#case')"> 成功案例 </a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/case/select"
								target="_myblank">案例列表</a></li>
							<li><a
								href="${pageContext.request.contextPath}/case/select_admin"
								target="_myblank">修改案例</a></li>
							<li><a
								href="${pageContext.request.contextPath}/case/add"
								target="_myblank">添加案例</a></li>
						</ul></li>
					<li><a id="recruit" href="#" class="nav-top-item"
						onclick="changeColor('#recruit')"> 伯企业 </a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath }/recruit/showIsShowRecruit"
								target="_myblank">招聘列表</a></li>
							<li><a
								href="${pageContext.request.contextPath }/company/getAllCompanies"
								target="_myblank">添加招聘信息</a></li>
						</ul></li>
					<li><a id="people" href="#" class="nav-top-item"
						onclick="changeColor('#people')"> 伯人才 </a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/recommend/listAll"
								target="_myblank">推荐列表</a></li>
							<li><a
								href="${pageContext.request.contextPath}/recommend/add"
								target="_myblank">添加推荐</a></li>
							<li><a href="${pageContext.request.contextPath}/person/list"
								target="_myblank">人才列表</a></li>
							<li><a href="${pageContext.request.contextPath}/person/add"
								target="_myblank">添加人才</a></li>
						</ul></li>
					<li><a id="other" href="#" class="nav-top-item"
						onclick="changeColor('#other')"> 用户管理 </a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath }/admin/toUpdatePassword"
								target="_myblank">修改密码</a></li>
							<li><c:if test="${user.username == superAdmin}"><a
								href="${pageContext.request.contextPath }/admin/toAddAdmin"
								target="_myblank">新增管理员</a></c:if></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="main-content">
		<div class="content-box-content">
			<iframe
				src="${pageContext.request.contextPath }/company/showAllCompanies"
				width="100%" height="500px" name="_myblank" frameborder=”no”></iframe>
		</div>
	</div>
</body>

</html>

