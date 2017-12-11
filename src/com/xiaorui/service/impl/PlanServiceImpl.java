package com.xiaorui.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaorui.mapper.ClassMapper;
import com.xiaorui.mapper.PlanMapper;
import com.xiaorui.pojo.OneClass;
import com.xiaorui.pojo.Plan;
import com.xiaorui.pojo.User;
import com.xiaorui.service.ClassService;
import com.xiaorui.service.PlanService;
import com.xiaorui.util.PageBean;

@Service
public class PlanServiceImpl implements PlanService{
	
	@Autowired
	private PlanMapper planMapper;
	
	@Override
	public PageBean<Plan> pagePlan(Map<String, Object> param) {
		int pageNum = (int) param.get("pageNum");
		int pageSize = (int) param.get("pageSize");
		int totalRecord = planMapper.total();//总条数
		PageBean<Plan> pageBean = new PageBean<>(pageNum,pageSize,totalRecord);
		int startIndex = pageBean.getStartIndex();
		param.put("startIndex", startIndex);
		List<Plan> planList = planMapper.pagePlan(param);
		System.out.println("planList:"+planList);
		for (int i = 0; i < planList.size(); i++) {
			SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = planList.get(i).getCreateTime();
			String dateString = dFormat.format(date);
			System.out.println("dateString:"+dateString);
		}
		pageBean.setList(planList);
		return pageBean;
	}
	@Override
	public Plan planDetail(String id){
		return planMapper.planDetail(id);
	}
	@Override
	public int addPlan(Plan plan) {
		return planMapper.addPlan(plan);
	}
	public int deletePlan(int id,int userId){
		return planMapper.deletePlan(id,userId);
	}
	@Override
	public int updatePlan(Map<String, Object> params) {
		return planMapper.updatePlan(params);
	}
	@Override
	public int updatePlan(Plan plan) {
		return planMapper.updatePlan(plan);
	}
	@Override
	public int addPlanList(List<Plan> plans){
		return planMapper.addPlanList(plans);
	}
	@Override
	public int deletePlanList(List<Integer> planList) {
		// TODO Auto-generated method stub
		return planMapper.deletePlanList(planList);
	}
	@Override
	public int updatePlanList(List<Plan> planList) {
		// TODO Auto-generated method stub
		return planMapper.updatePlanList(planList);
	}
}
