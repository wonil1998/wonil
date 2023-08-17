package com.human.util;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileDataUtil {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	@RequestMapping(value="/download",method=RequestMethod.GET)
	@ResponseBody 
	public  FileSystemResource download(@RequestParam("filename") String filename,
			HttpServletResponse re) throws Exception{
		File file=new File(uploadPath+"/"+filename); 
		re.setContentType("application/download); utf-8"); 
		re.setHeader("Content-Disposition", "attachment;filename="+filename	);
		return new FileSystemResource(file); 
	}

	public String[] fileUpload(MultipartFile[] file) throws Exception{
		String []saveName=new String[file.length]; 
		for(int i=0;i<file.length;i++) {
			if(file[i].getOriginalFilename()!="") {
				String orName=file[i].getOriginalFilename();
				UUID uid = UUID.randomUUID(); 
				saveName[i]=uid.toString()+"."+orName.split("\\.")[1]; 
				byte[] fileData = file[i].getBytes(); 
				File target = new File(uploadPath, saveName[i]); 
				FileCopyUtils.copy(fileData, target); 
			}
		}
		return saveName;
	}
	
	public void fileDeleteOne(String filename) {
		File folder = new File(uploadPath);
		try {
			File[] fileList=folder.listFiles();
			for(int i=0;i<fileList.length;i++) {
				String str = fileList[i].toString().split("\\\\")[2];
				if(filename.equals(str)) {
					fileList[i].delete();
				}
				
			}
			
		}catch(Exception e) {
			e.getStackTrace();
		}
	}
	
	
}
