var total;
$(document).ready(function() {
	$.ajax({
		url : "/BoMa/person/pageQueryAjax",
		method:"post",
		dataType:"json",
		data : {
			pagesize : 6
		},
		beforeSend : function(){
			return true;
		},
		success:function(r){
			if(r.success) {
				total=r.object.totalno;
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