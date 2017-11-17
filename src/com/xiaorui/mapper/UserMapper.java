package com.xiaorui.mapper;

import java.util.List;

import com.xiaorui.pojo.User;

public interface UserMapper {
		
	public User selectUser(User user);//数据库中是否存在
	
	public List<User> list(int startIndex,int pageSize);//每页的数量
	
	public int total();//总用户数量 
	
	public void addUser(User user);
	
	public void delete(int id);
	
	public User get(int id);
	
	public void update(User user);
}
