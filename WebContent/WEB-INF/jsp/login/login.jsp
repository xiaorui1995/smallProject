<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
<form id="form1">
	用户名：<input type="text" name="userName"/>
	密码：<input type="password" name="password">
	<input type="button" value="登录" onclick="login()">
	<!-- <input type="submit" value="登录"> -->
</form>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script>
	function login(){
		$.ajax({
			type:"post",
			url:"login.action",
			data:$("#form1").serialize(),
			success:function(result){
				if(result.retcode == 0){
					alert(result.retmsg);
					//alert(result.user.id);
					window.location.href="index.action";
				}else{
					alert(result.retmsg);
				}
			}
		});
	}
</script>
</html>