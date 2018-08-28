<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/design/youran_customer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<script>
	$.validator.setDefaults({
	    submitHandler: function() {
	      alert("提交事件!");
	    }
	});
	$().ready(function() {
	    $("#form_test1").validate();
	});
	</script>
	<div>
	<form id="form_test1" >
	<table  style="background-color: pink;border: solid;" align="center"  align="center">
	<thead>
		<tr>
			<th colspan="2">测试注册</th>
		</tr>
	</thead>
	<tbody>
	<tr>
		<td><label for="name">name:(必需, 最小7个字母)</label></td>
		<td><input id="name" minlength="7" required/></td>
	</tr>
	<tr>
		<td><label for="password">password:</label></td>
		<td><input id="password" /></td>
	</tr>
	<tr>
		<td><label for="repassword">repassword:</label></td>
		<td><input id="repassword" /></td>
	</tr>	
	<tr>
		<td><label for="email">email:</label></td>
		<td><input id="email" /></td>
	</tr>
	<tr>
		<td><input type="submit" value="提交"/></td>
		<td><input type="reset" value="重置"/></td>
	</tr>
	</tbody>
	</table>
	</form>	
	</div>


<!-- 	
	id:${user.user_id}<br/>
	code:${user.user_code}<br/>
	name:${user.user_name}<br/>
	password:${user.user_password}<br/>
	state:${user.user_state}<br/> 
-->
</body>
</html>
