package com.xiaorui.pojo;

import java.util.Date;

public class Plan {
	private int id;
	private String planName;
	private Date createTime;
	private String planContent;
	private int userId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getPlanContent() {
		return planContent;
	}
	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Plan [id=" + id + ", planName=" + planName + ", createTime=" + createTime + ", planContent="
				+ planContent + ", userId=" + userId + "]";
	}
}
