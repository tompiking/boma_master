function send() {
	window.location.href = "/BoMa/admin/loginSuccess";
}
// 判断当前窗口是否有顶级窗口，如果有就让当前的窗口的地址栏发生变化，
// 这样就可以让登陆窗口显示在整个窗口了
function loadTopWindow() {
	if (window.top != null && window.top.document.URL != document.URL) {
		window.top.location = document.URL;
	}
}
$(function() {
	$("#userName").blur(function() {
		var name = $('#userName').val();
		if (name == "") {
			$("#msg").html("用户名不能为空");
			$("#msg").show("slow");
		} else {
			$("#msg").hide();
			$("#msg").html("用户名或密码错误");
		}
	})
	$("#psd").blur(function() {
		var name = $('#psd').val();
		if (name == "") {
			$("#msg").html("密码不能为空");
			$("#msg").show("slow");
		} else {
			$("#msg").hide();
			$("#msg").html("用户名或密码错误");
		}
	})
	$('#login-button').click(function(event) {
		$('#login-button').html("正在登录...");
		var name = $('#userName').val();
		var psd = $('#psd').val();
		var params = {};
		params.username = name;
		params.password = psd;
		$.ajax({
			url : "/BoMa/admin/login",
			method : "post",
			dataType : "json",
			data : params,
			success : function(data) {
				if ('true' == data.result) {
					$("#msg").hide();
					event.preventDefault();
					$('form').fadeOut(500);
					$('.wrapper').addClass('form-success');
					setTimeout('send();', 1500);
				} else {
					$("#msg").hide();
					$("#msg").html("用户名或密码错误");
					$("#msg").show("slow");
					$('#login-button').html("Login");
				}
			}
		});
	});
	
	$("#psd").keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);  
	    if(keycode == '13'){  
	    	$('#login-button').click();
	    }  
	});
})