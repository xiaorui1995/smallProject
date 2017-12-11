<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4><a href="login.action">请登录</a></h4>
<h4><a href="login.action">登录</a></h4>
<h4><a href="register.action">注册</a></h4>

<form action="uploadFile.action" method="post" enctype="multipart/form-data">  
<input type="file" name="file" /> <input type="submit" value="上传文件" /></form><br>
<button onclick="testListString()">testListString</button>
<button onclick="testListObject()">testListObject</button>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function testListObject(){
		/* var mapList = new Array();
		mapList.push({id111:"1111"});
		mapList.push({id222:"2222"});
		mapList.push({id333:"3333"});
		var idList = new Array();
		idList.push({id:"1",userName:"test1",password:"11111",mapList:mapList});
		idList.push({id:"2",userName:"test2",password:"22222",mapList:mapList});
		idList.push({id:"3",userName:"test3",password:"33333",mapList:mapList}); */
		
		var userList = new Array();
		userList.push({userName:"test1"});
		userList.push({userName:"test2"});
		var user = {};
		user.id = "111";
		user.userName = "222";
		user.password = "333";
		user.users = userList;
		/*console.log(user); */
		$.ajax({
			 type: "post",  
			    url: "testListObject.action",  
			    dataType: 'json',  
			    data:JSON.stringify(user),
			    contentType:"application/json;charset=utf-8",
			    //data:{"idList1":JSON.stringify(idList)},
			    //data: {"idList":idList},  list<对象>不能这样提交
			    success: function(data){  
			       console.log(data);
			    },  
			    error: function(res){  
			    	console.log(res);
			    }  
		});
	}
	function testListString(){
		var idList = new Array();
		idList.push("1111");
		idList.push("2222");
		idList.push("3333");
		$.ajax({
			 type: "POST",  
			    url: "testListString.action",  
			    dataType: 'json',  
			    data: {"idList":idList,"isBatch":"false"},  
			    success: function(data){  
			       console.log(data);
			    },  
			    error: function(res){  
			    	console.log(res);
			    }  
		});
	}
</script>
</html>