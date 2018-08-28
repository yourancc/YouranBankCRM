<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>YouranCC_CRM</title>
		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Font Awesome -->
		<link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<!-- NProgress -->
		<link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
		<!-- iCheck -->
		<link href="${pageContext.request.contextPath}/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
		<!-- bootstrap-wysiwyg -->
		<link href="${pageContext.request.contextPath}/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
		<!-- Select2 -->
		<link href="${pageContext.request.contextPath}/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
		<!-- Switchery -->
		<link href="${pageContext.request.contextPath}/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
		<!-- starrr -->
		<link href="${pageContext.request.contextPath}/vendors/starrr/dist/starrr.css" rel="stylesheet">
		<!-- bootstrap-daterangepicker -->
		<link href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

		<!-- Custom Theme Style -->
		<link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
				<!-- 自己添加的 -->
		<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/layer/layer.js"></script>
		<script src="${pageContext.request.contextPath}/js/design/customer.js"  type="text/javascript"></script>
		<script>
		$(function(){
			$.post("customer_customerIndustryList", "", function(industryList) {
				// 客户行业分析
				//alert(data);
				if (true) {
					var ctx = document.getElementById("customer_profession_analyse_id");
					var data = {
							datasets: [{
								data: [industryList[1][1], industryList[1][1], industryList[1][1], industryList[3][1], industryList[2][1]],
								backgroundColor: [
									"#455C73",
									"#9B59B6",
									"#BDC3C7",
									"#26B99A",
									"#3498DB"
								],
								label: '行业TOP5'
							}],
							labels: [
								3,
								3,
								3,
								3,
								3
							]
					};

					var polarArea = new Chart(ctx, {
						data : data,
						type : 'polarArea',
						options : {
							scale : {
								ticks : {
									beginAtZero : true
								}
							}
						}
					});

				}

				
				
			}, "json");



		});

		</script>
	</head>

	<body class="nav-md">
		<div class="container body">
			<div class="main_container">


				<!-- 右侧内容-->
				<div class="right_col" role="main">
					<!-- 客户行业分析 -->
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="x_panel">
							<div class="x_title">

								<ul class="nav navbar-right panel_toolbox right">
									<li>
										<a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content"><iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
								<canvas id="customer_profession_analyse_id" width="532" height="266" style="width: 532px; height: 266px;"></canvas>
								
							</div>
						</div>
					</div>
					
					
				</div>
				<!--footer-->
				<%@  include file="../../footer.jsp" %>
			</div>
		</div>

		<!--脚本导入-->
		<!-- jQuery -->
		<script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- FastClick -->
		<script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
		<!-- NProgress -->
		<script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
		<!-- 图形 -->
    	<script src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
		<!-- bootstrap-progressbar -->
		<script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
		<!-- iCheck -->
		<script src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
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

</html>