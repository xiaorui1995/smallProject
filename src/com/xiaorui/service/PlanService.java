package com.xiaorui.service;

import java.util.List;
import java.util.Map;

import com.xiaorui.pojo.Plan;
import com.xiaorui.util.PageBean;

public interface PlanService {
	public PageBean<Plan> pagePlan(Map<String, Object> param);
	
	public Plan planDetail(String id);
	
	public int addPlan(Plan plan);
	
	public int deletePlan(int id,int userId);
	
	public int updatePlan(Map<String, Object> params);
	
	public int updatePlan(Plan plan);
	
	public int addPlanList(List<Plan> plans);
	
	public int deletePlanList(List<Integer> planList);
	
	public int updatePlanList(List<Plan> planList);
}
