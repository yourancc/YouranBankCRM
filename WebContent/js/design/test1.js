// 客户分析 图标初始化
function customer_anallse_chart_init() {
	$.post("customer_customerIndustryList", "", function(industryList) {
		// 客户行业分析
		//alert(data);
		if (true) {
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
