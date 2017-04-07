/**
 * @Description 删除招聘信息
 */
function deleteRecruit(id,pageNumber) {
	if(!confirm("你确定要在页面中删除此条信息吗")) {
		return;	
	}
	var removeRec = $('.recruit' + id);
	var params = {};
	params.id = id;
	params.isShow = "n";
	// 异步删除招聘信息
	$.ajax({
		url : "/BoMa/recruit/deleteRecruit",
		method : "post",
		dataType : "json",
		data : params,
		success : function(data) {
			// 如果删除招聘信息成功，从页面取消该信息显示
			if ('true' == data.result) {
				removeRec.remove();
				// 删除信息后重新获取总页数
				$.ajax({
					url : "/BoMa/recruit/getTotalPage",
					method:"get",
					dataType:"json",
					success:function(data){
						if(data.result!="false") {
							total=data.result;
							var currentPg = 1;
							var realurl = "";
							// 总页数小于当前页数是将当前页数设置为总页数
							if(total < pageNumber) {
								realurl = "/BoMa/recruit/showAllRecruitsAjax?currentPage="+total+"&totalPage="+total;
								currentPg = total;
							} else {
								realurl = "/BoMa/recruit/showAllRecruitsAjax?currentPage="+pageNumber+"&totalPage="+total;
								currentPg = pageNumber;
							}
							$('#light-pagination').pagination({
								pages:total,
								cssStyle: 'light-theme',
								currentPage:currentPg
							});
							// 重新获取当前页的招聘信息
							$.ajax({
								url:realurl,
								method : "get",
								dataType:"json",
								success:function(data){
									if(data.result!="false") {
										var recruits = data.result;
										var currentPosition = data.currentPosition + 1;
										var value="";
										for(var i=0;i<recruits.length;i++) {
											value +="<table  class=\"recruit"+recruits[i].id+"\"><tr><td style=\"width: 60%\" colspan=\"6\"><h1>"
												+currentPosition+"、"+recruits[i].title+"</h1></td>"						
												+"<td style=\"width: 10%\" colspan=\"1\"><a href=\"/BoMa/recruit/toUpdateRecruit?recruit=" 
												+recruits[i].id+"\"><img alt=\"加载失败\" src=\"../img/imagesN/icons/pencil.png\" /></a></td>"
												+"<td style=\"width: 30%\" colspan=\"3\"><a href=\"javascript:void(0)\">"
												+"<img alt=\"加载失败\" src=\"../img/imagesN/icons/cross.png\" onclick=\"deleteRecruit("
												+recruits[i].id+","+pageNumber+")\"/></a></td></tr>" 
												+"<tr><td colspan=\"10\"><hr style=\"height: 5px; border: none; border-top: 5px ridge green;\"></td></tr>"
												+"<tr><td colspan=\"10\"><h2 class='recruit_h2'>【企业简介】</h2></td></tr>"
												+"<tr><td colspan=\"10\"><p>" + recruits[i].description + "</p></td></tr>"
												+"<tr><td colspan=\"2\" style=\"width: 20%\"><p>年薪:"
												+recruits[i].salary+"</p></td><td colspan=\"8\"><p>工作地:"
												+recruits[i].address+"</p></td></tr>"
												+"<tr><td colspan=\"10\"><br /></tr><tr><td colspan=\"10\"><h2 class='recruit_h2'>岗位职责和要求:</h2></td></tr>"
												+"<tr><td colspan=\"10\"><p>"+recruits[i].requirement+"</p></td></tr></table>";
											currentPosition += 1;
										}
										$("#showRecruits").html(value);
										$("html,body").animate({scrollTop:0}, 500);
									}else {
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
				alert("删除失败");
				return;
			}
		}
	});
};