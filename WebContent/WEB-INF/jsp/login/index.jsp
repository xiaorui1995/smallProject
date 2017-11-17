<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>登录成功</h4>
id:${user.id}<br>
用户名：${user.userName}<br>
密码：${user.password}<br>

            共有${pageUser.totalRecord}个用户，共${pageUser.totalPage }页，当前为第${pageUser.pageNum}页
            <ul>
            	<c:forEach items="${pageUser.list }" var="lists">
            		<li>${lists.userName }</li>
            	</c:forEach>
            </ul>
            <br/>
            <a href="index.action?pageNum=1">首页</a>
            <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
            <c:if test="${pageUser.pageNum ==1}">
                <c:forEach begin="${pageUser.start}" end="${pageUser.end}" step="1" var="i">
                    <c:if test="${pageUser.pageNum == i}">
                        <span style="color:red;">${i}</span>
                    </c:if>                
                    <c:if test="${pageUser.pageNum != i}">
                        <a href="index.action?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="index.action?pageNum=${pageUser.pageNum+1}">下一页</a>                    
            </c:if>
            <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${pageUser.pageNum > 1 && pageUser.pageNum < pageUser.totalPage}">
                <a href="index.action?pageNum=${pageUser.pageNum-1}">上一页</a>
                <c:forEach begin="${pageUser.start}" end="${pageUser.end}" step="1" var="i">    
                    <c:if test="${pageUser.pageNum == i}">
                        <span style="color:red;">${i}</span>
                    </c:if>            
                    <c:if test="${pageUser.pageNum != i}">
                        <a href="index.action?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="index.action?pageNum=${pageUser.pageNum+1}">下一页</a>    
            </c:if>
            <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
            <c:if test="${pageUser.pageNum == pageUser.totalPage}">
                <a href="index.action?pageNum=${pageUser.pageNum-1}">上一页</a>
                <c:forEach begin="${pageUser.start}" end="${pageUser.end}" step="1" var="i">
                   <!-- 当前页 -->
                    <c:if test="${pageUser.pageNum == i}">
                        <span style="color:red;">${i}</span>
                    </c:if>
                    <c:if test="${pageUser.pageNum != i}">
                        <a href="index.action?pageNum=${i}">${i}</a>                                        
                    </c:if>                
                </c:forEach>
            </c:if>
            <!-- 尾页 -->
            <a href="index.action?pageNum=${pageUser.totalPage}">尾页</a>
</body>
</html>