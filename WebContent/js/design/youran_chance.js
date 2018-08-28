//将要弹出的层设置为chance_add_div
var chance_add_id;
function chance_add(){
	//设置列表框
//	getOptions("009","add_chance_source_div","chance.chance_source.dict_id",null);
//	getOptions("001","add_chance_industry_div","chance.chance_industry.dict_id",null);
//	getOptions("006","add_chance_level_div","chance.chance_level.dict_id",null);
	//弹出添加客户页面
	chance_add_id = layer.open({
  	title: false,
 	 type: 1,
  	area: ['800px', '600px'],
 	 shadeClose: true, //点击遮罩关闭
	  content: $('#chance_add_div'),
	  closeBtn:0,
	  skin:''
    });

};			
function chance_add_submit(){
	
	$('#chance_add_div').css("display","none");
	layer.close(chance_add_id);	
	
	//显示添加成功通知
	new PNotify({
        title: '通知',
        text: '客户添加成功.',
        type: 'success',
        //stack:{'dir1':'right','dir2':'up','push':'bottom','spacing1':215,'spacing2':25,'context':$('body'),'modal':false},
        addclass:'stack-bottomright',
        hide: true,
        delay:1500,
        styling: 'bootstrap3'
    });
};

function chance_add_cancel(){
	
	
	$('#chance_add_div').css("display","none");
	layer.close(chance_add_id)
};


//将要弹出的层设置为chance_edit_div
var chance_edit_id;
function chance_edit(cur_id){
	//获取页面 数据
	var s_edit;
	$.post("chance_getChanceByID",{ "update_chance_id": cur_id }, function(edit_chance){
		s_edit = edit_chance;
		$("#edit_chance_name").attr("value",edit_chance.chan_name);
		$("#edit_chance_customer").attr("value",edit_chance.customer.cust_name);
		$("#edit_chance_linkman").attr("value",edit_chance.linkman.lkm_name);
		//$("#edit_chance_type").attr("value",edit_chance.chan_type);
		$("#edit_chance_money").attr("value",edit_chance.chan_money);
		$("#edit_chance_source").attr("value",edit_chance.chan_source);
		$("#edit_chance_state").attr("value",edit_chance.chan_state);
		$("#edit_chance_linktime").attr("value",edit_chance.chan_linktime);		
		$("#edit_chance_desc").html(edit_chance.chan_desc);		
		//edit_chance_type
		//设置列表框
		getOptions(edit_chance.chan_type.dict_type_code,"edit_chance_type_div","chance.chan_type.dict_id",edit_chance.chan_type.dict_id);
//		getOptions("001","edit_chance_industry_div","chance.chance_industry.dict_id",edit_chance.chance_industry.dict_id);
//		getOptions("006","edit_chance_level_div","chance.chance_level.dict_id",edit_chance.chance_level.dict_id);		
	},"json");
	

	
	//显示编辑页面
	chance_edit_id = layer.open({
  	title: false,
 	 type: 1,
  	area: ['800px', '600px'],
 	 shadeClose: true, //点击遮罩关闭
	  content: $('#chance_edit_div'),
	  closeBtn:0,
	  skin:''
    });


	
};			
function chance_edit_submit(){
	
	$('#chance_edit_div').css("display","none");
	layer.close(chance_edit_id);	
	
	//显示添加成功通知
	new PNotify({
        title: '通知',
        text: '客户修改成功.',
        type: 'success',
        //stack:{'dir1':'right','dir2':'up','push':'bottom','spacing1':215,'spacing2':25,'context':$('body'),'modal':false},
        addclass:'stack-bottomright',
        hide: true,
        delay:800,
        styling: 'bootstrap3'
    });
};

function chance_edit_cancel(){
	
	
	$('#chance_edit_div').css("display","none");
	layer.close(chance_edit_id)
};






//客户分析 图标初始化
function chance_anallse_chart_init(){
	
	//客户行业分析
	if($('#chance_profession_analyse_id').length) {

		var ctx = document.getElementById("chance_profession_analyse_id");
		var data = {
			datasets: [{
				data: [120, 150, 140, 180, 100],
				backgroundColor: [
					"#455C73",
					"#9B59B6",
					"#BDC3C7",
					"#26B99A",
					"#3498DB"
				],
				label: '行业分析'
			}],
			labels: [
				"教育",
				"金融",
				"硬件制造",
				"市场销售",
				"互联网通信"
			]
		};

		var polarArea = new Chart(ctx, {
			data: data,
			type: 'polarArea',
			options: {
				scale: {
					ticks: {
						beginAtZero: true
					}
				}
			}
		});

	}
	
	//客户来源分析
	if($('#chance_source_analyse_id').length) {
	
		var ctx = document.getElementById("chance_source_analyse_id");
		var data = {
			datasets: [{
				data: [120, 50, 140, 180, 100],
				backgroundColor: [
					"#455C73",
					"#9B59B6",
					"#BDC3C7",
					"#26B99A",
					"#3498DB"
				],
				label: 'My dataset' // for legend
			}],
			labels: [
				"广告宣传",
				"硬体广告",
				"展示活动",
				"公司活动",
				"他人介绍"
			]
		};
	
		var pieChart = new Chart(ctx, {
			data: data,
			type: 'pie',
			otpions: {
				legend: false
			}
		});
	
	}

	
	//新增客户分析
	if ($('#chance_add_analyse_id').length ){ 
	  
	  var ctx = document.getElementById("chance_add_analyse_id");
	  var mybarChart = new Chart(ctx, {
	  	type: 'bar',
	  	data: {
	  		labels: ["1月", "2月", "3月", "4月", "5月", "6月", "7月"],
	  		datasets: [{
	  			label: '高价值客户',
	  			backgroundColor: "#26B99A",
	  			data: [51, 30, 40, 28, 92, 50, 45]
	  		}, {
	  			label: '普通客户',
	  			backgroundColor: "#22B36A",
	  			data: [55, 40, 20, 38, 62, 20, 55]
	  		}, {
	  			label: '低价值客户',
	  			backgroundColor: "#03586A",
	  			data: [41, 56, 25, 48, 72, 34, 12]
	  		}]
	  	},

	  	options: {
	  		scales: {
	  			yAxes: [{
	  				ticks: {
	  					beginAtZero: true
	  				}
	  			}]
	  		}
	  	}
	  });
	} 
};


