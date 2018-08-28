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
	src="${pageContext.request.contextPath}/js/design/youran_user.js"
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
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>职员信息</h3>
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
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										User Report <small>Activity report</small>
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
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
										<div class="profile_img">
											<div id="crop-avatar">
												<!-- Current avatar -->
												<img class="img-responsive avatar-view" 
													src="${pageContext.request.contextPath}/<s:property value="#profile_user.user_profile_photo"/>" alt="Avatar"
													title="Change the avatar">
													
											</div>
										</div>
										<h3><s:property value="#profile_user.user_name"/></h3>

										<ul class="list-unstyled user_data">
											<li><i class="fa fa-map-marker user-profile-icon"></i>
												San Francisco, California, USA</li>

											<li><i class="fa fa-briefcase user-profile-icon"></i>
												权限等级：
												<s:if test="#profile_user.user_state == 1">普通用户</s:if>
												<s:if test="#profile_user.user_state == 2">管理员</s:if>
												<s:if test="#profile_user.user_state == 255">超级管理员</s:if>
												<!--<s:property value="#profile_user.user_state"/> -->
												<s:if test="#profile_user.user_id != #user.user_id && #user.user_state>1">
													<button class="btn-success btn-small" onclick="profile_state_edit()">
													    <i class="fa fa-edit m-right-xs"></i>
													</button> 	
												</s:if>
											</li>

											<li class="m-top-xs"><i
												class="fa fa-external-link user-profile-icon"></i> <a
												href="http://www.kimlabs.com/profile/" target="_blank"><s:property value="#profile_user.user_email"/></a>
											</li>
										</ul>

										<br />

										<!-- start skills -->
										<h4>Skills</h4>
										<ul class="list-unstyled user_data">
											<li>
												<p>Web Applications</p>
												<div class="progress progress_sm">
													<div class="progress-bar bg-green" role="progressbar"
														data-transitiongoal="50"></div>
												</div>
											</li>
											<li>
												<p>Website Design</p>
												<div class="progress progress_sm">
													<div class="progress-bar bg-green" role="progressbar"
														data-transitiongoal="70"></div>
												</div>
											</li>
											<li>
												<p>Automation & Testing</p>
												<div class="progress progress_sm">
													<div class="progress-bar bg-green" role="progressbar"
														data-transitiongoal="30"></div>
												</div>
											</li>
											<li>
												<p>UI / UX</p>
												<div class="progress progress_sm">
													<div class="progress-bar bg-green" role="progressbar"
														data-transitiongoal="50"></div>
												</div>
											</li>
										</ul>
										<!-- end of skills -->

									</div>
									<div class="col-md-9 col-sm-9 col-xs-12">

										<div class="profile_title">
											<div class="col-md-6">
												<h2>User Activity Report</h2>
											</div>
											<div class="col-md-6">
												<div id="reportrange" class="pull-right"
													style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
													<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
													<span>December 30, 2014 - January 28, 2015</span> <b
														class="caret"></b>
												</div>
											</div>
										</div>
										<!-- start of user-activity-graph -->
										<div id="graph_bar" style="width: 100%; height: 280px;"></div>
										<!-- end of user-activity-graph -->

										<div class="" role="tabpanel" data-example-id="togglable-tabs">
											<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
												<li role="presentation" class="active"><a
													href="#tab_content1" id="home-tab" role="tab"
													data-toggle="tab" aria-expanded="true">Recent Activity</a>
												</li>
												<li role="presentation" class=""><a
													href="#tab_content2" role="tab" id="profile-tab"
													data-toggle="tab" aria-expanded="false">Projects Worked
														on</a></li>
												<li role="presentation" class=""><a
													href="#tab_content3" role="tab" id="profile-tab2"
													data-toggle="tab" aria-expanded="false">Profile</a></li>
											</ul>
											<div id="myTabContent" class="tab-content">
												<div role="tabpanel" class="tab-pane fade active in"
													id="tab_content1" aria-labelledby="home-tab">

													<!-- start recent activity -->
													<ul class="messages">
														<li><img src="${pageContext.request.contextPath}/img/photo/img.jpg" class="avatar"
															alt="Avatar">
															<div class="message_date">
																<h3 class="date text-info">24</h3>
																<p class="month">May</p>
															</div>
															<div class="message_wrapper">
																<h4 class="heading">Desmond Davison</h4>
																<blockquote class="message">Raw denim you
																	probably haven't heard of them jean shorts Austin.
																	Nesciunt tofu stumptown aliqua butcher retro keffiyeh
																	dreamcatcher synth.</blockquote>
																<br />
																<p class="url">
																	<span class="fs1 text-info" aria-hidden="true"
																		data-icon=""></span> <a href="#"><i
																		class="fa fa-paperclip"></i> User Acceptance Test.doc
																	</a>
																</p>
															</div></li>
														<li><img src="${pageContext.request.contextPath}/img/photo/img.jpg" class="avatar"
															alt="Avatar">
															<div class="message_date">
																<h3 class="date text-error">21</h3>
																<p class="month">May</p>
															</div>
															<div class="message_wrapper">
																<h4 class="heading">Brian Michaels</h4>
																<blockquote class="message">Raw denim you
																	probably haven't heard of them jean shorts Austin.
																	Nesciunt tofu stumptown aliqua butcher retro keffiyeh
																	dreamcatcher synth.</blockquote>
																<br />
																<p class="url">
																	<span class="fs1" aria-hidden="true" data-icon=""></span>
																	<a href="#" data-original-title="">Download</a>
																</p>
															</div></li>
														<li><img src="${pageContext.request.contextPath}/img/photo/img.jpg" class="avatar"
															alt="Avatar">
															<div class="message_date">
																<h3 class="date text-info">24</h3>
																<p class="month">May</p>
															</div>
															<div class="message_wrapper">
																<h4 class="heading">Desmond Davison</h4>
																<blockquote class="message">Raw denim you
																	probably haven't heard of them jean shorts Austin.
																	Nesciunt tofu stumptown aliqua butcher retro keffiyeh
																	dreamcatcher synth.</blockquote>
																<br />
																<p class="url">
																	<span class="fs1 text-info" aria-hidden="true"
																		data-icon=""></span> <a href="#"><i
																		class="fa fa-paperclip"></i> User Acceptance Test.doc
																	</a>
																</p>
															</div></li>
														<li><img src="${pageContext.request.contextPath}/img/photo/img.jpg" class="avatar"
															alt="Avatar">
															<div class="message_date">
																<h3 class="date text-error">21</h3>
																<p class="month">May</p>
															</div>
															<div class="message_wrapper">
																<h4 class="heading">Brian Michaels</h4>
																<blockquote class="message">Raw denim you
																	probably haven't heard of them jean shorts Austin.
																	Nesciunt tofu stumptown aliqua butcher retro keffiyeh
																	dreamcatcher synth.</blockquote>
																<br />
																<p class="url">
																	<span class="fs1" aria-hidden="true" data-icon=""></span>
																	<a href="#" data-original-title="">Download</a>
																</p>
															</div></li>

													</ul>
													<!-- end recent activity -->

												</div>
												<div role="tabpanel" class="tab-pane fade" id="tab_content2"
													aria-labelledby="profile-tab">

													<!-- start user projects -->
													<table class="data table table-striped no-margin">
														<thead>
															<tr>
																<th>#</th>
																<th>Project Name</th>
																<th>Client Company</th>
																<th class="hidden-phone">Hours Spent</th>
																<th>Contribution</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>1</td>
																<td>New Company Takeover Review</td>
																<td>Deveint Inc</td>
																<td class="hidden-phone">18</td>
																<td class="vertical-align-mid">
																	<div class="progress">
																		<div class="progress-bar progress-bar-success"
																			data-transitiongoal="35"></div>
																	</div>
																</td>
															</tr>
															<tr>
																<td>2</td>
																<td>New Partner Contracts Consultanci</td>
																<td>Deveint Inc</td>
																<td class="hidden-phone">13</td>
																<td class="vertical-align-mid">
																	<div class="progress">
																		<div class="progress-bar progress-bar-danger"
																			data-transitiongoal="15"></div>
																	</div>
																</td>
															</tr>
															<tr>
																<td>3</td>
																<td>Partners and Inverstors report</td>
																<td>Deveint Inc</td>
																<td class="hidden-phone">30</td>
																<td class="vertical-align-mid">
																	<div class="progress">
																		<div class="progress-bar progress-bar-success"
																			data-transitiongoal="45"></div>
																	</div>
																</td>
															</tr>
															<tr>
																<td>4</td>
																<td>New Company Takeover Review</td>
																<td>Deveint Inc</td>
																<td class="hidden-phone">28</td>
																<td class="vertical-align-mid">
																	<div class="progress">
																		<div class="progress-bar progress-bar-success"
																			data-transitiongoal="75"></div>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
													<!-- end user projects -->

												</div>
												<div role="tabpanel" class="tab-pane fade" id="tab_content3"
													aria-labelledby="profile-tab">
													<p>xxFood truck fixie locavore, accusamus mcsweeney's
														marfa nulla single-origin coffee squid. Exercitation +1
														labore velit, blog sartorial PBR leggings next level wes
														anderson artisan four loko farm-to-table craft beer twee.
														Qui photo booth letterpress, commodo enim craft beer
														mlkshk</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

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
    <!-- morris.js -->
    <script src="${pageContext.request.contextPath}/vendors/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    	
	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>


</body>

<div id="profile_level_edit_div" hidden="true" align="center""col-sm-6col-md-12col-xs-6">
	<div class="x_panel">
		<div class="x_title">
			<h2 align="center">
				<font style="vertical-align: inherit;"><font
					style="vertical-align: inherit;">用户信息</font></font><small><font
					style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">用户权限修改</font></font></small>
			</h2>

			<div class="clearfix"></div>
		</div><form action="${pageContext.request.contextPath}/user_updateState" method="post">
		<div class="x_content">
			<br />
				<div class="col-sm-6 col-md-12 col-xs-6">
					<input type="hidden" name="profile_user.user_id" value='<s:property value="#profile_user.user_id"/>'/>
					<div class="col-md-12  col-sm-12 col-xs-12 form-group has-feedback">
						<select class='form-control' name="profile_user.user_state" id="edit_profile_state">
							<option value = '1'>普通用户</option>
							<option value = '2'>管理员</option>
						</select>
						<br/><br/>
					</div>
					
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button type="submit" class="btn btn-success" onclick="profile_state_edit_submit()">
							<font style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> 修改 </font>
							</font>
						</button>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
						<button type="button" class="btn btn-info" id="customer_add_div_close"
							value="111" onclick="cuustomer_add_cancel()">
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