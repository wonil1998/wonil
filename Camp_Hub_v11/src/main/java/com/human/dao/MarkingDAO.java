package com.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.CampVO;

@Repository
public class MarkingDAO implements IF_MarkingDAO{
	private static String mapperQuery="com.human.dao.IF_MarkingDAO";
	@Inject 
	private SqlSession sqlSession; 
	
	@Override
	public boolean markingChk(HashMap<Object, Object> hmap) {
		int a = sqlSession.selectOne(mapperQuery+".markingChk", hmap);
		
		if(a!=0) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public void markingInsert(HashMap<Object, Object> hmap) {
		sqlSession.insert(mapperQuery+".markingInsert", hmap);
		
	}

	@Override
	public void markingDelete(HashMap<Object, Object> hmap) {
		sqlSession.delete(mapperQuery+".markingDelete", hmap);
	}

	@Override
	public List<CampVO> markingList(String id) {
		return sqlSession.selectList(mapperQuery+".markingList", id);
	}
	

}
