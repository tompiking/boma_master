function updatePersonAfter(pageNumber) {
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
					cssStyle: 'light-theme',
					currentPage : pageNumber
				});
			} else {
				alert("加载页数失败了");
			}
		}
	});
}
function deletePerson(id,pageNumber) {
	if(!confirm("你确定要在页面中删除此条信息吗")) {
		return;	
	}
	var removeRec = $('.person' + id);
	$.ajax({
		url : "/BoMa/person/deleteAjax",
		method : "post",
		dataType : "json",
		data : {
			id : id,
			pagesize : 6,
			pageno : pageNumber
		},
		success : function(data) {
			if (data.success) {
				removeRec.remove();
				//获取
				$.ajax({
					url : "/BoMa/person/pageQueryAjax",
					method:"get",
					dataType:"json",
					data : {
						pagesize : 6
					},
					beforeSend : function(){
						return true;
					},
					success:function(data){
						if(data.success) {
							total=data.object.totalno;
							var currentPg = 1;
							var realurl = "";
							if(total < pageNumber) {
								currentPg = total;
							} else {
								currentPg = pageNumber;
							}
							$('#light-pagination').pagination({
								pages:total,
								cssStyle: 'light-theme',
								currentPage:currentPg
							});
							$.ajax({
								url:"/BoMa/person/pageQuery",
								method : "get",
								dataType:"json",
								data : {
									pageno : currentPg,
									pagesize : 6
								},
								beforeSend : function(){
									return true;
								},
								success:function(data){
									if(data.success) {
										var pageObj = data.object;
										var personList = pageObj.datas;
										var totalsize = pageObj.totalsize;
										var totalno = pageObj.totalno;
										var currentno = pageObj.currentno;
										var context = "";
										var alt = "";
										$.each(personList,function(i,person){
											var gender = "女";
											if(person.gender){
												gender = "男";
											}
											var birthdayMilliseconds = parseInt(person.birth);
											var birth = new Date(birthdayMilliseconds);
											var birthday = birth.format("yyyy-MM-dd");
											if (i % 2 == 0) {
												alt = "alt-row";
											} else {
												alt = "";
											}
											context +="<tr class=\""+alt + "\">";
											context +="<td>"+person.name+"<a href=\"/BoMa/person/lookInfo?id="+person.id+"\" title=\"查看详情\">"
													+"<img src=\"/BoMa/img/imagesN/icons/look_info.png\" alt=\"LookInfo\" /></a> </td>";
											context +="<td>"+gender+"</td>";
											context +="<td>"+birthday+"</td>";
											context +="<td>"+person.educational+"</td>";
											context +="<td>"+person.registry+"</td>";
											context +="<td><a href=\"/BoMa/person/edit?id="+person.id+"\" title=\"编辑\">"
													+"<img src=\"/BoMa/img/imagesN/icons/pencil.png\" alt=\"Edit\" /></a>";
											context +="<a href=\"javascript:void(0)\" title=\"删除\">"
													+"<img src=\"/BoMa/img/imagesN/icons/cross.png\" alt=\"Delete\" onclick=\"deletePerson("
													+person.id+","+currentno+")\"/></a>	</td>";
											context +="</tr>";
										});
										$("#tbodyPerson").html(context);
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
function deleteRecommend(id,pageNumber) {
	if(!confirm("你确定要在页面中删除此条信息吗")) {
		return;	
	}
	var removeRec = $('.recommend' + id);
	$.ajax({
		url : "/BoMa/recommend/deleteAjax",
		method : "post",
		dataType : "json",
		data : {
			id : id,
			pagesize : 6,
			pageno : pageNumber
		},
		success : function(data) {
			if (data.success) {
				removeRec.remove();
				//获取
				$.ajax({
					url : "/BoMa/recommend/pageQueryAjax",
					method:"get",
					dataType:"json",
					data : {
						pagesize : 6
					},
					beforeSend : function(){
						return true;
					},
					success:function(data){
						if(data.success) {
							total=data.object.totalno;
							var currentPg = 1;
							var realurl = "";
							
							if(total < pageNumber) {
								currentPg = total;
							} else {
								currentPg = pageNumber;
							}
							$('#light-pagination').pagination({
								pages:total,
								cssStyle: 'light-theme',
								currentPage:currentPg
							});
							$.ajax({
								url:"/BoMa/recommend/pageQuery",
								method : "get",
								dataType:"json",
								data : {
									pageno : currentPg,
									pagesize : 6
								},
								beforeSend : function(){
									return true;
								},
								success:function(data){
									if(data.success) {
										var pageObj = data.object;
										var recommendList = pageObj.datas;
										var totalsize = pageObj.totalsize;
										var totalno = pageObj.totalno;
										var currentno = pageObj.currentno;
										var context = "";
										var alt = "";
										$.each(recommendList,function(i,recommend){
											if (i % 2 == 0) {
												alt = "alt-row";
											} else {
												alt = "";
											}
											context +="<tr class=\""+alt + "\">";
											context +="<td>"+recommend.job.name+"</td>";
											context +="<td>"+recommend.person.name+"</td>";
											context +="<td><a href=\"/BoMa/recommend/lookInfo?id="+recommend.id+"\" title=\"查看详情\">"
													+"<img src=\"/BoMa/img/imagesN/icons/look_info.png\" alt=\"LookInfo\" /></a></td>";
											context +="<td><a href=\"/BoMa/recommend/edit?id="+recommend.id+"\" title=\"编辑\">"
													+"<img src=\"/BoMa/img/imagesN/icons/pencil.png\" alt=\"Edit\" /></a>";
											context +="<a href=\"javascript:void(0)\" title=\"删除\">"
												+"<img src=\"/BoMa/img/imagesN/icons/cross.png\" alt=\"Delete\" onclick=\"deleteRecommend("
												+recommend.id+","+currentno+")\"/></a>	</td>";
											context +="</tr>";
										});
										$("#tBodyRecommend").html(context);
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
$(document).ready(function() {
	$("#recommendInserForm").ajaxForm({
		beforeSubmit : function() {
			if ($("select[name='job.id']").val()<= 0) {
				alert("不能输入没有存在的岗位，您可以先添加，再处理");
				return false;
			}
			if ($("select[name='person.id']").val()<= 0) {
				alert("不能输入没有存在的被推荐人，您可以先添加，再处理");
				return false;
			}
			if (!$("input[name='recommend.isShow']").is(":checked")) {
				alert("是否展示没有输入");
				return false;
			}
			return true;
		},
		success : function(r) {
			if (r.success) {
				alert("推荐信息添加成功");
				window.location.href="/BoMa/recommend/listAll"; 
			} else {
				alert("推荐信息添加失败");
			}
		}
	});
	$("#addRecommendBtn").click(function() {
		$("#recommendInserForm").submit();
	});
});
$(document).ready(function() {
	$("#recommendUpdateForm").ajaxForm({
		beforeSubmit : function() {
			if ($("select[name='job.id']").val() <= 0) {
				alert("不能输入没有存在的岗位，您可以先添加，再处理");
				return false;
			}
			if (!$("input[name='recommend.isShow']").is(":checked")) {
				alert("是否展示没有输入");
				return false;
			}
			if ($("input[name='person.name']").val().length <= 0) {
				alert("姓名没有输入");
				return false;
			}
			if (isNull($("input[name='person.birth']").val())) {
				alert("出生年月没有输入");
				return false;
			} else {
				var DATE_FORMAT = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
				if (!DATE_FORMAT.test($("input[name='person.birth']").val())) {
					alert("抱歉，您输入的日期格式有误，正确格式应为:2012-01-01");
					return false;
				}
			}
			if (!$("input[name='person.gender']").is(":checked")) {
				alert("性别没有输入");
				return false;
			}
			if (!$("input[name='person.marry']").is(":checked")) {
				alert("婚姻状况没有输入");
				return false;
			}
			if (isNull($("input[name='person.educational']").val())) {
				alert("学历没有输入");
				return false;
			}
			if (isNull($("input[name='person.registry']").val())) {
				alert("籍贯没有输入");
				return false;
			}
			if (isNull($("input[name='person.height']").val())) {
				alert("身高没有输入");
				return false;
			}
			if (isNull($("input[name='person.domicile']").val())) {
				alert("现在所在地没有输入");
				return false;
			}
			if ($("textarea[name='person.description']").val().length <= 0) {
				alert("个人评价没有输入");
				return false;
			}
			if ($("textarea[name='person.requireJob']").val().length <= 0) {
				alert("希望岗位没有输入");
				return false;
			}
			return true;
		},
		success : function(r) {
			if (r.success) {
				alert("推荐人信息修改成功");
				window.location.href="/BoMa/recommend/listAll";
			} else {
				alert("推荐人信息修改失败");
			}
		}
	});
	$("#updateRecommendBtn").click(function() {
		$("#recommendUpdateForm").submit();
		return false;
	});
	$("#cancelUpdateRecommendBtn").click(function() {
		$.get("/BoMa/recommend/cancel",
				{ id: $("input[name='recommend.id']").val() },
				function(data){
					$("input[name='job.name']").val(data.object.job.name);
					var isShow = "1";
					if(!data.object.isShow) isShow="0";
					$("input[name='recommend.isShow']").each(function(index) {
					    if ($("input[name='recommend.isShow']").get(index).value == isShow) {
					        $("input[name='recommend.isShow']").get(index).checked = true;
					    }
					});
					$("input[name='person.name']").val(data.object.person.name);
					var birthdayMilliseconds = parseInt(data.object.person.birth);
					var birth = new Date(birthdayMilliseconds);
					var birthday = birth.format("yyyy-MM-dd");
					$("input[name='person.birth']").val(birthday);
					var gender = "1";
					if(!data.object.person.birth) gender="0";
					$("input[name='person.gender']").each(function(index) {
					    if ($("input[name='person.gender']").get(index).value == gender) {
					        $("input[name='person.gender']").get(index).checked = true;
					    }
					});
					var marry = "1";
					if(!data.object.person.birth) marry="0";
					$("input[name='person.marry']").each(function(index) {
					    if ($("input[name='person.marry']").get(index).value == marry) {
					        $("input[name='person.marry']").get(index).checked = true;
					    }
					});
					$("input[name='person.educational']").val(data.object.person.educational);
					$("input[name='person.registry']").val(data.object.person.registry);
					$("input[name='person.height']").val(data.object.person.height);
					$("input[name='person.domicile']").val(data.object.person.domicile);
					$("textarea[name='person.description']").val(data.object.person.description);
					$("textarea[name='person.requireJob']").val(data.object.person.requireJob);
				});
	});
});
$(document).ready(function() {
	$("#personInsertForm").ajaxForm({
		beforeSubmit : function() {
			if(isNull($("input[name='name']").val())){
				alert("姓名没有输入或者输入都为空格");
				return false;
			}
			if(isNull($("input[name='birth']").val())){
				alert("出生日期没有输入或者输入都为空格");
				return false;
			}else{
	            var DATE_FORMAT = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;    
				if(!DATE_FORMAT.test($("input[name='birth']").val())){
					alert("抱歉，您输入的日期格式有误，正确格式应为:2012-01-01");
				    return false;
				}
			}
			if(!$("input[name='gender']").is(":checked")){
				alert("性别没有输入");
				return false;
			}
			if(!$("input[name='marry']").is(":checked")){
				alert("婚姻状况没有输入");
				return false;
			}
			if(isNull($("input[name='educational']").val())){
				alert("学历没有输入或者输入都为空格");
				return false;
			}
			if(isNull($("input[name='registry']").val())){
				alert("籍贯没有输入或者输入都为空格");
				return false;
			}
			if(isNull($("input[name='height']").val())){
				alert("身高没有输入或者输入都为空格");
				return false;
			}
			if(isNull($("input[name='domicile']").val())){
				alert("现在所在地没有输入或者输入都为空格");
				return false;
			}
			if($("textarea[name='description']").val().length<=0){
				alert("个人评价没有输入");
				return false;
			}
			if($("textarea[name='requireJob']").val().length<=0){
				alert("希望岗位没有输入");
				return false;
			}
			return true;
		},
		success : function(r) {
			if (r.success) {
				alert("用户保存成功");
				window.location.href="/BoMa/person/list"; 
			} else {
				alert("用户保存失败");
			}
		}
	});
	$("#addPersonBtn").click(function() {
		$("#personInsertForm").submit();
		return false;
	});
	$("#backToListBtn").click(function() {
		window.location.href = "list";
	});
});
$(document).ready(function() {
	$("#personUpdateForm").ajaxForm({
		beforeSubmit : function() {
			if(isNull($("input[name='name']").val())){
				alert("姓名没有输入或者都为空格");
				return false;
			}
			if(isNull($("input[name='birth']").val())){
				alert("出生年月没有输入或者都为空格");
				return false;
			}else{
	            var DATE_FORMAT = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;    
				if(!DATE_FORMAT.test($("input[name='birth']").val())){
					alert("抱歉，您输入的日期格式有误，正确格式应为:2012-01-01");
				    return false;
				}
			}
			if(!$("input[name='gender']").is(":checked")){
				alert("性别没有输入");
				return false;
			}
			if(!$("input[name='marry']").is(":checked")){
				alert("婚姻状况没有输入");
				return false;
			}
			if(isNull($("input[name='educational']").val())){
				alert("学历没有输入");
				return false;
			}
			if(isNull($("input[name='registry']").val())){
				alert("户籍所在地没有输入或者都为空格");
				return false;
			}
			if(isNull($("input[name='height']").val())){
				alert("身高没有输入或者都为空格");
				return false;
			}
			if(isNull($("input[name='domicile']").val())){
				alert("现在所在地没有输入或者都为空格");
				return false;
			}
			if($("textarea[name='description']").val().length<=0){
				alert("个人评价没有输入");
				return false;
			}
			if($("textarea[name='requireJob']").val().length<=0){
				alert("希望岗位没有输入");
				return false;
			}
			return true;
		},
		success : function(r) {
			if (r.success) {
				alert("推荐人信息修改成功");
				window.location.href="/BoMa/person/list"; 
			} else {
				alert("推荐人信息修改失败");
			}
		}
	});
	$("#updatePersonBtn").click(function() {
		$("#personUpdateForm").submit();
		return false;
	});
	$("#cancelUpdatePersonBtn").click(function() {
		$.get("/BoMa/person/cancel",
				{ id: $("#id").val() },
				function(data){
					$("input[name='name']").val(data.object.name);
					var birthdayMilliseconds = parseInt(data.object.birth);
					var birth = new Date(birthdayMilliseconds);
					var birthday = birth.format("yyyy-MM-dd");
					$("input[name='birth']").val(birthday);
					var gender = "1";
					if(!data.object.gender) gender="0";
					$("input[name='gender']").each(function(index) {
					    if ($("input[name='gender']").get(index).value == gender) {
					        $("input[name='gender']").get(index).checked = true;
					    }
					});
					var marry = "1";
					if(!data.object.marry) marry="0";
					$("input[name='marry']").each(function(index) {
					    if ($("input[name='marry']").get(index).value == marry) {
					        $("input[name='marry']").get(index).checked = true;
					    }
					});
					$("input[name='educational']").val(data.object.educational);
					$("input[name='registry']").val(data.object.registry);
					$("input[name='height']").val(data.object.height);
					$("input[name='domicile']").val(data.object.domicile);
					$("textarea[name='description']").val(data.object.description);
					$("textarea[name='requireJob']").val(data.object.requireJob);
				});
	});
});
/**
 * 日期格式为yyyy-MM-dd
 */
Date.prototype.format = function(fmt) { 
    var o = { 
       "M+" : this.getMonth()+1,                 //月份 
       "d+" : this.getDate(),                    //日 
       "h+" : this.getHours(),                   //小时 
       "m+" : this.getMinutes(),                 //分 
       "s+" : this.getSeconds(),                 //秒 
       "q+" : Math.floor((this.getMonth()+3)/3), //季度 
       "S"  : this.getMilliseconds()             //毫秒 
   }; 
   if(/(y+)/.test(fmt)) {
           fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
   }
    for(var k in o) {
       if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
   return fmt; 
};
function isNull( str ){
	if ( str == "" ) return true;
	var regu = "^[ ]+$";
	var re = new RegExp(regu);
	return re.test(str);
}
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
		$(this).css("background","#fff");
		$(this).css("box-shadow","0px 0px 3px #ccc, 0 10px 15px #eee inset");
		$(this).css("border","1px solid #aaa");
	}
});