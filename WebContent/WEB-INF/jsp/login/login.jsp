<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
 <meta content="yes" name="apple-mobile-web-app-capable">
 <meta content="black" name="apple-mobile-web-app-status-bar-style">
 <meta content="telephone=no" name="format-detection">
 <meta content="email=no" name="format-detection">
<title>登录</title>
</head>
<style>
	html { font-size: 100px; }
	@media(min-width: 320px) { html { font-size: 100px; } }
	@media(min-width: 360px) { html { font-size: 112.5px; } }
	@media(min-width: 400px) { html { font-size: 125px; } }
	@media(min-width: 640px) { html { font-size: 200px; } }
	body{font-family: "Helvetica Neue", Helvetica, sans-serif;}
	a,button,input,optgroup,select,textarea{
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}	
	#form-div{font-size:0.12rem;width:100%;margin:5% auto}
	#form1{margin:0 10%;}
	.tr-100{width:100%;}
	.td-width-20{width:20%;}
	.td-width-80{width:80%;}
	button{font-size:0.12rem;}
	input{width:100%;}
</style>
<body>
</body>
	<div id="form-div">
		<h4 style="text-align: center;color:blue;">欢迎登录本系统</h4>
		<form id="form1">
			<table width="100%">
				<tr class="tr-100">
					<td class="td-width-20">用户名：</td>
					<td class="td-width-80"><input type="text" id="userName" name="userName"/></td>
				</tr>
				<tr class="tr-100">
					<td class="td-width-20">密码：</td>
					<td class="td-width-80"><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td></td>
					<td><button onclick="login();return false;">登录</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script>
	function login(){
		var userName = $("#userName").val();
		var password = $("#password").val();
		console.log($("#form1").serialize());
		if(userName == ''){
			alert("用户名不能为空");
			return false;
		}
		if(password == ''){
			alert("密码不能为空");
			return false;
		}
		$.ajax({
			type:"post",
			url:"login.action",
			data:$("#form1").serialize(),
			success:function(result){
				
				if(result.retcode == 0){//登录成功
					alert(result.retmsg);
					window.location.href="pagePlanList.action";
					//window.location.href="index.action";
				}else{//登录失败
					alert(result.retmsg);
				}
			},
			error:function(err){
				console.log(err);
			}
		});
	}
</script>
</html>