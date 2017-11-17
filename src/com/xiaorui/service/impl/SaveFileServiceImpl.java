package com.xiaorui.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaorui.mapper.SaveFileMapper;
import com.xiaorui.service.SaveFileService;
@Service
public class SaveFileServiceImpl implements SaveFileService{
	@Autowired
	private SaveFileMapper saveFileMapper;
	@Override
	public void saveFile(String fileName) {
		saveFileMapper.saveFile(fileName);
	}
}
