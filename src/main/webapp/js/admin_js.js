$(function() {
	var msg = $("#msg").val();
	if (msg != "" && msg != null) {
		alert(msg);
	}
	var getOldPassword = $("#getOldPassword").val();
	if (getOldPassword!="" && getOldPassword!=null) {
		$("#oldPassword").val(getOldPassword);
	}
	var getNewPassword = $("#getNewPassword").val();
	if (getNewPassword!="" && getNewPassword!=null) {
		$("#password").val(getNewPassword);
		$("#checkPassword").val(getNewPassword);
	}
	var getName = $("#getName").val();
	if (getName!="" && getName!=null) {
		$("#name").val(getName);
	}
	var getUsername = $("#getUsername").val();
	if (getUsername!="" && getUsername!=null) {
		$("#username").val(getUsername);
	}
	var getPassword = $("#getPassword").val();
	if (getPassword!="" && getPassword!=null) {
		$("#password").val(getPassword);
		$("#checkPassword").val(getPassword);
	}
	$("#addAdmin").click(function() {
		var name = $("#name").val();
		var username = $("#username").val();
		var password = $("#password").val();
		var checkPassword = $("#checkPassword").val();
		if(name.trim() == "") {
			alert("管理员名称不能为空");
			return false;
		}
		if(username.trim() == "") {
			alert("用户名不能为空");
			return false;
		}
		if(password.trim() == "") {
			alert("密码不能为空或只为空格");
			return false;
		}
		if(password != checkPassword) {
			alert("请确认两次输入密码是否一致");
			return false;
		}
	});
	$("#updatePassword").click(function() {
		var oldPassword = $("#oldPassword").val();
		var password = $("#password").val();
		var checkPassword = $("#checkPassword").val();
		if(oldPassword.trim() == "") {
			alert("旧密码不能为空");
			return false;
		}
		if(password.trim() == "") {
			alert("新密码不能为空或只为空格");
			return false;
		}
		if(password != checkPassword) {
			alert("请确认两次输入密码是否一致");
			return false;
		}
	});
	$("#checkPassword").change(function() {
		var password = $("#password").val();
		var checkPassword = $("#checkPassword").val();
		if(password != checkPassword) {
			$("#checkSpan").html("与首次密码不一致");
			$("#checkSpan").css("color","red");
			$("#checkSpan").css("font-size","15px");
			$("#checkPassword").css("background","#fff url(../img/invalid.png) no-repeat 98% center");
			$("#checkPassword").css("box-shadow","0 0 5px #d45252");
			$("#checkPassword").css("border-color","#b03535");
		} else {
			$("#checkSpan").html("");
			$("#checkPassword").css("background","#fff url(../img/valid.png) no-repeat 98% center");
			$("#checkPassword").css("box-shadow","0 0 5px #5cd053");
			$("#checkPassword").css("border-color","#28921f");
		}
	});
	
	$(".notEmpty").change(function() {
		if($(this).val() != null && $(this).val() != ""){
			if($(this).val().trim() == "") {
				$(this).css("background","#fff url(../img/invalid.png) no-repeat 98% center");
				$(this).css("box-shadow","0 0 5px #d45252");
				$(this).css("border-color","#b03535");
			} else {
				$(this).css("background","#fff url(../img/valid.png) no-repeat 98% center");
				$(this).css("box-shadow","0 0 5px #5cd053");
				$(this).css("border-color","#28921f");
			}
		} else {
			$(this).css("background","#fff");
			$(this).css("box-shadow","0px 0px 3px #ccc, 0 10px 15px #eee inset");
			$(this).css("border","1px solid #aaa");
		}
	});
});