package com.xiaorui.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xiaorui.service.SaveFileService;

@Controller
public class uploadFileController {
	@Autowired
	private SaveFileService saveFileService;
	@RequestMapping(value="uploadFile")
	public String uploadFile(@RequestParam(value="file",required = false) MultipartFile file,HttpServletRequest request,Model model){
		
		System.out.println("开始");
		String path = request.getSession().getServletContext().getRealPath("upload");
		String fileName = file.getOriginalFilename();
		System.out.println("path:"+path);
		System.out.println("fileName:"+fileName);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();//建立多级文件夹  mkdir建立一级文件夹
		}
		 //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        //model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName); 
        String fileUrl = "upload/"+fileName;
        
        saveFileService.saveFile(fileUrl);//把上传的图片路径保存到数据库中
        
        model.addAttribute("fileUrl", fileUrl);
        return "upload/uploadFile";  
	}
	
}
