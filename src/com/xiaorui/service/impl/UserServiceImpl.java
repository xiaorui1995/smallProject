package com.xiaorui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaorui.mapper.UserMapper;
import com.xiaorui.pojo.User;
import com.xiaorui.service.UserService;
import com.xiaorui.util.PageBean;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User selectUser(User user) {

		return userMapper.selectUser(user);
	}
	@Override
	public PageBean<User> findUserByPage(int pageNum, int pageSize) {
		int totalRecord = userMapper.total();
		PageBean<User> pbBean = new PageBean<User>(pageNum, pageSize, totalRecord);
		int startIndex = pbBean.getStartIndex();
		List<User> userList = userMapper.list(startIndex,pageSize);
		pbBean.setList(userList);
		
		return pbBean;
	}
	@Override
	public int total() {

		int total = userMapper.total();
		return total;
	}
}
