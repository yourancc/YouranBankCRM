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
<title>用户管理</title>
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
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>职员列表</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12">
							<div class="x_panel">
								<div class="x_content">
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12 text-center">

										</div>

										<div class="clearfix"></div>
										<s:iterator value="userList">
										<div class="col-md-4 col-sm-4 col-xs-12 profile_details">
											<div class="well profile_view">
												<div class="col-sm-12">
													<h4 class="brief">
														<i>账号：<s:property value="user_code" /></i>
													</h4>
													<div class="left col-xs-7">
														<h2><s:property value="user_name" /></h2>
														<p>
															<strong>About: </strong> Web Designer / UX / Graphic
															Artist / Coffee Lover
														</p>
														<ul class="list-unstyled">
															<li><i class="fa fa-building"></i> Email:<s:property value="user_email" /></li>
															<li><i class="fa fa-phone"></i> Phone #:</li>
														</ul>
													</div>
													<div class="right col-xs-5 text-center">
														<img src="<s:property value="user_profile_photo" />" alt=""
															class="img-circle img-responsive">
													</div>
												</div>
												<div class="col-xs-12 bottom text-center">
													<div class="col-xs-12 col-sm-6 emphasis">
														<p class="ratings">
															<a>4.0</a> <a href="#"><span class="fa fa-star"></span></a>
															<a href="#"><span class="fa fa-star"></span></a> <a
																href="#"><span class="fa fa-star"></span></a> <a
																href="#"><span class="fa fa-star"></span></a> <a
																href="#"><span class="fa fa-star-o"></span></a>
														</p>
													</div>
													<div class="col-xs-12 col-sm-6 emphasis">
														<a href="${pageContext.request.contextPath}/user_profile?user_profile_id=<s:property value="user_id" />">
															<button type="button" class="btn btn-success btn-xs">
																<i class="fa fa-user"> </i> <i class="fa fa-comments-o"></i>
															</button>
															<button type="button" class="btn btn-primary btn-xs">
																<i class="fa fa-user"> </i> 详细信息
															</button>
														</a>
													</div>
												</div>
											</div>
										</div>
					
										</s:iterator>

					
					
									</div>
								</div>
							</div>
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


</html>