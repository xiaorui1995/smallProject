package com.xiaorui.pojo;

import java.util.List;

public class Users {
	private String userName;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Users [userName=" + userName + "]";
	}
}
