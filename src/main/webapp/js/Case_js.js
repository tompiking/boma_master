$(document).ready(function() {
	if ($("#otherjob").val() == 0) {
		$("#inputjob").html("请先选择行业");
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
	
	$("#jbtn").click(function() {
		if ($("#select1").val() == 0) {
			$(".custom-combobox-input3")
					.css('background',
							'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
			$(".custom-combobox-input3").css(
					'box-shadow',
					'0 0 5px #d45252');
			$(".custom-combobox-input3").css(
					'border-color', '#b03535')
		} else if ($("#selectjob").val() == 0) {
			$(".custom-combobox-input4")
					.css('background',
							'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
			$(".custom-combobox-input4").css(
					'box-shadow',
					'0 0 5px #d45252');
			$(".custom-combobox-input4").css(
					'border-color', '#b03535');
		} else {
			addJob($("#selectjob").val());
		}
	});

	$("#cbtn").click(function() {
		if ($("#select1").val() == 0) {
			$(".custom-combobox-input3")
					.css('background',
							'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
			$(".custom-combobox-input3").css(
					'box-shadow',
					'0 0 5px #d45252');
			$(".custom-combobox-input3").css(
					'border-color', '#b03535')
		} else if ($("#selectcompany").val() == 0) {
			$(".custom-combobox-input5")
					.css('background',
							'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
			$(".custom-combobox-input5").css(
					'box-shadow',
					'0 0 5px #d45252');
			$(".custom-combobox-input5").css(
					'border-color', '#b03535');
		} else {
			addCompany($("#selectcompany")
					.val());
		}
	});
	
	//submit case check
	$("#selectadd").click(function() {
		//cancel warning input box is null style
		$("#inputjob").css('background','');
		$("#inputjob").css('box-shadow','');
		$("#inputjob").css('border-color','');
		//cancel warning select box is 0 style
		$(".custom-combobox-input2").css('background','');
		$(".custom-combobox-input2").css('box-shadow','');
		$(".custom-combobox-input2").css('border-color', '');
		
		if ($("#selecttrade").val() == 0) {
			$(".custom-combobox-input")
					.css('background',
							'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
			$(".custom-combobox-input").css(
					'box-shadow',
					'0 0 5px #d45252');
			$(".custom-combobox-input").css(
					'border-color', '#b03535');
		} else if ($("#otherjob").val() != 0) {
			selectAdd($("#selecttrade").val(),$("#otherjob").val());
		} else if ($("#inputjob").val() != "") {
			inputAdd($("#selecttrade").val(),$("#inputjob").val());
		} else {
			//warning input box is null style
			$("#inputjob").css('background','#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
			$("#inputjob").css('box-shadow','0 0 5px #d45252');
			$("#inputjob").css('border-color','#b03535');
			//warning select box is 0 style
			$(".custom-combobox-input2").css('background','#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
			$(".custom-combobox-input2").css('box-shadow','0 0 5px #d45252');
			$(".custom-combobox-input2").css('border-color', '#b03535');
		}
	});
	$("#inputjob").change(function() {
		var value = $("#inputjob").val();
		if (value != "") {
			$("#inputjob").css('background',
					'none');
			$("#inputjob").css('box-shadow',
					'0 0 5px #5cd053');
			$("#inputjob")
					.css('background',
							'#fff url(/BoMa/img/valid.png) no-repeat 98% center');
			$("#inputjob").css('border-color',
					'#28921f');
		} else {

		}
	});
});

//add.jsp
/*
 * $(document).ready(function() { $("button").click(function(event) {
 * event.stopPropagation(); }); });
 */
function biu(currentPage,totalPage) {
	if (currentPage > 0 && currentPage <= totalPage) {
		window.location.href = "http://localhost:8080/BoMa/case/biu/" + (currentPage);
	}
};
