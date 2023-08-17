package com.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.CampVO;

@Repository
public class CampDAO implements IF_CampDAO {
	private static String mapperQuery = "com.human.dao.IF_CampDAO";
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<CampVO> campSelectList() throws Exception {
		return sqlSession.selectList(mapperQuery + ".campSelectList");
	}

	@Override
	public List<CampVO> campSearchList(HashMap<String, String> hmap) throws Exception {
		return sqlSession.selectList(mapperQuery + ".campSearchList", hmap);
	}

	@Override
	public CampVO campSelectOne(int num) {
		return sqlSession.selectOne(mapperQuery + ".campSelectOne", num);
	}

	@Override
	public int camp_site_seq() throws Exception {
		return sqlSession.selectOne(mapperQuery + ".camp_site_seq");
	}

	@Override
	public void camp_site_save(CampVO cvo) throws Exception {
		sqlSession.insert(mapperQuery + ".camp_site_save", cvo);
	}

	@Override
	public List<CampVO> campSearchByType(HashMap<Object, Object> hmap) {
		return sqlSession.selectList(mapperQuery + ".campSearchByType", hmap);
	}

	@Override
	public List<CampVO> mycampList(String id) {
		return sqlSession.selectList(mapperQuery + ".mycampList", id);
	}

	@Override
	public void campsiteStar(int c_num) throws Exception {
		sqlSession.update(mapperQuery + ".campsiteStar", c_num);
	}
	
	@Override
	public void camp_mod(CampVO cvo) throws Exception {
		sqlSession.update(mapperQuery+".camp_mod",cvo);
	}
	@Override
	public void camp_del(int num) throws Exception {
		sqlSession.delete(mapperQuery+".camp_del", num);
	}
}
