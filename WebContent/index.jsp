<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>欢迎登录本系统</h4>
<h4><a href="login.action">登录</a></h4>
<h4><a href="register.action">注册</a></h4>

<form action="uploadFile.action" method="post" enctype="multipart/form-data">  
<input type="file" name="file" /> <input type="submit" value="上传文件" /></form>
</body>
</html>