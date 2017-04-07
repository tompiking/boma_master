$(document).ready(
		function() {
			$("#test").click(
					function() {
						alert("test!");
						$.post("/BoMa/job/getOtherJobs/"
								+ $("#selecttrade").val(), function(data) {
							$("#otherjobspan").html("没有岗位");
							var html = "<option value='0'>请选择</option>";
							var da = eval("(" + data + ")");
							for (var i = 0; i < da.length; i++) {
								html += "<option class='otherjob" + da[i].id
										+ "'value='" + da[i].id + "'>"
										+ da[i].name + "</option>";
							}
							if (html == "<option value='0'>请选择</option>") {
								$("#otherjobspan").show();
							} else {
								$("#otherjobspan").hide();
							}
							if ($("#selecttrade").val() == 0) {
								$("#otherjobspan").hide();
								var html = "<option value='0'>请先选择行业</option>";
							}
							$("#otherjob").html(html);
						})
					});
		});

// add.jsp
$(document).ready(
		// ----------------------------------------
		function() {
			$("#select1").change(
					function() {
						$.post("http://localhost:8080/" + "BoMa/job/listjob/"
								+ $("#select1").val(), function(data) {
							$("#spjob").html("没有岗位");
							var html = "<option value='0'>请选择</option>";
							var da = eval("(" + data + ")");
							for (var i = 0; i < da.length; i++) {
								html += "<option class='com" + da[i].id
										+ "'value='" + da[i].id + "'>"
										+ da[i].name + "</option>";
							}
							if (html == "<option value='0'>请选择</option>") {
								$("#spjob").show();
							} else {
								$("#spjob").hide();
							}
							if ($("#select1").val() == 0) {
								$("#spjob").hide();
								html = "<option value='0'>请先选择行业</option>";
							}
							$("#selectjob").html(html);
						});

						$.post("http://localhost:8080"
								+ "/BoMa/company/listcompany/"
								+ $("#select1").val(), function(data) {
							$("#spcom").html("没有公司");
							var html = "<option value='0'>请选择</option>";
							var da = eval("(" + data + ")");
							for (var i = 0; i < da.length; i++) {
								html += "<option class='com" + da[i].id
										+ "'value='" + da[i].id + "'>"
										+ da[i].name + "</option>";
							}
							if (html == "<option value='0'>请选择</option>") {
								$("#spcom").show();
							} else {
								$("#spcom").hide();
							}
							if ($("#select1").val() == 0) {
								$("#spcom").hide();
								var html = "<option value='0'>请先选择行业</option>";
							}
							$("#selectcompany").html(html);
						})
					})
		});

function addCompany(id) {
	var deleteP = $('.com' + id);
	var params = {};
	params.id = id;
	$.ajax({
		url : "/BoMa/company/add",
		dataType : "json",
		data : params,
		success : function(data) {
			if ("true" == data.result) {
				alert("添加成功");
				deleteP.remove();
				$(".custom-combobox-input5").val("请选择");
			} else {
				console.log("错了");
			}
		}
	})
}
function addJob(id) {
	var deleteP = $('.job' + id);
	var params = {};
	params.id = id;
	$.ajax({
		url : "/BoMa/job/addJob",
		dataType : "json",
		data : params,
		success : function(data) {
			if ("true" == data.result) {
				alert("添加成功");
				deleteP.remove();
				$(".custom-combobox-input4").val("请选择");
			} else {
				alert("请勿重复添加");
			}
		}
	})
}
// trade_admin.jsp
function deletebyIds(jid, tid) {
	if (!confirm("确定删除？")) {
		return;
	}
	var deleteP = $('.job' + jid + tid);
	var params = {};
	params.jid = jid;
	params.tid = tid;
	$.ajax({
		url : "/BoMa/job/deleteJobById",
		dataType : "json",
		data : params,
		success : function(data) {
			if ("true" == data.result) {
				deleteP.remove();
			} else {
				console.log("错了");
			}
		}
	});
}
function delectCompany(id) {
	if (!confirm("确定删除？")) {
		return;
	}
	var deleteC = $('.company' + id);
	var deleteP = $('.img' + id);
	var params = {};
	params.id = id;
	$.ajax({
		url : "/BoMa/company/deleteCompany",
		dataType : "json",
		data : params,
		success : function(data) {
			if ("true" == data.result) {
				deleteC.remove();
				deleteP.remove();
			} else {
				console.log("错了");
			}
		}
	});
}

/*
 * /*function delectTrade(id, currentPage) { var deleteT = $('.trade' + id); var
 * params = {}; params.id = id; $.ajax({ url : "/BoMa/trade/deleteTrade",
 * dataType : "json", data : params, success : function(data) { if ("true" ==
 * data.result) { deleteT.remove(); } else { console.log("错了"); } }, error :
 * function() { alert("error"); } }); }
 */
