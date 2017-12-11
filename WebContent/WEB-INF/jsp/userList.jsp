<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String path = request.getContextPath(); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<title>USER</title>
</head>
<body>  
<button onclick="testListObject()">testListObject</button>
</body>
<script type="text/javascript">
function testListObject(){
	var idList = new Array();
	idList.push({id:"1",userName:"test1",password:"11111"});
	idList.push({id:"2",userName:"test2",password:"22222"});
	idList.push({id:"3",userName:"test3",password:"33333"});
	$.ajax({
		 type: "get",  
		    url: "testListObject.action",  
		    dataType: 'json',  
		    data:{"idList1":JSON.stringify(idList)},
		    //data: {"idList":idList},  list<对象>不能这样提交
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