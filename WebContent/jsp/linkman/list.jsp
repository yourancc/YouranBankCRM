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
<title>联系人管理</title>
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
<script src="${pageContext.request.contextPath}/js/design/youran_linkman.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/design/youran_customer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/design/youran_commons.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		//初始化代码 
		init_option_color();
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
								联系人信息列表<small>Users</small>
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
										onclick="linkman_add()">＋新建联系人</button>
								</li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<p class="text-muted font-13 m-b-30">
							
								<!--联系人分类-->
							<!-- 
							<div class="row">
								<label>联系人分类：</label>
								<div class="btn-group" data-toggle="buttons">
									<label class="yrOption btn btn-info active"> <input type="radio"
										name="customer-level" id="a"> 全部联系人
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="a" checked="checked"> 我的联系人
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-level" id="b"> 我协作的联系人
									</label>
								</div>
							</div>
							<br />

							<div class="row">
								<label>联系人性别：</label>
								<div class="btn-group" data-toggle="buttons">
									<label class="yrOption btn btn-info active"> <input
										type="radio" name="customer-state" id="a"> 全部
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-state" id="a"> 男性
									</label> <label class="yrOption btn btn-default"> <input type="radio"
										name="customer-state" id="b"> 女性
									</label>
								</div>
							</div>
							<br />

							<div class="row">
								<label>下次跟进时间：</label>
								<div class="btn-group" data-toggle="buttons">
									<label class="yrOption btn btn-info"> <input type="radio"
										name="customer-level" id="a"> 全部
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
							</div>
							 -->
							</p>
							<hr />
							<table id="datatable-fixed-header"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>联系人ID</th>
										<th>联系人姓名</th>
										<th>联系人所属客户</th>
										<th>联系人职位</th>
										<th>联系人性别</th>
										<th>联系人电话</th>
										<th>联系人qq</th>
										<th>联系人邮箱</th>
										<th>联系人备注</th>
										<s:if test="#user.user_state>1">
											<th>操作</th>
										</s:if>
									</tr>
								</thead>

								<tbody>

									<s:iterator value="linkmanList">
										<tr>
											<td><s:property value="lkm_id" /></td>
											<td><s:property value="lkm_name" /></td>
											<td><s:property value="c.cust_name" /></td>
											<td><s:property value="lkm_position" /></td>
											<td><s:property value="lkm_gender" /></td>
											<td><s:property value="lkm_phone" /></td>
											<td><s:property value="lkm_qq" /></td>
											<td><s:property value="lkm_email" /></td>
											<td><s:property value="lkm_memo" /></td>
											<s:if test="#user.user_state>1">
											
											<td><button class="btn btn-info" onclick="linkman_edit(<s:property value="lkm_id" />)">修改</button>
												<button class="btn btn-danger" onclick="btn_delete_onclick(<s:property value="lkm_id" />,'linkman')">删除</button></td>
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
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="${pageContext.request.contextPath}/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="${pageContext.request.contextPath}/vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="${pageContext.request.contextPath}/vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath}/vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Autosize -->
    <script src="${pageContext.request.contextPath}/vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="${pageContext.request.contextPath}/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="${pageContext.request.contextPath}/vendors/starrr/dist/starrr.js"></script>


	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>

</body>