function delectTrade(id, currentPage) {
	if (!confirm("确定删除？")) {
		return;
	}
	var deleteT = $('.trade' + id);
	var params = {};
	params.id = id;
	$
			.ajax({
				url : "/BoMa/trade/deleteTrade",
				dataType : "json",
				data : params,
				success : function(data) {
					if ("true" == data.result) {
						deleteT.remove();
						$
								.ajax({
									url : "/BoMa/case/getTotalPage",
									method : "post",
									dataType : "json",
									success : function(data) {
										if (data.result != "false") {
											total = data.result;
											if (total < currentPage) {
												currentPage = total;
											}
											var realurl = "/BoMa/case/showAll?currentPage="
													+ currentPage
													+ "&totalPage=" + total;
											$('#light-pagination').pagination({
												pages : total,
												cssStyle : 'light-theme'
											});
											$
													.ajax({
														url : realurl,
														method : "post",
														dataType : "json",
														success : function(data) {
															if (data.result != "false") {
																var companies = data.companies;
																var trades = data.trades;
																var jobs = data.jobs;
																var page = data.page;
																var html = "";
																for (var i = 0; i < trades.length; i++) {
																	html += "<li class='trade"
																			+ trades[i].id
																			+ "'><span style='color: gray; font-size: 30px'>服务行业："
																			+ trades[i].name
																			+ "</span>";
																	html += "<button onclick='delectTrade("
																			+ trades[i].id
																			+ ","
																			+ page.currentPage
																			+ ")' class='submit'type='button'>删除</button>";
																	html += "<hr><ul>";
																	html += "<li><ul class='imgul' style='width: 500px;'>"
																	for (var j = 0; j < companies.length; j++) {
																		if (companies[j].trade.name == trades[i].name) {
																			html += "<li class='imgli'style='width: 100px; margin-right: 15px; line-height: 20px;'><img alt='加载失败' src='/pic/"
																					+ companies[j].logo.img
																					+ "' height='100'width='100'></li>";
																		}
																	}
																	html += "</ul></li><li><span style='color: gray; font-size: 20px'>服务客户：</span><ul>";
																	for (var j = 0; j < companies.length; j++) {
																		if (companies[j].trade.name == trades[i].name) {
																			html += "<li><p class='"
																					+ companies[j].id
																					+ "'>"
																					+ companies[j].name
																					+ ",";
																			html += "<img alt='加载失败'src='http://localhost:8080/BoMa/img/imagesN/icons/cross.png'onclick='delectCompany("
																					+ companies[j].id
																					+ ")'></p></li>";
																		}
																	}
																	html += "</ul></li><li><span style='color: gray; font-size: 20px'>服务岗位：</span><ul>";
																	for (var j = 0; j < jobs.length; j++) {
																		if (jobs[j].trade.name == trades[i].name) {
																			html += "<li><p class='job"
																					+ jobs[j].job.id
																					+ trades[i].id
																					+ "'>"
																					+ jobs[j].job.name
																					+ ",";
																			html += "<img alt='加载失败'src='http://localhost:8080/BoMa/img/imagesN/icons/cross.png'onclick='deletebyIds("
																					+ jobs[j].job.id
																					+ ","
																					+ trades[i].id
																					+ ")'></p></li>";
																		}
																	}
																	html += "</ul></li></ul><hr id='one'></li>";
																}
																$("#selectul")
																		.html(
																				html);
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
						console.log("错了");
					}
				},
				error : function() {
					alert("error");
				}
			});
}
function selectAdd(tid, jid) {
	var deleteC = $('.otherjob' + jid);
	var params = {};
	params.tid = tid;
	params.jid = jid;
	$.ajax({
		url : "/BoMa/job/selectAdd",
		dataType : "json",
		data : params,
		success : function(data) {
			if ("true" == data.result) {
				alert("添加成功");
				deleteC.remove();
				$(".custom-combobox-input2").val("请选择");
			} else {
				console.log("错了");
			}
		}
	});
};

function inputAdd(id, name) {
	var params = {};
	params.id = id;
	params.name = name;
	$
			.post({
				url : "/BoMa/job/inputAdd",
				dataType : "json",
				data : params,
				success : function(data) {
					if ("true" == data.result) {
						alert("添加成功");
					} else {
						alert("已拥有当前岗位");
						$("#inputjob")
								.css('background',
										'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
						$("#inputjob").css('box-shadow', '0 0 5px #d45252');
						$("#inputjob").css('border-color', '#b03535');
					}
				}
			});
};