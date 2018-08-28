<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Welcome to use youran CRM!</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<link href="http://cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/Icomoon/style.css" rel="stylesheet" type="text/css" />
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<style>
	#loading{
		background-color: #17607d;
		height: 100%;
		width: 100%;
		position: fixed;
		z-index: 1;
		margin-top: 0px;
		top: 0px;
	}
	#loading-center{
		width: 100%;
		height: 100%;
		position: relative;
		}
	#loading-center-absolute {
		position: absolute;
		left: 50%;
		top: 50%;
		height: 200px;
		width: 200px;
		margin-top: -100px;
		margin-left: -100px;
		-ms-transform: rotate(-135deg); 
	   	-webkit-transform: rotate(-135deg); 
	    transform: rotate(-135deg);
	}
	.object{

		-moz-border-radius: 50% 50% 50% 50%;
		-webkit-border-radius: 50% 50% 50% 50%;
		border-radius: 50% 50% 50% 50%;
		position: absolute;
		border-top: 5px solid #FFF;
		border-bottom: 5px solid transparent;
		border-left:  5px solid #FFF;
		border-right: 5px solid transparent;
		
		-webkit-animation: animate 2s infinite;
		animation: animate 2s infinite;	

		}
	#object_one{
		left: 75px;
		top: 75px;
		width: 50px;
		height: 50px;
		}
								
	#object_two{
		left: 65px;
		top: 65px;
		width: 70px;
		height: 70px;
		-webkit-animation-delay: 0.2s;
	    animation-delay: 0.2s;
		}
			
	#object_three{
		left: 55px;
		top: 55px;
		width: 90px;
		height: 90px;
		-webkit-animation-delay: 0.4s;
	    animation-delay: 0.4s;
		}
	#object_four{
		left: 45px;
		top: 45px;
		width: 110px;
		height: 110px;
		-webkit-animation-delay: 0.6s;
	    animation-delay: 0.6s;
		
		}	

	@-webkit-keyframes animate {
	 

	50% {

		-ms-transform: rotate(360deg) scale(0.8); 
	   	-webkit-transform: rotate(360deg) scale(0.8); 
	    transform: rotate(360deg) scale(0.8); 
	  }
	}

	@keyframes animate {
		
	50% {

		-ms-transform: rotate(360deg) scale(0.8); 
	   	-webkit-transform: rotate(360deg) scale(0.8); 
	    transform: rotate(360deg) scale(0.8); 
	  }	
	}
	</style>
</head>
<body>
	<script type="text/javascript">
		$(function(){
			
			setTimeout("click1()",2000);
			
		});
		function click1(){
			$("#loading").click();
		}
		function loadIndex(){
			setTimeout("window.location.href='login.jsp'",1000);
		};
	</script>
	<div id="loading" onclick="loadIndex()">
		<div id="loading-center"  >
			<div id="loading-center-absolute">
				<div class="object" id="object_four"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_one"></div>
			</div>
		</div>
	</div>
</body>
</html>