<!-- 弹出层 -->
<!--联系人添加-->
<div id="linkman_add_div" hidden="true" align="center""col-sm-6col-md-12col-xs-6">
	<div class="x_panel">
		<div class="x_title">
			<h2 align="center">
				<font style="vertical-align: inherit;"><font
					style="vertical-align: inherit;">联系人信息</font></font><small><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">添加新的联系人</font></font></small>
			</h2>

			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br />
			<form class="form-horizontal form-label-left input_mask"
				action="${pageContext.request.contextPath}/linkman_add"
				method="post">
				<div class="col-sm-6 col-md-12 col-xs-6">
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left"
							name="linkman.lkm_name" placeholder="联系人姓名" align="left" /> <span
							class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6  col-sm-12 col-xs-12 form-group has-feedback">
						<input name="linkman.c.cust_name" onblur="checkNameExist('customer',this,false,'未找到当前客户!!!')"
							class="form-control has-feedback-left" type="text"
							placeholder="联系人 所属客户" /> <span
							class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input name="linkman.lkm_position"
							class="form-control has-feedback-left" type="text"
							placeholder="联系人职位" /> <span
							class="fa fa-tencent-weibo form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input name="linkman.lkm_phone" class="form-control has-feedback-left"
							placeholder="联系人电话" align="left" /> <span
							class="fa fa-envelope form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input name="linkman.lkm_qq" class="form-control has-feedback-left"
							placeholder="联系人qq" align="left" /> <span
							class="fa fa-fax form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input name="linkman.lkm_email" class="form-control has-feedback-left" placeholder="联系人邮箱"
							align="left" /> <span
							class="fa fa-weixin form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback left">
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback left" align="left">
							性别:&nbsp;&nbsp;
							<input type="radio" class="flat chcked" name="linkman.lkm_gender" id="genderM"
								value="男" checked="" required="" data-parsley-multiple="gender"
								style="position: absolute; opacity: 0;">男&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="flat" name="linkman.lkm_gender" id="genderF"
								value="女" data-parsley-multiple="gender"
								style="position: absolute; opacity: 0;">女
					</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
						<textarea class="form-control " name="linkman.lkm_memo"
							style="resize: none; height: 178px;" name="message"
							placeholder="如有需要,请输入对于该联系人的备注"></textarea>

					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button class="btn btn-success source" type="submit"
							onclick="linkman_add_submit()">
							<font style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> 添加 </font>
							</font>
						</button>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button type="button" class="btn btn-info source" type="button"
							id="customer_add_div_close" value="111"
							onclick="linkman_add_cancel()">
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

<!--联系人编辑-->
<div id="linkman_edit_div" hidden="true" align="center""col-sm-6col-md-12col-xs-6">
	<div class="x_panel">
		<div class="x_title">
			<h2 align="center">
				<font style="vertical-align: inherit;"><font
					style="vertical-align: inherit;">联系人信息</font></font><small><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">修改联系人</font></font></small>
			</h2>

			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br />
			<form class="form-horizontal form-label-left input_mask"
				action="${pageContext.request.contextPath}/linkman_update"
				method="post">
				<div class="col-sm-6 col-md-12 col-xs-6">
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<input type="hidden" id="edit_linkman_id" name="linkman.lkm_id">
						<input id="edit_linkman_name" class="form-control has-feedback-left"
							name="linkman.lkm_name" placeholder="联系人姓名" align="left" /> <span
							class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6  col-sm-12 col-xs-12 form-group has-feedback forbidden">
						<input id="edit_linkman_cust_name" name="linkman.c.cust_name"
							class="form-control has-feedback-left" type="text"
							placeholder="联系人 所属客户" /> <span
							class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input id="edit_linkman_position" name="linkman.lkm_position"
							class="form-control has-feedback-left" type="text"
							placeholder="联系人职位" /> <span
							class="fa fa-tencent-weibo form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input id="edit_linkman_phone" name="linkman.lkm_phone" class="form-control has-feedback-left"
							placeholder="联系人电话" align="left" /> <span
							class="fa fa-envelope form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input id="edit_linkman_qq" name="linkman.lkm_qq" class="form-control has-feedback-left"
							placeholder="联系人qq" align="left" /> <span
							class="fa fa-fax form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<input id="edit_linkman_email" name="linkman.lkm_email" class="form-control has-feedback-left" placeholder="联系人邮箱"
							align="left" /> <span
							class="fa fa-weixin form-control-feedback left"
							aria-hidden="true"></span>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback left">
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback left" align="left">
							性别:&nbsp;&nbsp;
							<input type="radio" class="flat chcked" name="linkman.lkm_gender" id="edit_linkman_gender"
								value="男" checked="" required="" data-parsley-multiple="gender"
								style="position: absolute; opacity: 0;">男&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="flat" name="linkman.lkm_gender" id="edit_linkman_gender"
								value="女" data-parsley-multiple="gender"
								style="position: absolute; opacity: 0;">女
					</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
						<textarea id="edit_linkman_memo" class="form-control " name="linkman.lkm_memo"
							style="resize: none; height: 178px;" name="message"
							placeholder="如有需要,请输入对于该联系人的备注"></textarea>

					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button class="btn btn-success source" type="submit"
							onclick="linkman_edit_submit()">
							<font style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> 修改 </font>
							</font>
						</button>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button type="button" class="btn btn-info source" type="button"
							id="customer_add_div_close" value="111"
							onclick="linkman_edit_cancel()">
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

</html>