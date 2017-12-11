package com.xiaorui.pojo;

public class TwoClass {
	private int id;
	private String name;
	private int oneClassId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOneClassId() {
		return oneClassId;
	}
	public void setOneClassId(int oneClassId) {
		this.oneClassId = oneClassId;
	}
	@Override
	public String toString() {
		return "TwoClass [id=" + id + ", name=" + name + ", oneClassId=" + oneClassId + "]";
	}
	
}
