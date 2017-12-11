<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addPlan.action" method="get">
	计划名称：<input type="text" name="planName"/><br>
	计划内容：<textarea name="planContent"></textarea><br>
	<input type="submit" value="确定"/>
</form>
<button onclick="updatePlanList()">updatePlanList</button>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	//	批量增
	function updatePlanList(){
		var planList = new Array();
		planList.push({id:5,planName:"1111",planContent:"1111",userId:"67"});
		planList.push({id:6,planName:"2222",planContent:"2222",userId:"67"});
		planList.push({id:7,planName:"3333",planContent:"3333",userId:"67"});
		console.log(planList);
		$.ajax({
			type:"post",
			url:"updatePlanList.action",
			data:JSON.stringify(planList),
			dataType:"json",
			contentType:"application/json;charset=utf-8",
			success:function(result){
	/* 				console.log(JSON.stringify(result)); */
					alert("调用成功");
			},
			error:function(err){
				console.log("err:"+JSON.stringify(err));
				alert("服务器错误");
			}
		});
	}
</script>
</html>