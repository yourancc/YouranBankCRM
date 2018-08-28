//核对表单元素是否存在
function checkNameExist(checkType,eleInput,sign,msg1){
	//var name = checkFormItem("customer",$(custInput).val());
	$.ajax({
		type:"POST",
		url:checkType + "_checkName",
		async: false,
		data:{"checkItemName":$(eleInput).val()},
		success:function(data){
			var class_attr="col-md-6 col-sm-6 col-xs-12 form-group has-feedback ";
			if(sign==true){
				if(data != null && data != ""){
					//layer.msg("当前客户名已存在");
					layer.msg(msg1);
					$(eleInput).parent().attr("class",class_attr+"bad");
				}else{
					$(eleInput).parent().attr("class",class_attr);
				}
			}else{
				if(data != null && data != ""){
					$(eleInput).parent().attr("class",class_attr);
				}else{
					//layer.msg("未找到当前客户");
					layer.msg(msg1);
					$(eleInput).parent().attr("class",class_attr+"bad");
				}				
			}

		}
	});

}
	
//	$.post(itemName+"_checkName",{"checkItemName":itemName},function(data){
//		
//		return data;
//		
//	},"text");

//获取选择项目
function getOptions(typecode,positionId,selectname,selectedId){
	$("#"+positionId).empty();
	var $select = $("<select class='form-control' name=" + selectname + "></select>");
	
	$select.append($("<option value=''>----请选择----</option>"));
	$.post("system_getListByTypeCode",{"dicTypeCode":typecode},function(data){
		$.each(data,function(i,json){
			var $option = $("<option value='" + json['dict_id'] + "'>" + json['dict_item_name'] + "</option>");
			if(json['dict_id'] == selectedId){
				$option.attr("selected","selected");
			}
			$select.append($option);
		});
	},"json");
	
	$("#"+positionId).append($select);
};

//点击删除按钮
function btn_delete_onclick(curId,name){
	layer.open({
		  title: '警告'
		  ,content: '此操作不可逆，请问是否要删除',
		  btn:['删除','取消'],
		  yes:function(index,layero){
		      $.post(name+"_deleteById",{'delete_id':curId},function(data){
			      window.location.href=name+"_list";		    	  
		      },"text");
		  }
		});     
};

function init_option_color(s){
	$(".yrOption").each(function(index,tempE){
		$(tempE).click(function(){
			btn_option_setColor(tempE,"btn-info");
			$("#searchForm").submit();
		});
	});
};


//option按钮点击效果
function btn_option_setColor(e,btn_style){
	$(e).children().attr("checked",true);
	//清楚之前兄弟元素颜色
	$(e).prevAll().each(function(index,preE){
		$(preE).attr("class","btn btn-default yrOption");
	});		
	//清楚之前兄弟元素颜色
	$(e).nextAll().each(function(index,preE){
		$(preE).attr("class","btn btn-default yrOption");
	});
	//当前元素设置为选中颜色
	$(e).attr("class","btn active yrOption " + btn_style);
}