<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>客户管理</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link
	href="${pageContext.request.contextPath}/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-wysiwyg -->
<link
	href="${pageContext.request.contextPath}/vendors/google-code-prettify/bin/prettify.min.css"
	rel="stylesheet">
<!-- Select2 -->
<link
	href="${pageContext.request.contextPath}/vendors/select2/dist/css/select2.min.css"
	rel="stylesheet">
<!-- Switchery -->
<link
	href="${pageContext.request.contextPath}/vendors/switchery/dist/switchery.min.css"
	rel="stylesheet">
<!-- starrr -->
<link
	href="${pageContext.request.contextPath}/vendors/starrr/dist/starrr.css"
	rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- Datatables -->
<link
	href="${pageContext.request.contextPath}/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">
<!-- PNotify -->
<link
	href="${pageContext.request.contextPath}/vendors/pnotify/dist/pnotify.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendors/pnotify/dist/pnotify.buttons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendors/pnotify/dist/pnotify.nonblock.css"
	rel="stylesheet">
<!-- 自己添加的 -->
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/js/design/youran_customer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/design/youran_commons.js" type="text/javascript"></script>
<script type="text/javascript">
	var t1='<%=request.getAttribute("searchVO")%>';
	var t1 = JSON.parse(t1);
	$(function(){
		//初始化代码 
		init_option_color();
		if(t1.level != null){
			var ee = $( "#" + "level"+t1.level).parent();
			btn_option_setColor(ee,"btn-info");
		}
		if(t1.source != null){
			var ee = $( "#" + "source"+t1.source).parent();
			btn_option_setColor(ee,"btn-info");
		}
		if(t1.state != null){
			var ee = $( "#" + "state"+t1.state).parent();
			btn_option_setColor(ee,"btn-info");
		}		
	});
	
</script>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!--top-->
			<%@  include file="../../top.jsp"%>

			<!--left-->
			<%@  include file="../../left.jsp"%>

			<!-- 右侧内容-->
			<div class="right_col" role="main">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								客户信息列表<small>Users</small>
							</h2>

							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-expanded="false"><i
										class="fa fa-wrench"></i></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">Settings 1</a></li>
										<li><a href="#">Settings 2</a></li>
									</ul></li>
								<li>&nbsp;&nbsp;
									<button id="customer_add_button" class="btn btn-success"
										onclick="customer_add()">＋新建客户</button>
								</li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<p class="text-muted font-13 m-b-30">
							<form id="searchForm" action="customer_list" method="post">
								<!--客户级别-->
							<div class="row">
								<label>客户级别：</label>
								<div class="btn-group" data-toggle="buttons">
									<label   class="yrOption btn btn-info active"> 
										<input type="radio"	name="searchVO.level" value="0" id="level0"> 全部客户
									</label> 
									<label  class="yrOption  btn btn-default"> 
										<input type="radio" name="searchVO.level" value="35" id="level35"> 高价值客户
									</label> <label  class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.level" value="22" id="level22"> 普通客户
									</label> <label  class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.level" value="23" id="level23"> 低价值客户
									</label>
								</div>
							</div>
							<br />
							<!--客户状态-->
							<div class="row">
								<label>客户来源：</label>
								<div class="btn-group" data-toggle="buttons">
									<label class="yrOption btn btn-info active"> <input
										type="radio" name="searchVO.source" value="0" id="source0"> 全部客户
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.source" value="32" id="source32"> 电话营销
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.source" value="33" id="source33"> 网络营销
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.source" value="34" id="source34"> 推广活动
									</label> 
								</div>
							</div>
							<br />
							<!--客户状态-->
							<div class="row">
								<label>客户状态：</label>
								<div class="btn-group" data-toggle="buttons">
									<label class="yrOption btn btn-info active"> <input
										type="radio" name="searchVO.state" value="0" id="state0"> 全部客户
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.state" value="18" id="state18"> 基础客户
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.state" value="19" id="state19"> 潜在客户
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.state" value="20" id="state20"> 成功客户
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="searchVO.state" value="21" id="state21"> 失效客户
									</label> 
								</div>
							</div>
							<br />							
							<!--下次跟进时间-->
							<!-- 
							<div class="row">
								<label>下次跟进时间：</label>
								<div class="btn-group" data-toggle="buttons">
									<label class="yrOption btn btn-info active"> <input type="radio"
										name="customer-level" id="a"> 全部客户
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="a"> 无跟进时间
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="b"> 今天
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="c"> 明天
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="a"> 本周
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="b"> 下周
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="c"> 本月
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="c"> 下月
									</label>
								</div>
							</div>-->
							</p>
							</form>
							<hr />
							<table id="datatable-fixed-header"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>客户ID</th>
										<th>客户名称</th>
										<th>客户状态</th>
										<th>客户信息来源</th>
										<th>客户所属行业</th>
										<th>客户级别</th>
										<th>联系人</th>
										<th>移动电话</th>
										<s:if test="#user.user_state>1">
											<th>操作</th>
										</s:if>
										
									</tr>
								</thead>
								<tbody>
									<!--<s:iterator value="user">-->
									<!--</s:iterator>	<s:property value="#session.user.user_name"/>	-->
									<s:iterator value="customerList">
										<tr>
											<td><s:property value="cust_id" /></td>
											<td><s:property value="cust_name" /></td>
											<td><s:property value="cust_state.dict_item_name" /></td>
											<td><s:property value="cust_source.dict_item_name" /></td>
											<td><s:property value="cust_industry.dict_item_name" /></td>
											<td><s:property value="cust_level.dict_item_name" /></td>
											<td><s:property value="cust_linkman" /></td>
											<td><s:property value="cust_mobile" /></td>
											<s:if test="#user.user_state>1">
												<td align="center">
													<button class="btn btn-info" onclick="customer_edit(${cust_id}+'')">
														<font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">编辑</font></font>
													</button>
													<button class="btn btn-danger" onclick="btn_delete_onclick(${cust_id},'customer')">
														<font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">删除</font></font>
													</button>
												</td>
											</s:if>	
										</tr>
									</s:iterator>

								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
			<!--footer-->
			<%@  include file="../../footer.jsp"%>
		</div>
	</div>

	<!--脚本导入-->
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
	<!-- 图形 -->
	<script
		src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- Datatables -->
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jszip/dist/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/pdfmake/build/vfs_fonts.js"></script>
	<!-- PNotify -->
	<script
		src="${pageContext.request.contextPath}/vendors/pnotify/dist/pnotify.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/pnotify/dist/pnotify.buttons.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/pnotify/dist/pnotify.nonblock.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>


