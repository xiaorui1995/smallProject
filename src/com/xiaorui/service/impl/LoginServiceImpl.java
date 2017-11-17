package com.xiaorui.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaorui.mapper.UserMapper;
import com.xiaorui.pojo.User;
import com.xiaorui.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 用户注册
	 */
	public Map<String,Object> register(User user){
		User resultUser = userMapper.selectUser(user);
		System.out.println(resultUser);
		Map<String, Object> result = new HashMap<String,Object>();
		if (resultUser == null) {
			userMapper.addUser(user); 
			result.put("retcode", "0");
			result.put("retmsg", "注册成功");
		}else{
			result.put("retcode", "1");
			result.put("retmsg", "用户名已存在，请重新输入");
		}
		return result;
	}
}
