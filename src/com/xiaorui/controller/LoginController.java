package com.xiaorui.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.validator.PublicClassValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.druid.sql.dialect.oracle.ast.clause.ModelClause.ReturnRowsClause;
import com.alibaba.druid.stat.TableStat.Mode;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xiaorui.pojo.User;
import com.xiaorui.service.LoginService;
import com.xiaorui.service.UserService;
import com.xiaorui.util.PageBean;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login",method={RequestMethod.GET})
	public String login(){
		
		return "/login/login";
	}
	/**
	 * 用户登录
	 */
	@RequestMapping(value="/login",method={RequestMethod.POST})
	public void login(HttpServletRequest request,HttpServletResponse response,Model model){
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		System.out.println("username:"+userName+",password:"+password);
		
		User user1 = new User();
		user1.setUserName(userName);
		user1.setPassword(password);
		
		User user = userService.selectUser(user1);
		//System.out.println("user:"+user);
		if(user != null) {
			request.getSession().setAttribute("user", user);//登录成功用户存session
			Map<String, Object> result = new HashMap<>();
			result.put("retcode", "0");
			result.put("retmsg", "登录成功");
			result.put("user", user);
			String resultJson = JSONObject.toJSON(result).toString();
			try {
				response.setContentType("text/json;charset=utf-8");
				response.getWriter().write(resultJson);
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}else{
			Map<String, Object> result = new HashMap<>();
			result.put("retcode", "1");
			result.put("retmsg", "用户名或者密码错误");
			String resultJson = JSONObject.toJSON(result).toString();
			response.setContentType("text/json;charset=utf-8");
			try {
				response.getWriter().write(resultJson);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@RequestMapping(value="/register",method={RequestMethod.GET})
	public String register(){
	 
		return "/login/register";
	}
	/**
	 * 用户注册
	 */
	@RequestMapping(value="/register",method={RequestMethod.POST})
	public void register(HttpServletRequest request,HttpServletResponse response,User user,Model model){
		Map<String, Object> result = loginService.register(user);
		String resultJson = JSONObject.toJSON(result).toString();
		try {
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(resultJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/*
	 * 登录后index 实现分页功能
	 */
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,HttpServletResponse response,Model model){
		User user = (User) request.getSession().getAttribute("user");
		//System.out.println("session:"+user);
		model.addAttribute(user);
		//以分页的形式获取用户数据
		String pageNumString = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageNumString != null) {
			pageNum = Integer.valueOf(pageNumString);
		}
		int pageSize = 5;
		PageBean<User> pBean = userService.findUserByPage(pageNum, pageSize);
		model.addAttribute("pageUser", pBean);//分页的用户数据
		System.out.println("用户分页的数据"+pBean);
		return "login/index";
	}
}
