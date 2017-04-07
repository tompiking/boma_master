$(function() {
	// 获取后台发送的提示消息并在页面显示
	var msg = $("#msg").val();
	if (msg != "" && msg != null) {
		alert(msg);
	}
	// 将从数据库取得的数据的换行符更换为textarea的换行符
	var comDesStr = $("#companyDescription").val();
	var reqStr = $("#requirement").val();
	var reg = new RegExp("<br/>", "g");
	if(comDesStr != "" && comDesStr != null) {
		$("#companyDescription").val(comDesStr.replace(reg,"\n"));
	}
	if(reqStr != "" && reqStr != null) {
		$("#requirement").val(reqStr.replace(reg,"\n"));
	}
	//新增或更改招聘信息
	$("#submit")
			.click(
					function() {
						if ($("select").val() == 0) {
							$("#selectCom")
									.html(
											" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;招聘公司不能为空");
							$("#selectCom").css('color', 'red');
							return false;
						}
						// 判断各非空属性不能为空，否则更改失败
						if ($("#title").val().trim() == "") {
							alert("标题不能为空");
							return false;
						}
						var reg = new RegExp("\n", "g");
						if ($("#companyDescription").val().trim() == ""
								|| $("#companyDescription").val().replace(reg,
										"") == "") {
							alert("企业简介不能为空");
							return false;
						}

						if ($("#salary").val().trim() == "") {
							alert("年薪不能为空");
							return false;
						}

						if ($("#address").val().trim() == "") {
							alert("工作地不能为空");
							return false;
						}

						if ($("#requirement").val().trim() == ""
								|| $("#requirement").val().replace(reg, "") == "") {
							alert("岗位职责和要求不能为空");
							return false;
						}
						// 若数据符合要求，将textarea的换行符替换为页面的换行符再提交到数据库
						var comstr = $("#companyDescription").val().replace(reg,"<br/>");
						$("#companyDescription").val(comstr);
						var reqstr = $("#requirement").val().replace(reg,"<br/>");
						$("#requirement").val(reqstr);
						
					});
	// 控制当用户只输入空格时的input样式
	$(".addRec").change(function() {
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
			$(this).css("background","#fff url(../img/red_asterisk.png) no-repeat 98% center");
			$(this).css("box-shadow","0px 0px 3px #ccc, 0 10px 15px #eee inset");
			$(this).css("border","1px solid #aaa");
		}
	});
});