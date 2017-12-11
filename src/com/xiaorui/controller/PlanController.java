package com.xiaorui.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaorui.pojo.Plan;
import com.xiaorui.pojo.PlanList;
import com.xiaorui.pojo.User;
import com.xiaorui.service.PlanService;
import com.xiaorui.util.ObjectToJson;
import com.xiaorui.util.PageBean;

@Controller
public class PlanController {
	@Autowired
	private PlanService planService;
	//分页获取计划列表
	@RequestMapping(value="/pagePlanList")
	//@ResponseBody
	public String pagePlanList(HttpServletRequest request,HttpServletResponse response,Model model){
		//需要传如的参数为 用户id,当前页
		String pageString = request.getParameter("pageNum");
		User user = (User) request.getSession().getAttribute("user");
		int userId = user.getId();
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		int pageNum = 1;
		if(pageString != null){
			pageNum = Integer.valueOf(pageString);
		}
		param.put("pageNum", pageNum);
		int pageSize = 5;
		param.put("pageSize", pageSize);
		PageBean<Plan> plan= planService.pagePlan(param);
		System.out.println("分页的plan:"+plan);
		model.addAttribute("plan", plan);
		//ObjectToJson.writeToJson(plan, response);
		return "plan/planList";
	}
	//某一个计划详情
	@RequestMapping(value="/planDetail")
	@ResponseBody
	public void planDetail(String id,HttpServletResponse response,Model model){
		Plan planDetail = planService.planDetail(id);
		//model.addAttribute("planDetail", planDetail);
		ObjectToJson.writeToJson(planDetail, response);
		System.out.println(planDetail);
	}
	//增加计划(对应页面)
	@RequestMapping(value="/addPlan",method=RequestMethod.GET)
	public String addPlan(){
		return "/plan/addPlan";
	}
	//增加计划
	@RequestMapping(value="/addPlan",method=RequestMethod.POST)
	@ResponseBody
	public void addPlan(HttpServletRequest request,HttpServletResponse response,Plan plan) throws ServletException, IOException{
	System.out.println("plan:"+plan);
	System.out.println("系统当前时间："+new Date());
	/*SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	String date= dateFormat.format(new Date());*///格式化当前系统时间以字符串返回
	
	plan.setCreateTime(new Date());
	int i = planService.addPlan(plan);
	System.out.println("影响条数："+i);
	}
	//删除计划(伪删除)
	@RequestMapping(value="/deletePlan")
	@ResponseBody
	public void deletePlan(int id,int userId,Model model){
		int i = planService.deletePlan(id,userId);
		System.out.println("影响条数："+i);//返回0执行失败，否则会返回执行的条数
	}
	
	//修改计划 
	@RequestMapping(value="/updatePlan")
	@ResponseBody
	public void updatePlan(Plan plan,HttpServletResponse response,HttpServletRequest request,Model model){
		/*int id = Integer.valueOf(request.getParameter("id"));
		int userId = Integer.valueOf(request.getParameter("userId"));
		String planName = request.getParameter("planName");
		String planContent = request.getParameter("planContent");
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("userId", userId);
		params.put("planName", planName);
		params.put("planContent", planContent);
		
		int i = planService.updatePlan(params);
		System.out.println("影响行数："+i);*/
		System.out.println("plan:对象："+plan);
		int i = planService.updatePlan(plan);
		System.out.println("影响行数："+i);
	}
	//批量增删改
	@RequestMapping(value="addPlanList")
	@ResponseBody
	public void addPlanList(PlanList planList){
		System.out.println("planList:"+planList);
	}
	//addPlanList 批量增 这个前台传json字符串，设置contentType
	/*@RequestMapping(value="/addPlanList",method=RequestMethod.POST)
	@ResponseBody
	public void addPlanList(@RequestBody List<Plan> planList,HttpServletResponse response){
		System.out.println("plans:"+planList);
		for (int i = 0; i < planList.size(); i++) {
			planList.get(i).setCreateTime(new Date());
		}
		System.out.println("planList:"+planList);
		int rows = planService.addPlanList(planList);
		System.out.println("影响的行数："+rows);
		ObjectToJson.writeToJson(planList, response);
	}*/
	@RequestMapping(value="/testPlan")
	public void testPlan(@RequestParam(value="i",required=false) Integer test){
		System.out.println("int::i:::"+test);
	}
	@RequestMapping(value="/deletePlanList",method=RequestMethod.GET)
	public String deletePlanList(){
		return "/plan/deletePlan";
	}
	//deletePlanList 批量删除
	@RequestMapping(value="/deletePlanList",method=RequestMethod.POST)
	public void deletePlanList(@RequestParam("planList[]") List<Integer> planList,HttpServletRequest request,HttpServletResponse response){
		System.out.println("planList:"+planList);
		int i = planService.deletePlanList(planList);
		System.out.println("批量删除的行数："+i);
	}
	//updatePlanList 批量更新
	@RequestMapping(value="/updatePlanList",method=RequestMethod.GET)
	public String updatePlanList(){
		return "/plan/updatePlan";
	}
	//updatePlanList 批量更新
	@RequestMapping(value="/updatePlanList",method=RequestMethod.POST)
	public void updatePlanList(@RequestBody List<Plan> planList,HttpServletResponse response){
		System.out.println("planList:"+planList);
		int i = planService.updatePlanList(planList);
		System.out.println("影响行数："+i);
		//ObjectToJson.writeToJson(i, response);
	}
}
