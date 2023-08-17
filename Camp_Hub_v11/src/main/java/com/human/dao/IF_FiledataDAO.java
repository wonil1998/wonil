package com.human.dao;

import java.util.HashMap;
import java.util.List;

import com.human.VO.FiledataVO;

public interface IF_FiledataDAO {
	public void fileInsert(HashMap<Object,Object>hmap) throws Exception;
	public List<FiledataVO> fileSelectList(HashMap<String,Integer>hmap) throws Exception;
	public List<FiledataVO> fileList()throws Exception;
	public void filedataDelete(int num) throws Exception;
	
	public List<FiledataVO> campFileList(int c_num) throws Exception;
	
	public void camp_file_mod(int c_num) throws Exception;
	public void camp_roomfile_mod(int c_num) throws Exception;
}
