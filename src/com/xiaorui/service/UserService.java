package com.xiaorui.service;

import java.util.List;

import com.xiaorui.pojo.User;
import com.xiaorui.util.PageBean;

public interface UserService {
	
	public User selectUser(User user);
	
	public PageBean<User> findUserByPage(int pageNum,int pageSize);
	
	public int total();
}
