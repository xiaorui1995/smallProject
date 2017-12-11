package com.xiaorui.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaorui.mapper.TestMapper;
import com.xiaorui.pojo.User;
import com.xiaorui.service.TestService;
@Service
public class TestServiceImpl implements TestService{
	@Autowired
	private TestMapper testMapper;
	@Override
	public void testInsert(List<Map<String, Object>> list) {
		// TODO Auto-generated method stub
		testMapper.testInsert(list);
	}
	@Override
	public List<Map<String, Object>> selectId(int i){
		return testMapper.selectId(i);
	}
}
