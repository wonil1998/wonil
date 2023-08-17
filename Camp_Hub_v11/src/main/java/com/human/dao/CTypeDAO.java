package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.CTypeVO;

@Repository
public class CTypeDAO implements IF_CTypeDAO{
	private static String mapperQuery="com.human.dao.IF_CTypeDAO";
	@Inject 
	private SqlSession sqlSession; 
	@Override
	public void camp_type_save(CTypeVO ctvo) throws Exception {
		sqlSession.insert(mapperQuery+".camp_type_save", ctvo);
	} 
	@Override
	public List<CTypeVO> camp_type_check(int c_num) throws Exception {
		return sqlSession.selectList(mapperQuery+".camp_type_check", c_num);
	}
	@Override
	public void camp_type_mod(int c_num) throws Exception {
		sqlSession.delete(mapperQuery+".camp_type_mod",c_num);
	} 
}
