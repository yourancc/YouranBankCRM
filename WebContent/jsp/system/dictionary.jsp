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
<title>数据字典管理</title>
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
<script
	src="${pageContext.request.contextPath}/js/design/youran_customer.js"
	type="text/javascript"></script>

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
								数据字典<small>dictionary</small>
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
										onclick="customer_add()">＋新建数据项</button>
								</li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<table id="datatable-fixed-header"
								class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>类别代码</th>
										<th>类别名称</th>
										<th>项目名称</th>
										<th>项目编号</th>
										<th>排序字段</th>
										<th>备注</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>

									<s:iterator value="baseDictList">
										<tr>
											<td><s:property value="dict_id" /></td>
											<td><s:property value="dict_type_code" /></td>
											<td><s:property value="dict_type_name" /></td>
											<td><s:property value="dict_item_name" /></td>
											<td><s:property value="dict_item_code" /></td>
											<td><s:property value="dict_sort" /></td>
											<td><s:property value="dict_memo" /></td>
											<td align="center">
												<button class="btn btn-danger">
													<font style="vertical-align: inherit;"><font
														style="vertical-align: inherit;">删除</font></font>
												</button>
											</td>
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
<!--新增数据字典项-->
<div id="customer_add_div" hidden="true" align="center""col-sm-6col-md-12col-xs-6">
	<div class="x_panel">
		<div class="x_title">
			<h2 align="center">
				<font style="vertical-align: inherit;"><font
					style="vertical-align: inherit;">数据字典</font></font><small><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">添加新的项目</font></font></small>
			</h2>

			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br />
			<form class="form-horizontal form-label-left input_mask"
				action="${pageContext.request.contextPath}/system_listDic"
				method="post">
				<div class="col-sm-6 col-md-12 col-xs-6">
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<input class="form-control has-feedback-left"
							name="customer.cust_name" placeholder="客户姓名" align="left" /> <span
							class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<select name="customer.cust_source"
							class="form-control has-feedback-left">
							<option>-----未选择-----</option>
							<option value="硬体广告">硬体广告</option>
							<option value="电视宣传">电视宣传</option>
							<option value="公司活动">公司活动</option>
						</select>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<select name="customer.cust_industry"
							class="form-control has-feedback-left">
							<option>-----未选择-----</option>
							<option value="互联网">互联网</option>
							<option value="硬件制造">硬件制造</option>
							<option value="传媒设计">传媒设计</option>
						</select>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12 form-group has-feedback">
						<select name="customer.cust_level"
							class="form-control has-feedback-left">
							<option>-----未选择-----</option>
							<option value="高价值客户">高价值客户</option>
							<option value="普通客户">普通客户</option>
							<option value="低价值价值客户">低价值价值客户</option>
						</select>
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


</html>