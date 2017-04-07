var total;
$(function() {
	//异步请求总页数
	$.ajax({
		url : "/BoMa/case/getTotalPage",
		method:"post",
		dataType:"json",
		success:function(data){
			if(data.result!="false") {
				total=data.result;
				$('#light-pagination').pagination({
					pages:total,
					cssStyle: 'light-theme'
				});
			} else {
				alert("加载页数失败了");
			}
		}
	});
});
