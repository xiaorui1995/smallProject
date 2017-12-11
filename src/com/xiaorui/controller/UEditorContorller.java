package com.xiaorui.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UEditorContorller {
	@RequestMapping(value="/test")
	public void test(HttpServletRequest request,HttpServletResponse response){
		String param = request.getParameter("content");
		System.out.println(".......:"+param);
	}

}
