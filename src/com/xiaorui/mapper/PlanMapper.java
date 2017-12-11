package com.xiaorui.mapper;

import java.util.List;
import java.util.Map;

import javax.crypto.MacSpi;

import com.xiaorui.pojo.Plan;

public interface PlanMapper {
	
	public List<Plan> pagePlan(Map<String, Object> param);
	
	public int total();//总条数
	
	public Plan planDetail(String id);
	
	public int addPlan(Plan plan);
	
	public int deletePlan(int id,int userId);
	
	public int updatePlan(Map<String, Object> params);
	
	public int updatePlan(Plan plan);
	
	public int addPlanList(List<Plan> plans);
	
	public int deletePlanList(List<Integer> planList);
	
	public int updatePlanList(List<Plan> planList);
}
