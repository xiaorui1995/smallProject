package com.xiaorui.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
/*
 * 公共方法输出json数据到前台
 */
public class ObjectToJson{
	public static void writeToJson(Object object,HttpServletResponse response){
		String resultJson = null;
		if (object instanceof List) {			
			resultJson = JSONArray.toJSON(object).toString();		
		}else{
			resultJson = JSONObject.toJSON(object).toString();
		}
		try {
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(resultJson);
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
