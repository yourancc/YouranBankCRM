///将要弹出的层设置为visit_add_div
var visit_add_id;
function visit_add(){
	//设置列表框
	//getOptions("009","add_customer_source_div","customer.cust_source.dict_id",null);
	//getOptions("001","add_customer_industry_div","customer.cust_industry.dict_id",null);
	//getOptions("006","add_customer_level_div","customer.cust_level.dict_id",null);
	//弹出添加客户页面
	visit_add_id = layer.open({
  	title: false,
 	 type: 1,
  	area: ['800px', '500px'],
 	 shadeClose: true, //点击遮罩关闭
	  content: $('#visit_add_div'),
	  closeBtn:0,
	  skin:''
    });

};	
function visit_add_submit(){
	
	$('#visit_add_div').css("display","none");
	layer.close(visit_add_id);	
	
	//显示添加成功通知
	new PNotify({
        title: '通知',
        text: '拜访记录已成功添加.',
        type: 'success',
        //stack:{'dir1':'right','dir2':'up','push':'bottom','spacing1':215,'spacing2':25,'context':$('body'),'modal':false},
        addclass:'stack-bottomright',
        hide: true,
        delay:1500,
        styling: 'bootstrap3'
    });
};
function visit_add_cancel(){
	
	
	$('#visit_add_div').css("display","none");
	layer.close(visit_add_id)
};

//将要弹出的层设置为visit_edit_div
var visit_edit_id;
function visit_edit(cur_id){
	//获取页面 数据
	var s_edit;
	$.post("visit_getVisitByID",{ "update_visit_id": cur_id }, function(edit_visit){
		/*
		 * visit_idbigint(32) NOT NULL
			visit_cust_idbigint(32) NULL客户id
			visit_user_idbigint(32) NULL负责人id
			visit_timedate NULL拜访时间
			visit_intervieweevarchar(32) NULL被拜访人
			visit_addrvarchar(128) NULL拜访地点
			visit_detailvarchar(256) NULL拜访详情
			visit_nexttimedate NULL下次拜访时间
			visit_lkm_id 
		 * */
		$("#edit_visit_id").attr("value",edit_visit.visit_id);
		$("#edit_visit_lkm_name").attr("value",edit_visit.linkman.lkm_name);
		$("#edit_visit_cust_name").attr("value",edit_visit.customer.cust_name);
		$("#edit_visit_addr").attr("value",edit_visit.visit_addr);
		$("#edit_visit_detail").attr("value",edit_visit.visit_detail);
		$("#edit_visit_interviewee").attr("value",edit_visit.visit_interviewee);
		$("#edit_visit_nexttime").attr("value",edit_visit.visit_nexttime);
		$("#edit_visit_time").attr("value",edit_visit.visit_time);
		//设置列表框
		//getOptions("009","edit_customer_source_div","customer.cust_source.dict_id",edit_customer.cust_source.dict_id);
		
	},"json");

	//显示编辑页面
	visit_edit_id = layer.open({
	title: false,
	 type: 1,
	area: ['800px', '600px'],
	 shadeClose: true, //点击遮罩关闭
	  content: $('#visit_edit_div'),
	  closeBtn:0,
	  skin:''
  });

};		
function visit_edit_submit(){
	
	$('#visit_edit_div').css("display","none");
	layer.close(visit_edit_id);	
	
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

function visit_edit_cancel(){
	
	
	$('#visit_edit_div').css("display","none");
	layer.close(visit_edit_id)
};





