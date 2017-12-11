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
<title>新增计划</title>
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
    body{font-size: 0.12rem;}	
    
    li{border-bottom:1px solid black;}
    #planList ul li:LAST-CHILD {border-bottom:none;}
</style>
<body>
<!-- <h4>(批量)新增计划</h4>
<form action="addPlan.action" method="get">
	计划名称：<input type="text" name="planName"/><br>
	计划内容：<textarea name="planContent"></textarea><br>
	<input type="submit" value="确定"/>
</form> -->
<h4>新增计划</h4>
<div id="planList">
	<form id="form1">
		<ul>
			<li>
				<label>计划名称：<input type="text" name="plans[0].planName"/></label><br>
				<label>计划内容：<textarea name="plans[0].planContent"></textarea></label>
				<span onclick="nextMore()">增加</span>|
				<span onclick="deletePresent(this)">删除</span><br>
			</li>
			</ul>
			<button onclick="addPlanList();return false;">提交</button>
	</form>
</div>	
<!-- <button onclick="addPlanList()">addPlanList</button> -->
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
	function nextMore(){
		var liLength = $("li").length;
		var idLength = liLength;
		console.log("liLegth:"+$("li").length);
		$("#planList ul").append(
			'<li><label>计划名称：<input type="text" name="plans['+idLength+'].planName"/></label><br>'+
			'<label>计划内容：<textarea name="plans['+idLength+'].planContent"></textarea></label>'+
			'<span onclick="nextMore()">增加</span>|'+
			'<span onclick="deletePresent(this)">删除</span><br>	'
		);
		console.log(
				'<li><label>计划名称：<input type="text" id="plans['+idLength+'].planName"/></label><br>'+
				'<label>计划内容：<textarea id="plans['+idLength+'].planContent"></textarea></label>'+
				'<span onclick="nextMore()">增加</span>|'+
				'<span onclick="deletePresent(this)">删除</span><br>	'		
		);
	}
	function deletePresent(index){
		//alert($(index));//获取当前元素
		var liLength = $("li").length;
		console.log("liLength:"+liLength);
		if(liLength > 1){
			$(index).parent().css("display","none");
			console.log("父元素display:"+$(index).parent().css("display"));	
		}else{
			alert("至少新增一个");
		}
	}
	//	批量增
	function addPlanList(){
		console.log("form:"+$("#form1").serialize());
		$.ajax({
			type:"post",
			url:"addPlanList.action",
			data:$("#form1").serialize(),
			dataType:"json",
			success:function(result){
			},
			error:function(err){
				console.log("err:"+err);
			}
		});
	}
</script>
</html>