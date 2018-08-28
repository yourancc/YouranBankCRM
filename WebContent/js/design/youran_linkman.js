
///将要弹出的层设置为linkman_add_div
var lkm_add_id;
function linkman_add(){
	//设置列表框
	//getOptions("009","add_customer_source_div","customer.cust_source.dict_id",null);
	//getOptions("001","add_customer_industry_div","customer.cust_industry.dict_id",null);
	//getOptions("006","add_customer_level_div","customer.cust_level.dict_id",null);
	//弹出添加客户页面
	lkm_add_id = layer.open({
  	title: false,
 	 type: 1,
  	area: ['800px', '600px'],
 	 shadeClose: true, //点击遮罩关闭
	  content: $('#linkman_add_div'),
	  closeBtn:0,
	  skin:''
    });

};	
function linkman_add_submit(){
	
	$('#linkman_add_div').css("display","none");
	layer.close(lkm_add_id);	
	
	//显示添加成功通知
	new PNotify({
        title: '通知',
        text: '联系人添加成功.',
        type: 'success',
        //stack:{'dir1':'right','dir2':'up','push':'bottom','spacing1':215,'spacing2':25,'context':$('body'),'modal':false},
        addclass:'stack-bottomright',
        hide: true,
        delay:1500,
        styling: 'bootstrap3'
    });
};
function linkman_add_cancel(){
	
	
	$('#linkman_add_div').css("display","none");
	layer.close(lkm_add_id)
};

//将要弹出的层设置为linkman_edit_div
var linkman_edit_id;
function linkman_edit(cur_id){
	//获取页面 数据
	var s_edit;
	$.post("linkman_getLinkManByID",{ "update_linkman_id": cur_id }, function(edit_linkman){
		edit_linkman_id
		$("#edit_linkman_id").attr("value",edit_linkman.lkm_id);
		$("#edit_linkman_name").attr("value",edit_linkman.lkm_name);
		$("#edit_linkman_cust_name").attr("value",edit_linkman.c.cust_name);
		$("#edit_linkman_position").attr("value",edit_linkman.lkm_position);
		$("#edit_linkman_phone").attr("value",edit_linkman.lkm_phone);
		$("#edit_linkman_qq").attr("value",edit_linkman.lkm_qq);
		$("#edit_linkman_email").attr("value",edit_linkman.lkm_email);
		$("#edit_linkman_gender").attr("value",edit_linkman.lkm_gender);
		$("#edit_linkman_memo").attr("value",edit_linkman.lkm_memo);
		//设置列表框
		//getOptions("009","edit_customer_source_div","customer.cust_source.dict_id",edit_customer.cust_source.dict_id);
		
	},"json");

	//显示编辑页面
	linkman_edit_id = layer.open({
  	title: false,
 	 type: 1,
  	area: ['800px', '600px'],
 	 shadeClose: true, //点击遮罩关闭
	  content: $('#linkman_edit_div'),
	  closeBtn:0,
	  skin:''
    });

};		
function linkman_edit_submit(){
	
	$('#linkman_edit_div').css("display","none");
	layer.close(linkman_edit_id);	
	
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

function linkman_edit_cancel(){
	
	
	$('#linkman_edit_div').css("display","none");
	layer.close(linkman_edit_id)
};



