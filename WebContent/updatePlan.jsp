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
    
    body{font-size:0.12rem;}    
    li{border-bottom:1px solid black;}
    #planList ul li:LAST-CHILD {border-bottom:none;}
</style>
<body>
<h4>批量修改 </h4>
<div id="planList">
	<form id="form1">
		<ul>
			<li>
				<label>计划名称：<input type="text" name="plans[0].planName"/></label><br>
				<label>计划内容：<textarea name="plans[0].planContent"></textarea></label>				
			</li>
			<li>
				<label>计划名称：<input type="text" name="plans[0].planName"/></label><br>
				<label>计划内容：<textarea name="plans[0].planContent"></textarea></label>				
			</li>
			</ul>
			<button onclick="addPlanList();return false;">提交</button>
	</form>
</div>	
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</html>