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
<title>个人中心</title>
</head>
<style>
body, h1, h2, h3, h4, h5, h6, hr, p, blockquote, dl, dt, dd, ul, ol, li, pre, form, fieldset, legend, button, input, textarea, th, td { margin:0; padding:0; }
body, button, input, select, textarea { font:12px/1.5tahoma, arial, \5b8b\4f53; }
h1, h2, h3, h4, h5, h6{ font-size:100%; }
address, cite, dfn, em, var { font-style:normal; }
code, kbd, pre, samp { font-family:couriernew, courier, monospace; }
small{ font-size:12px; }
ul, ol { list-style:none; }
a { text-decoration:none; }
a:hover { text-decoration:underline; }
sup { vertical-align:text-top; }
sub{ vertical-align:text-bottom; }
legend { color:#000; }
fieldset, img { border:0; }
button, input, select, textarea { font-size:100%; }
table { border-collapse:collapse; border-spacing:0; }


	html { font-size: 100px; }
	@media(min-width: 320px) { html { font-size: 100px; } }
	@media(min-width: 360px) { html { font-size: 112.5px; } }
	@media(min-width: 400px) { html { font-size: 125px; } }
	@media(min-width: 640px) { html { font-size: 200px; } }
	body{font-family: "Helvetica Neue", Helvetica, sans-serif;}
	a,button,input,optgroup,select,textarea{
    -webkit-tap-highlight-color: rgba(0,0,0,0);}
    body{font-size: .12rem;}	

    #left-div{float:left;width:20%;}
    #right-div{float:right;width:80%;}
    .left-div-model{cursor:pointer;text-align: center; }
    #left-one{background-color: red;}
    #left-two{background-color: blue;}
    #right-one{background-color:LightSkyBlue;}
    #right-two{background-color: yellow;}
    
    li{border-bottom:1px solid black;padding-right:0.1rem;}
	#right-one ul li span:LAST-CHILD {float:right;}
	#right-one ul li:FIRST-CHILD{font-size:0.1rem;}
	#right-one ul li:LAST-CHILD {float:right;border-bottom:none;}
</style>
<body>
 <div id="left-div">
    <div id="left-one" class="left-div-model" onclick="toggle()">计划管理</div>
    <div id="left-two" class="left-div-model" onclick="toggle()">左二</div>
 </div>
 <div id="right-div">
    <div id="right-one" class="right-div-model">
    	<ul>
    		<li>
    		<a href="">新增计划</a>|
    		<a href="">批量新增</a>|
    		<a href="">批量删除</a>|
    		<a href="">批量修改</a>
    		</li>
    		<li>
    			<label><input type="checkbox" name="batch" value=""></label>
    			<span>title时间</span>
    			<span><a href="">详情</a>|<a href="">修改</a>|<a href="">删除</a></span>
    		</li>
    		<li>
    			<label><input type="checkbox" name="batch" value=""></label>
    			<span>title时间</span>
    			<span><a href="">详情</a>|<a href="">修改</a>|<a href="">删除</a></span>
    		</li>
    		<li>
    			<label><input type="checkbox" name="batch" value=""></label>
    			<span>title时间</span>
    			<span><a href="">详情</a>|<a href="">修改</a>|<a href="">删除</a></span>
    		</li>
    		<li>
    			<label><input type="checkbox" name="batch" value=""></label>
    			<span>title时间</span>
    			<span><a href="">详情</a>|<a href="">修改</a>|<a href="">删除</a></span>
    		</li>
    		<li>我是分页</li>
    	</ul>
    </div>
    <div id="right-two" class="right-div-model" style="display:none;">
   		功能谋划中
   </div>
 </div>

</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script>
	function toggle(){		
		var rightOne= $("#right-one").css("display");
		console.log(rightOne);
		if("block"== rightOne){
			$("#right-one").css("display","none");
		}else{
			$("#right-one").css("display","block");
		}
		$("#right-two").toggle();
	}
</script>
</html>