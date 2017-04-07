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
});
// add.jsp
/*
 * $(document).ready(function() { $("button").click(function(event) {
 * event.stopPropagation(); }); });
 */
function biu(currentPage,totalPage) {
	if (currentPage > 0 && currentPage <= totalPage) {
		window.location.href = "http://localhost:8080/BoMa/case/biu/"
				+ (currentPage) ;
	}
};
$(document)
		.ready(
				function() {
					$("#jbtn")
							.click(
									function() {
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
				});

$(document)
		.ready(
				function() {
					$("#cbtn")
							.click(
									function() {
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
				});
$("document")
		.ready(
				function() {
					$("#selectadd")
							.click(
									function() {
										if ($("#selecttrade").val() == 0) {
											$(".custom-combobox-input")
													.css('background',
															'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
											$(".custom-combobox-input").css(
													'box-shadow',
													'0 0 5px #d45252');
											$(".custom-combobox-input").css(
													'border-color', '#b03535');
										} else if ($("#otherjob").val() == 0) {
											$(".custom-combobox-input2")
													.css('background',
															'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
											$(".custom-combobox-input2").css(
													'box-shadow',
													'0 0 5px #d45252');
											$(".custom-combobox-input2").css(
													'border-color', '#b03535');
										} else {
											selectAdd($("#selecttrade").val(),
													$("#otherjob").val());
										}
									});
					$("#inputjob")
							.change(
									function() {
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
$("document")
		.ready(
				function() {
					$("#inputadd")
							.click(
									function() {
										if ($("#selecttrade").val() == 0) {
											$(".custom-combobox-input")
													.css('background',
															'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
											$(".custom-combobox-input").css(
													'box-shadow',
													'0 0 5px #d45252');
											$(".custom-combobox-input").css(
													'border-color', '#b03535');
										} else if ($("#inputjob").val() == "") {
											$("#inputjob")
													.css('background',
															'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
											$("#inputjob").css('box-shadow',
													'0 0 5px #d45252');
											$("#inputjob").css('border-color',
													'#b03535');
										} else {
											inputAdd($("#selecttrade").val(),
													$("#inputjob").val());
										}
									});
				});