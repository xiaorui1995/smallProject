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
    -webkit-tap-highlight-color: rgba(0,0,0,0);}	
</style>
<body>
<!-- 分页的逻辑判断 -->
共有${pageUser.totalRecord}个用户，共${pageUser.totalPage }页，当前为第${pageUser.pageNum}页
            <ul>
            	<c:forEach items="${pageUser.list }" var="lists">
            		<li>${lists.userName }</li>
            	</c:forEach>
            </ul>
            <br/>
            <a href="index.action?pageNum=1">首页</a>
            <!-- 如果当前页为第一页时，就没有上一页这个超链接显示 -->
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
           <!--  如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 -->
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
            <!-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 -->
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
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</html>