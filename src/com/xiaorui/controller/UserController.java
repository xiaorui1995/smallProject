package com.xiaorui.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.xiaorui.service.UserService;

@Controller
/*@RequestMapping("")*/
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/userList")
	public String listUser(HttpServletRequest request,HttpServletResponse response,Model model){
		
		return "userList";
	}
}
