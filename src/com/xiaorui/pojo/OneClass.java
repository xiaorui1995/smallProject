package com.xiaorui.pojo;

import java.util.List;

public class OneClass {
	private int id;
	private String name;
	private List<TwoClass> list;
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
	public List<TwoClass> getList() {
		return list;
	}
	public void setList(List<TwoClass> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "OneClass [id=" + id + ", name=" + name + ", list=" + list + "]";
	}
	
}
