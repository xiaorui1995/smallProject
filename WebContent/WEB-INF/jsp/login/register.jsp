<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>注册</h1>
	<form id="form1" method="post">
		用户名：<input type="text" name="userName" id="userName"/><span id="span1" style="color:red;"></span><br>
		密码：<input type="password" name="password" id="password"/><span id="span2" style="color:red;"></span><br>
		确认密码：<input type="password" name="password1" id="password1"/><span id="span3" style="color:red;"></span><br> 
		<input type="button" onclick="register()" value="注册">
	</form>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script>
	 function register(){
		 /* var userName = $("#userName").val();
		 var password = $("#password").val();
		 var password1 = $("#password1").val();
		 if(userName ==""||userName == null ){
			 $("#span1").html("用户名不能为空");
			 return;
		 }else{
			 $("#span1").html(""); 
		 }
		 if(password ==""||password ==null){
			 $("#span2").html("密码不能为空");
			 return;
		 }else{
			 $("#span2").html("");
		 }
		 if(password != password1){
			 $("#span3").html("两次密码输入不一致");
			 return;
		 }else{
			 $("#span3").html("");
		 } */
		 console.log("...."+$('#form1').serialize());
		$.ajax({
			type:"post",
			url:"register.action",
			data:$("#form1").serialize(),
			success: function(result) {
              if(result.retcode == 1){
            	  alert(result.retmsg);
              }else{
            	  alert(result.retmsg);
            	  window.location.href="login.action"; 
              } 
            }
		});
	}
</script>
</html>