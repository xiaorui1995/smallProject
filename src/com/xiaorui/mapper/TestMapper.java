package com.xiaorui.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xiaorui.pojo.User;

public interface TestMapper {
	public void testInsert(List<Map<String, Object>> list);
	
	public List<Map<String, Object>> selectId(int i);
}
