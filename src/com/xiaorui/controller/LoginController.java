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
import javax.servlet.http.HttpSession;

import org.junit.validator.PublicClassValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.dialect.oracle.ast.clause.ModelClause.ReturnRowsClause;
import com.alibaba.druid.sql.visitor.functions.If;
import com.alibaba.druid.stat.TableStat.Mode;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xiaorui.pojo.User;
import com.xiaorui.service.LoginService;
import com.xiaorui.service.UserService;
import com.xiaorui.util.ObjectToJson;
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
	public void login(HttpServletRequest request,HttpServletResponse response)throws Exception {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		 
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		User existUser = userService.selectUser(user);
		Map<String, Object> result = new HashMap<>();
		if (existUser != null) {
			request.getSession().setAttribute("user", existUser);
			result.put("retcode", "0");
			result.put("retmsg", "登录成功");
			ObjectToJson.writeToJson(result, response);
		}else{
			result.put("retcode", "1");
			result.put("retmsg", "用户名或者密码错误");
			ObjectToJson.writeToJson(result, response);
		}
	}
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,HttpServletResponse response,Model model){
		User user = (User) request.getSession().getAttribute("user");
		System.out.println(user);
		model.addAttribute("userName", user.getUserName());
		String pageString = request.getParameter("pageNum");
		int pageNum = 1;
		if (pageString != null) {
			pageNum = Integer.valueOf(pageString);
		}
		int pageSize = 5;
		PageBean<User> user2 = userService.findUserByPage(pageNum, pageSize);
		model.addAttribute("pageUser", user2);//分页的用户数据
		System.out.println("用户分页的数据"+user2);
		return "login/index";
	}
	
	@RequestMapping(value="/logout")  
    public String logout(HttpSession session) throws Exception{  
        //清除Session  
        session.invalidate();  
          
        return "redirect:login.action";  
    }  

	@RequestMapping(value="/register",method={RequestMethod.GET})
	public String register(){
	 
		return "/login/register";
	}
	/**
	 * 用户注册
	 */
	@RequestMapping(value="/register",method={RequestMethod.POST})
	@ResponseBody
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
	
	 //登录后index 实现分页功能
	 
	/*@RequestMapping(value="/index")
	public String index(HttpServletRequest request,HttpServletResponse response,Model model){
		//User user = (User) request.getSession().getAttribute("user");
		String userName = (String) request.getSession().getAttribute("userName");
		String password = (String) request.getSession().getAttribute("password");
		System.out.println(userName+":::::"+password);
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
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
	}*/
}
