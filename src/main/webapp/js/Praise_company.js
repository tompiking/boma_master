$(function() {
	/**
	 * class为submit的按钮点击时验证下拉框中内容是否正确
	 */
	$('.submit')
			.click(
					function() {
						/* alert($('.selecttrade').val()); */
						if ($('.selecttrade').length > 0) {
							if ($('.selecttrade').val() == 0
									|| $('.selecttrade').val() == null) {
								var value = $('.selecttrade').attr(
										'placeholder');
								$(".custom-combobox-input")
										.css('background',
												'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
								$(".custom-combobox-input").css('box-shadow',
										'0 0 5px #d45252');
								$(".custom-combobox-input").css('border-color',
										'#b03535');
								alert("请选择" + value);
								return false;
							} else {
								$('.submit').submit();
							}
						}
					})

	/**
	 * 当id为file0的文件控件中的内容发生改变时, 实现图片的预览
	 */
	$("#file0")
			.change(
					function() {
						var file = this.files[0];
						if (file.type !== 'image/jpeg'
								&& file.type !== 'image/png'
								&& file.type !== 'image/gif') {
							$("#file0").css('box-shadow', '0 0 5px #d45252');
							$("#file0").css('color', 'red');
							$("#file0")
									.css('background',
											' #fff url(/BoMa/img/invalid.png) no-repeat 98% center');
							$("#file0").css('border-color', '#b03535');
							$(".submit").attr("disabled", "true");
							alert("请确保文件类型为图像类型");
							$("#img0").attr("src", "");
							return false;
						} else {
							$(".submit").removeAttr("disabled");
							$("#file0").css('color', 'green');
							$("#file0").css('box-shadow', '0 0 5px #5cd053');
							$("#file0")
									.css('background',
											'#fff url(/BoMa/img/valid.png) no-repeat 98% center');
							$("#file0").css('border-color', '#28921f');
						}

						var objUrl = getObjectURL(file);
						console.log("objUrl = " + objUrl);
						if (objUrl) {
							$("#img0").attr("src", objUrl);
						}
					});

	/**
	 * 建立一個可存取到該file的url
	 */
	function getObjectURL(file) {
		var url = null;
		if (window.createObjectURL != undefined) { // basic
			url = window.createObjectURL(file);
		} else if (window.URL != undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file);
		} else if (window.webkitURL != undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	}
	/**
	 * @TODO 检查添加行业名字是否重复
	 */
	$('.inputTrade').bind("input propertychange", function() {
		var name = $('.inputTrade').val();
		if ("" == name.trim()) {
			$('.inputTrade').val("");
		}
		// alert(name);
		$.ajax({
			url : "/BoMa/trade/checkTradeName",
			method : "post",
			data : {
				"name" : name
			},
			success : function(data) {
				if ('true' == data) {
					$('.checkTradeName').html("该行业已存在");
					$('.checkTradeName').css('color', 'red');
					$('.submit').css('color', 'red');
					$('.submit').attr('disabled', true);
				} else {
					$('.checkTradeName').html("");
					$('.submit').removeAttr('disabled');
					$('.submit').css('color', 'white');

				}
			}
		});
	});
	/**
	 * 负责人评语不为空格, 负责人姓名不为空格
	 */
	$(".comment").bind("input propertychange", function() {
		if ("" == $(this).val().trim())
			$(this).val("");
	})
	$(".managerName").bind("input propertychange", function() {
		if ("" == $(this).val().trim())
			$(this).val("");
	})

	/**
	 * @TODO 检查公司名是否重复
	 */
	var initialVal = $('.inputCompany').val();
	$('.inputCompany').bind("input propertychange", function() {
		var name = $('.inputCompany').val();
		if ("" == name.trim()) {
			$('.inputCompany').val("");
		}
		if (initialVal != name) {
			var params = {};
			params.name = name;
			$.ajax({
				url : "/BoMa/company/checkCompanyName",
				method : "post",
				dataType : "json",
				data : params,
				success : function(data) {
					if ("true" == data.result) {
						$('.checkCompanyName').html("该公司已存在");
						$('.checkCompanyName').css('color', 'red');
						$('.submit').css('color', 'red');
						$('.submit').attr('disabled', true);
					} else {
						$('.checkCompanyName').html("");
						$('.submit').removeAttr('disabled');
						$('.submit').css('color', 'white');

					}
				}
			});
		} else {
			$('.checkCompanyName').html("");
			$('.submit').removeAttr('disabled');
			$('.submit').css('color', 'white');
		}
	});
});

/**
 * @TODO 更新负责人实现的跳转
 */
function updateManagerById(id) {
	window.location = "/BoMa/manager/updateManagerById/" + id;
};

/**
 * @TODO 取消显示口碑印证
 */
function removePraise(id, currentPage) {
	if (confirm("是否取消显示该口碑印证?")) {
		var removeTr = $('.manager' + id);
		var params = {};
		params.id = id;
		$
				.ajax({
					url : "/BoMa/manager/removeIsPraise",
					method : "post",
					dataType : "json",
					data : params,
					success : function(data) {
						if ('true' == data.result) {
							removeTr.remove();
							// 重新生成页码
							$
									.ajax({
										url : "/BoMa/manager/getTotalPageIsPraise",
										method : "post",
										dataType : "json",
										success : function(data) {
											if (data.result != "false") {
												total = data.result;
												if (total < currentPage) {
													currentPage = total;
												}

												$('#light-pagination')
														.pagination(
																{
																	pages : total,
																	currentPage : currentPage,
																	cssStyle : 'light-theme'
																});

												// 重新加载当前页面的数据
												$
														.ajax({
															url : "/BoMa/manager/getManagerIsPraiseAjax?currentPage="
																	+ currentPage,
															method : "post",
															dataType : "json",
															success : function(
																	data) {
																if (data.result != "false") {
																	$(
																			"#tbodyManager")
																			.html(
																					"");
																	var list = data.result;
																	var CompanyName;
																	var value = "";
																	var alt="";
																	for (var i = 0; i < list.length; i++) {
																		if(i%2==0){
																			alt="alt-row";
																		} else {
																			alt="";
																		}
																		if (list[i].company.parentCompany != null) {
																			CompanyName = list[i].company.parentCompany.name
																					+ "&"
																					+ list[i].company.name;
																		} else {
																			CompanyName = list[i].company.name;
																		}
																		value += "<tr class=\"manager"
																				+ list[i].id +" "+alt
																				+ "\">"
																				+ "<td><img src=\"/pic/"
																				+ list[i].company.logo.img
																				+ "\" width=\"100px\" /></td>"
																				+ "<td>"
																				+ CompanyName
																				+ "</td>"
																				+ "<td>"
																				+ list[i].name
																				+ "</td>"
																				+ "<td>"
																				+ list[i].comment
																				+ "</td>"
																				+ "<td><a href=\"javascript:void(0);\" title=\"取消显示\" onclick=\"removePraise("
																				+ list[i].id
																				+ ","
																				+ currentPage
																				+ ")\"> <img alt=\"取消显示\""
																				+ "src=\"/BoMa/img/imagesN/icons/cross_circle.png\"></a>"
																				+ "<a href=\"javascript:void(0);\" title=\"修改\" onclick=\"updateManagerById("
																				+ list[i].id
																				+ ")\"> <img "
																				+ "src=\"/BoMa/img/imagesN/icons/pencil.png\" alt=\"修改\" /></a></td></tr>";
																	}
																	$(
																			"#tbodyManager")
																			.html(
																					value);

																} else {
																	alert("失败!!!!");
																}
															}
														});
											} else {
												alert("加载页数失败了");
											}
										}
									});
						} else {
							alert("o.o");
						}
					}
				});
	} else {

	}
};
