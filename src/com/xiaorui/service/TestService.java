package com.xiaorui.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xiaorui.pojo.User;

public interface TestService {
	public void testInsert(List<Map<String, Object>> list);
	
	public List<Map<String, Object>> selectId(int i);
}
