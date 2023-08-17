package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.CTypeNameVO;

@Repository
public class CTypeNameDAO implements IF_CTypeNameDAO {
	private static String mapperQuery="com.human.dao.IF_CTypeNameDAO";
	@Inject 
	private SqlSession sqlSession;

	@Override
	public List<CTypeNameVO> checkType() throws Exception {
		return sqlSession.selectList(mapperQuery+".checkType");
	}
	
}
