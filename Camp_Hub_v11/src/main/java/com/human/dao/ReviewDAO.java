package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.ReviewVO;

@Repository
public class ReviewDAO implements IF_ReviewDAO{
	private static String mapperQuery="com.human.dao.IF_ReviewDAO";
	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public void review_mod(ReviewVO rvo) throws Exception {
		sqlSession.update(mapperQuery+".review_mod", rvo);
	}
	
	@Override
	public void review_del(int num) throws Exception {
		sqlSession.delete(mapperQuery+".review_del",num);
	}
	
	@Override
	public List<ReviewVO> myreviewSelectList(String id) {
		return sqlSession.selectList(mapperQuery+".myreviewSelectList", id);
	}
	@Override
	public List<ReviewVO> reviewSelectList(int num) {
		return sqlSession.selectList(mapperQuery+".reviewSelectList", num);
	}
	@Override
	public void reviewInsert(ReviewVO rvo) {
		 sqlSession.insert(mapperQuery+".reviewInsert", rvo);
	}
		
	@Override
	public int reviewSelectSeq() {
		return sqlSession.selectOne(mapperQuery+".reviewSelectSeq");
	}
	@Override
	public ReviewVO reviewInsertReturn(int num) {
		return sqlSession.selectOne(mapperQuery+".reviewInsertReturn", num);
	}
	
	
	
}
