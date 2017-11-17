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
<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>id</td>
        <td>name</td>
    </tr>
    <c:forEach items="${userList}" var="user" varStatus="st">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
               
        </tr>
    </c:forEach>
</table>
    <div style="text-align:center">
        <a href="?start=0">首  页</a>
        	<a href="?start=${page.start-page.count}">上一页</a>
        	<a href="?start=${page.start+page.count}">下一页</a>
        <%-- <c:if test="${(page.start-page.count)<0 }">
        	<a disabled style="color:red;">上一页</a>
        </c:if>
        <c:if test="${(page.start-page.count)>=0 }">
        	<a href="?start=${page.start-page.count}">上一页</a>
        </c:if> 
        
        <c:if test="${(page.start+page.count)<page.total }">
        	<a href="?start=${page.start+page.count}">下一页</a>
        </c:if> 
        <c:if test="${(page.start+page.count)>=page.total }">
        	<a  disabled style="color:red;">下一页</a>
        </c:if>  --%>
        
        <a href="?start=${page.last}">末  页</a>
    </div>
</body>
<script>
	var count = 0;
	function onclick1(){
		if(count>0){
			alert("现在已经是最后一页了");
		}
		count++;
	}
</script>
</html>