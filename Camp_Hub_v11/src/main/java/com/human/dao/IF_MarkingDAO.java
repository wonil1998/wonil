package com.human.dao;

import java.util.HashMap;
import java.util.List;

import com.human.VO.CampVO;

public interface IF_MarkingDAO {
	public boolean markingChk(HashMap<Object, Object> hmap);

	public void markingInsert(HashMap<Object, Object> hmap);

	public void markingDelete(HashMap<Object, Object> hmap);

	public List<CampVO> markingList(String id);
	
}
