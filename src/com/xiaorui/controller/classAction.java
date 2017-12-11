package com.xiaorui.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.internal.Classes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.xiaorui.pojo.OneClass;
import com.xiaorui.service.ClassService;

@Controller
public class classAction {
	@Autowired
	private ClassService classService;
	//insert
	//update
	//delete
	//select
	@RequestMapping(value="/searchOneClass")
	public void searchOneClass(HttpServletRequest request,HttpServletResponse response,Model model,Integer id){
		System.out.println("id:"+id.getClass());
		
		OneClass oneClass = classService.searchOneClass(id);
		System.out.println("oneClass:"+oneClass); 
		System.out.println("list:"+oneClass.getList());
		String resultJson = JSONObject.toJSON(oneClass).toString();
		try {
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(resultJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
