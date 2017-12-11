package com.xiaorui.pojo;

import java.util.List;

public class PlanList {
	private List<Plan> plans;

	public List<Plan> getPlans() {
		return plans;
	}

	public void setPlans(List<Plan> plans) {
		this.plans = plans;
	}

	@Override
	public String toString() {
		return "PlanList [plans=" + plans + "]";
	}
}
