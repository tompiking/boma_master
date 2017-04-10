<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BoMa登录</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/login.css">
<style type="text/css">
body, td, th {
	font-family: "Source Sans Pro", sans-serif;
}

body {
	background-color: #2B2B2B;
}
</style>
</head>
<body onload="loadTopWindow();">
	<div class="wrapper">
		<div class="container">
			<h1>欢迎使用</h1>
			<form class="form">
				<span id="msg">${not empty msg?msg:"" }</span> <input id="userName"
					type="text" placeholder="用户名"> <input id="psd"
					type="password" placeholder="密码">
				<button type="button" id="login-button">登录</button>
			</form>
		</div>
		<ul class="bg-bubbles">
			<li>BoMa</li>
			<li>BoMa</li>
			<li>BoMa</li>
			<li>BoMa</li>
			<li>BoMa</li>
			<li>BoMa</li>
			<li>BoMa</li>
			<li>BoMa</li>
		</ul>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/Login.js"></script>
</body>
</html>
