// 将要弹出的层设置为profile_level_edit_div
var edit_profile_state;
function profile_state_edit() {

	// 弹出添加客户页面
	edit_profile_state = layer.open({
		title : false,
		type : 1,
		area : [ '400px', '300px' ],
		shadeClose : true, // 点击遮罩关闭
		content : $('#profile_level_edit_div'),
		closeBtn : 0,
		skin : ''
	});

};
function profile_state_edit_submit() {

	$('#profile_level_edit_div').css("display", "none");
	layer.close(edit_profile_state);

};

function cuustomer_add_cancel() {

	$('#profile_level_edit_div').css("display", "none");
	layer.close(edit_profile_state)
};