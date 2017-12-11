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
<button onclick="deletePlanList()">deletePlanList</button>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	//	批量增
	function deletePlanList(){
		var planList = new Array();
		planList.push(4);
		planList.push(5);
		planList.push(6);
		/* planList.push({id:"2",planName:"1111",planContent:"1111",userId:"67"});
		planList.push({id:"3",planName:"2222",planContent:"2222",userId:"67"});
		planList.push({id:"4",planName:"3333",planContent:"3333",userId:"67"}); */
		console.log(planList);
		$.ajax({
			type:"post",
			url:"deletePlanList.action",
			data:{
				"planList":planList
			},
			//data:JSON.stringify(planList),
			 dataType:"json",
			//contentType:"application/json;charset=utf-8",
			success:function(result){
				alert("调用成功");
			},
			error:function(err){
				console.log("err:"+JSON.stringify(err));
			}
		});
	}
</script>
</html>