<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>YouranCC_CRM! |</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" ></script>
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
<!-- Animate.css -->
<link
	href="${pageContext.request.contextPath}/vendors/animate.css/animate.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">
</head>

<body class="login">

	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form action="${pageContext.request.contextPath}/user_login"
						method="post">
						<h1>账户登录</h1>
						<div>
							<input type="text" class="form-control" name="user.user_code" value="123"
								placeholder="Username" required="required"/>
						</div>
						<div>
							<input  type="password" class="form-control" value="123"
								name="user.user_password" placeholder="Password" required="required"/>
						</div>
						<div>
							<!-- <a class="btn btn-default submit" href="index.html">登录</a>  -->
							<input type="submit" class="btn btn-default submit" value="登录" />
							<a class="reset_pass" href="#">忘记了密码?</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								新建一个 账户? <a href="#signup" class="to_register"> 账户创建 </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i> yoruuan crm!
								</h1>
								<p>©2016 All Rights Reserved. youran crm! is a pritice for
									graduation project.</p>
							</div>
						</div>
					</form>
				</section>
			</div>

			<div id="register" class="animate form registration_form">
				<section class="login_content">
					<form action="${pageContext.request.contextPath}/user_register"
						method="post" >
						<h1>创建账户</h1>
						<div>
							<input name="registerUser.user_code" type="text"
								class="form-control" placeholder="用户账号" required="required" />
						</div>
						<div>
							<input name="registerUser.user_password" id="password"
								type="password" class="form-control" placeholder="用户密码"
								required="required" />
						</div>
						<div>
							<input type="password" class="form-control" placeholder="确认密码"
								required="required"  />
						</div>
						<div>
							<input name="registerUser.user_name" type="text"
								class="form-control" placeholder="姓名" required="required" />
						</div>
						<div>
							<input name="registerUser.user_email" class="form-control"
								placeholder="邮箱" required="required"
								/>
						</div>
						<div  >
							<input type="submit" class="btn btn-default submit" value="注册" />
						</div>
						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								已经拥有了一个账户 ? <a href="#signin" class="to_register"> 登录 </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i> youran crm!
								</h1>
								<p>©2016 All Rights Reserved. youran crm! is a pritice for
									graduation project.</p>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
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
	<!-- validator -->
	<script
		src="${pageContext.request.contextPath}/vendors/validator/validator.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
</body>
</html>
