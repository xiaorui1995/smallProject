package com.xiaorui.test;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.xiaorui.pojo.User;
import com.xiaorui.service.TestService;

@Controller
public class Test {
	@Autowired
	private TestService testService;
	@RequestMapping("/testListObject")
	@ResponseBody
	public void testListObject(HttpServletResponse response,@RequestBody User user){//List<User>  User[] List<Map<String, Object>> idList
		/*
		String string = request.getParameter("idList1");
		List<Map<String, Object>> list = (List<Map<String, Object>>)JSON.parse(string);//前台以json字符串传输，
		//后台再解析json字符串成相应的类型；类型不一致会报错
		System.out.println(list);*/
		
		/*@RequestBody List<User> idList;//前台以json字符串传输，contentType : 'application/json;charset=utf-8', //设置请求头信息
		System.out.println(idList);*/
		
		/*for(int i=0;i<idList.length;i++){
			System.out.println(idList[i]);
		}*/
		
		/*System.out.println("List<Map<String, Object>>:"+idList);*/
		
		System.out.println("user:"+user);
		/*System.out.println("list<user>:"+user.getUsers());*/
		
		String resultJson = JSONObject.toJSON(user).toString();
		try {
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(resultJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/testInsert")
	public void testInsert(){
		System.out.println("::::"+new Date());
		List<Map<String, Object>> list = new LinkedList<>();
		/*List<User> list = new LinkedList<>();*/
		for (int i = 0; i < 10000; i++) {
			/*User user = new User();
			user.setId(36+i);
			user.setUserName("test"+i);
			user.setPassword("password"+i);*/
			Map<String, Object> map = new HashMap<>();
			map.put("id", i);
			/*map.put("name", i);*/
			list.add(map);
		}
		//System.out.println(list);
		//System.out.println(new Date());
		System.out.println(list);
		testService.testInsert(list);
		System.out.println(new Date());
	}
	@RequestMapping(value="/selectId")
	public void selectId(){
		System.out.println(new Date());
		List<Map<String, Object>> test = testService.selectId(1000);
		System.out.println(test);
		System.out.println(new Date());
	}
}
