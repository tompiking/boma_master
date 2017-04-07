(function($) {
	$
			.widget(
					"custom.combobox3",
					{
						_create : function() {
							this.wrapper = $("<span>").addClass(
									"custom-combobox")
									.insertAfter(this.element);

							this.element.hide();
							this._createAutocomplete();
							this._createShowAllButton();
						},

						_createAutocomplete : function() {
							var selected = this.element.children(":selected"), value = selected
									.val() ? selected.text() : "";

							this.input = $("<input>")
									.appendTo(this.wrapper)
									.val(value)
									.attr("title", "")
									.addClass(
											"custom-combobox-input3 ui-widget ui-widget-content ui-state-default ui-corner-left")
									.autocomplete({
										delay : 0,
										minLength : 0,
										source : $.proxy(this, "_source")
									}).tooltip({
										tooltipClass : "ui-state-highlight"
									});

							this._on(this.input, {
								autocompleteselect : function(event, ui) {
									ui.item.option.selected = true;
									this._trigger("select", event, {
										item : ui.item.option
									});
								},

								autocompletechange : "_removeIfInvalid"
							});
						},

						_createShowAllButton : function() {
							var input = this.input, wasOpen = false;

							$("<a>").attr("tabIndex", -1).attr("title",
									"Show All Items").tooltip().appendTo(
									this.wrapper).button({
								icons : {
									primary : "ui-icon-triangle-1-s"
								},
								text : false
							}).removeClass("ui-corner-all").addClass(
									"custom-combobox-toggle ui-corner-right")
									.mousedown(
											function() {
												wasOpen = input.autocomplete(
														"widget")
														.is(":visible");
											}).click(function() {
										input.focus();

										// 如果已经可见则关闭
										if (wasOpen) {
											return;
										}

										// 传递空字符串作为搜索的值，显示所有的结果
										input.autocomplete("search", "");
									});
						},

						_source : function(request, response) {
							var matcher = new RegExp($.ui.autocomplete
									.escapeRegex(request.term), "i");
							response(this.element.children("option").map(
									function() {
										var text = $(this).text();
										if (this.value
												&& (!request.term || matcher
														.test(text)))
											return {
												label : text,
												value : text,
												option : this
											};
									}));
						},

						_removeIfInvalid : function(event, ui) {

							// 选择一项，不执行其他动作
							if (ui.item) {
								return;
							}

							// 搜索一个匹配（不区分大小写）
							var value = this.input.val(), valueLowerCase = value
									.toLowerCase(), valid = false;
							this.element
									.children("option")
									.each(
											function() {
												if ($(this).text()
														.toLowerCase() === valueLowerCase) {
													this.selected = valid = true;
													return false;
												}
											});

							// 找到一个匹配，不执行其他动作
							if (valid) {
								return;
							}

							// 移除无效的值
							this.input.val("").attr("title",
									value + " didn't match any item").tooltip(
									"open");
							this.element.val("");
							this._delay(function() {
								this.input.tooltip("close").attr("title", "");
							}, 2500);
							this.input.data("ui-autocomplete").term = "";
						},

						_destroy : function() {
							this.wrapper.remove();
							this.element.show();
						}
					});
})(jQuery);

$(function() {
	$("#select1")
			.combobox3(
					{
						select : function() {
							$(".custom-combobox-input3").css('box-shadow',
									'0 0 5px #5cd053');
							$(".custom-combobox-input3")
									.css('background',
											'#fff url(/BoMa/img/valid.png) no-repeat 98% center');
							$(".custom-combobox-input3").css('border-color',
									'#28921f');
							$(".custom-combobox-input4").css('box-shadow',
									'0 0 5px #5cd053');
							$(".custom-combobox-input4")
									.css('background',
											'#fff url(/BoMa/img/valid.png) no-repeat 98% center');
							$(".custom-combobox-input4").css('border-color',
									'#28921f');
							$(".custom-combobox-input5").css('box-shadow',
									'0 0 5px #5cd053');
							$(".custom-combobox-input5")
									.css('background',
											'#fff url(/BoMa/img/valid.png) no-repeat 98% center');
							$(".custom-combobox-input5").css('border-color',
									'#28921f');
							$
									.post(
											"http://localhost:8080/"
													+ "BoMa/job/listjob/"
													+ $("#select1").val(),
											function(data) {
												var html = "<option value='0'>请选择</option>";
												var da = eval("(" + data + ")");
												for (var i = 0; i < da.length; i++) {
													html += "<option class='job"
															+ da[i].id
															+ "'value='"
															+ da[i].id
															+ "'>"
															+ da[i].name
															+ "</option>";
												}
												if (html == "<option value='0'>请选择</option>") {
													$(".custom-combobox-input4")
															.css('background',
																	'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
													$(".custom-combobox-input4")
															.css('box-shadow',
																	'0 0 5px #d45252');
													$(".custom-combobox-input4")
															.css(
																	'border-color',
																	'#b03535');
												}
												if ($("#select1").val() == 0) {
													html = "<option value='0'>请先选择行业</option>";
												}
												$("#selectjob").html(html);
											});

							$
									.post(
											"http://localhost:8080"
													+ "/BoMa/company/listcompany/"
													+ $("#select1").val(),
											function(data) {
												var html = "<option value='0'>请选择</option>";
												var da = eval("(" + data + ")");
												for (var i = 0; i < da.length; i++) {
													html += "<option class='com"
															+ da[i].id
															+ "'value='"
															+ da[i].id
															+ "'>"
															+ da[i].name
															+ "</option>";
												}
												if (html == "<option value='0'>请选择</option>") {
													$(".custom-combobox-input5")
															.css('background',
																	'#fff url(/BoMa/img/invalid.png) no-repeat 98% center');
													$(".custom-combobox-input5")
															.css('box-shadow',
																	'0 0 5px #d45252');
													$(".custom-combobox-input5")
															.css(
																	'border-color',
																	'#b03535');
												}
												if ($("#select1").val() == 0) {
													var html = "<option value='0'>请先选择行业</option>";
												}
												$("#selectcompany").html(html);
											});
						}
					});
});