package com.human.dao;

import java.util.HashMap;
import java.util.List;

import com.human.VO.CampVO;

public interface IF_CampDAO {

	public List<CampVO> campSelectList() throws Exception;

	public List<CampVO> campSearchList(HashMap<String, String> hmap) throws Exception;

	public int camp_site_seq() throws Exception;

	public void camp_site_save(CampVO cvo) throws Exception;

	public CampVO campSelectOne(int num);

	public List<CampVO> campSearchByType(HashMap<Object, Object> hmap);

	public List<CampVO> mycampList(String id);

	public void campsiteStar(int c_num) throws Exception;

	public void camp_mod(CampVO cvo) throws Exception;
	
	public void camp_del(int num) throws Exception;
}
