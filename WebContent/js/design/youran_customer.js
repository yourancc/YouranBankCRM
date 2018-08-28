//设置用户名是否存在
function checkCustomerNameExist(custInput, sign) {
	// var name = checkFormItem("customer",$(custInput).val());
	$
			.ajax({
				type : "POST",
				url : "customer_checkName",
				async : false,
				data : {
					"checkItemName" : $(custInput).val()
				},
				success : function(data) {
					var class_attr = "col-md-6 col-sm-6 col-xs-12 form-group has-feedback ";
					if (sign == true) {
						if (data != null && data != "") {
							layer.msg("当前客户名已存在");
							$(custInput).parent().attr("class",
									class_attr + "bad");
						} else {
							$(custInput).parent().attr("class", class_attr);
						}
					} else {
						if (data != null && data != "") {
							$(custInput).parent().attr("class", class_attr);
						} else {
							layer.msg("未找到当前客户");
							$(custInput).parent().attr("class",
									class_attr + "bad");
						}
					}

				}
			});

}

// 将要弹出的层设置为customer_add_div
var cust_add_id;
function customer_add() {
	// 设置列表框
	getOptions("009", "add_customer_source_div",
			"customer.cust_source.dict_id", null);
	getOptions("001", "add_customer_industry_div",
			"customer.cust_industry.dict_id", null);
	getOptions("006", "add_customer_level_div", "customer.cust_level.dict_id",
			null);
	getOptions("005", "add_customer_state_div", "customer.cust_state.dict_id",
			null);
	
	// 弹出添加客户页面
	cust_add_id = layer.open({
		title : false,
		type : 1,
		area : [ '800px', '600px' ],
		shadeClose : true, // 点击遮罩关闭
		content : $('#customer_add_div'),
		closeBtn : 0,
		skin : ''
	});

};
function customer_add_submit() {

	$('#customer_add_div').css("display", "none");
	layer.close(cust_add_id);

	// 显示添加成功通知
	new PNotify({
		title : '通知',
		text : '客户添加成功.',
		type : 'success',
		// stack:{'dir1':'right','dir2':'up','push':'bottom','spacing1':215,'spacing2':25,'context':$('body'),'modal':false},
		addclass : 'stack-bottomright',
		hide : true,
		delay : 1500,
		styling : 'bootstrap3'
	});
};

function cuustomer_add_cancel() {

	$('#customer_add_div').css("display", "none");
	layer.close(cust_add_id)
};

// 将要弹出的层设置为customer_edit_div
var cust_edit_id;
function customer_edit(cur_id) {
	// 获取页面 数据
	var s_edit;
	$
			.post("customer_getCustomerByID", {
				"update_customer_id" : cur_id
			},
					function(edit_customer) {
						s_edit = edit_customer;
						$("#edit_cust_name").attr("value",
								edit_customer.cust_name);
						$("#edit_cust_mobile").attr("value",
								edit_customer.cust_mobile);
						$("#edit_customer_id").attr("value",
								edit_customer.cust_id);

						// 设置列表框
						getOptions("009", "edit_customer_source_div",
								"customer.cust_source.dict_id",
								edit_customer.cust_source.dict_id);
						getOptions("001", "edit_customer_industry_div",
								"customer.cust_industry.dict_id",
								edit_customer.cust_industry.dict_id);
						getOptions("006", "edit_customer_level_div",
								"customer.cust_level.dict_id",
								edit_customer.cust_level.dict_id);
					}, "json");

	// 显示编辑页面
	cust_edit_id = layer.open({
		title : false,
		type : 1,
		area : [ '800px', '600px' ],
		shadeClose : true, // 点击遮罩关闭
		content : $('#customer_edit_div'),
		closeBtn : 0,
		skin : ''
	});

};
function customer_edit_submit() {

	$('#customer_edit_div').css("display", "none");
	layer.close(cust_edit_id);

	// 显示添加成功通知
	new PNotify({
		title : '通知',
		text : '客户修改成功.',
		type : 'success',
		// stack:{'dir1':'right','dir2':'up','push':'bottom','spacing1':215,'spacing2':25,'context':$('body'),'modal':false},
		addclass : 'stack-bottomright',
		hide : true,
		delay : 800,
		styling : 'bootstrap3'
	});
};

function cuustomer_edit_cancel() {

	$('#customer_edit_div').css("display", "none");
	layer.close(cust_edit_id)
};

// 客户分析 图标初始化
function customer_anallse_chart_init() {
	$.post("customer_customerIndustryList", "", function(industryList) {
		// 客户行业分析
		//alert(data);
		if ($('#customer_profession_analyse_id').length) {
			var ctx = document.getElementById("customer_profession_analyse_id");
			var data = {
					datasets: [{
						data: [industryList[0][1], industryList[1][1], industryList[2][1], industryList[3][1], industryList[4][1]],
						backgroundColor: [
							"#455C73",
							"#9B59B6",
							"#BDC3C7",
							"#26B99A",
							"#3498DB"
						],
						label: '行业TOP5'
					}],
					labels: [
						industryList[0][0],
						industryList[1][0],
						industryList[2][0],
						industryList[3][0],
						industryList[4][0]
					]
			};

			var polarArea = new Chart(ctx, {
				data : data,
				type : 'polarArea',
				options : {
					scale : {
						ticks : {
							beginAtZero : true
						}
					}
				}
			});

		}

		
		
	}, "json");


	$.post("customer_customerLevelList", "", function(LevelList) {
		// 客户来源分析
		if ($('#customer_source_analyse_id').length) {

			var ctx = document.getElementById("customer_source_analyse_id");
			var data = {
				datasets : [ {
					data : [ LevelList[0][1], LevelList[1][1], LevelList[2][1] ],
					backgroundColor : [ "#455C73", "#9B59B6", "#BDC3C7" ],
					label : 'My dataset' // for legend
				} ],
				labels : [ LevelList[0][0], LevelList[1][0], LevelList[2][0]]
			};

			var pieChart = new Chart(ctx, {
				data : data,
				type : 'pie',
				otpions : {
					legend : false
				}
			});

		}
	},"json");
	

	// 新增客户分析
	if ($('#customer_add_analyse_id').length) {

		var ctx = document.getElementById("customer_add_analyse_id");
		var mybarChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月" ],
				datasets : [ {
					label : '高价值客户',
					backgroundColor : "#9B59B6",
					data : [ 51, 30, 40, 28, 92, 50, 45 ]
				}, {
					label : '普通客户',
					backgroundColor : "#22B36A",
					data : [ 55, 40, 20, 38, 62, 20, 55 ]
				}, {
					label : '低价值客户',
					backgroundColor : "#03586A",
					data : [ 41, 56, 25, 48, 72, 34, 12 ]
				} ]
			},

			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	}
};

