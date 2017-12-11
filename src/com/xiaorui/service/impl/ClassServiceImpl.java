package com.xiaorui.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaorui.mapper.ClassMapper;
import com.xiaorui.pojo.OneClass;
import com.xiaorui.service.ClassService;

@Service
public class ClassServiceImpl implements ClassService{
	
	@Autowired
	private ClassMapper classMapper;
	@Override
	public OneClass searchOneClass(int id) {
		// TODO Auto-generated method stub
		return classMapper.searchOneClass(id);
	}
	
}