</body>



<!-- 弹出层 -->
<!--客户添加-->
<div id="customer_add_div" hidden="true" align="center""col-sm-6col-md-12col-xs-6">
	<div class="x_panel">
		<div class="x_title">
			<h2 align="center">
				<font style="vertical-align: inherit;"><font
					style="vertical-align: inherit;">客户信息</font></font><small><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">添加新的客户</font></font></small>
			</h2>

			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br />
			<form class="form-horizontal form-label-left input_mask"
				action="${pageContext.request.contextPath}/customer_add"
				method="post">
				<div class="col-sm-6 col-md-12 col-xs-6">
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback" >
						<input class="form-control has-feedback-left" onblur="checkNameExist('customer',this,true,'当前客户已存在！')"
							name="customer.cust_name" placeholder="客户姓名" align="left" /> <span
							class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div id="add_customer_source_div" class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">

					</div>
					<div id="add_customer_industry_div"  class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">

					</div>
					<div id="add_customer_level_div"  class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">

					</div>
					<div id="add_customer_state_div"  class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">

					</div>					
					<div class="col-md-6  col-sm-12 col-xs-12 form-group has-feedback">
						<input name="customer.cust_mobile"
							class="form-control has-feedback-left" type="text"
							placeholder="固定电话" /> <span
							class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" type="text"
							placeholder="微信" /> <span
							class="fa fa-tencent-weibo form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" placeholder="客户地区"
							align="left" /> <span
							class="fa fa-building form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" placeholder="邮政编码"
							align="left" /> <span
							class="fa fa-envelope form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" placeholder="客户网址"
							align="left" /> <span
							class="fa fa-weixin form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
						<!--<input class="form-control has-feedback-left" placeholder="客户简介" align="left" />-->
						<textarea class="form-control "
							style="resize: none; height: 178px;" name="message"
							placeholder="请输入该公司的介绍"></textarea>

					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button class="btn btn-success source" type="submit"
							onclick="customer_add_submit()">
							<font style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> 添加 </font>
							</font>
						</button>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button class="btn btn-info source" type="button" id="customer_add_div_close"
							value="111" onclick="cuustomer_add_cancel()">
							<font style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> 取消 </font>
							</font>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>

<!--客户编辑-->
<div id="customer_edit_div" hidden="true" align="center""col-sm-6col-md-12col-xs-6">
	<div class="x_panel">
		<div class="x_title">
			<h2 align="center">
				<font style="vertical-align: inherit;"><font
					style="vertical-align: inherit;">客户信息</font></font><small><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">修改客户信息</font></font></small>
			</h2>

			<div class="clearfix"></div>
		</div><form action="${pageContext.request.contextPath}/customer_update" method="post">
		<div class="x_content">
			<br />
							<input id="edit_customer_id" type="hidden" name="customer.cust_id">
				<div class="col-sm-6 col-md-12 col-xs-6">
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" id="edit_cust_name"
							name="customer.cust_name"  align="left" /> <span
							class="fa fa-user form-control-feedback left" aria-hidden="true"></span>						
					</div>
					<div id="edit_customer_source_div" class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">

					</div>
					<div id="edit_customer_industry_div" class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">

					</div>
					<div id="edit_customer_level_div" class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">

					</div>
					<div class="col-md-6  col-sm-12 col-xs-12 form-group has-feedback">
						<input name="customer.cust_mobile" id="edit_cust_mobile"
							class="form-control has-feedback-left" type="text"
							placeholder="固定电话" /> <span
							class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" type="text"
							placeholder="微信" /> <span
							class="fa fa-tencent-weibo form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" placeholder="客户地区"
							align="left" /> <span
							class="fa fa-building form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" placeholder="邮政编码"
							align="left" /> <span
							class="fa fa-envelope form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" placeholder="客户传真"
							align="left" /> <span
							class="fa fa-fax form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left" placeholder="客户网址"
							align="left" /> <span
							class="fa fa-weixin form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
						<textarea class="form-control " 
							style="resize: none; height: 178px;" name="message"
							placeholder="清输入该公司的介绍"></textarea>

					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button type="submit" class="btn btn-success" onclick="customer_edit_submit()">
							<font style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> 修改 </font>
							</font>
						</button>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button type="button" class="btn btn-info" id="customer_add_div_close"
							value="111" onclick="cuustomer_edit_cancel()">
							<font style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> 取消 </font>
							</font>
						</button>
					</div>
				</div>
		</div>
		</form>
	</div>

</div>
</html>