package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.BoardVO;

@Repository
public class BoardDAO implements IF_BoardDAO{
	private static String mapperQuery="com.human.dao.IF_BoardDAO";
	@Inject 
	private SqlSession sqlSession;
	@Override
	public List<BoardVO> boardSelectList(String b_type) throws Exception {
		return sqlSession.selectList(mapperQuery+".boardSelectList", b_type);
		
	} 
	@Override
	public void boardInsertOne(BoardVO bvo) throws Exception {
		sqlSession.insert(mapperQuery+".boardInsertOne",bvo);
	}
	@Override
	public int board_seq() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".board_seq_num");
	}
	@Override
	public BoardVO boardSelectOne(int num) throws Exception {
		return sqlSession.selectOne(mapperQuery+".boardSelectOne",num);
	}
	@Override
	public void boardUpdateViewCnt(int num) throws Exception {
		sqlSession.update(mapperQuery+".boardUpdateViewCnt",num);
	}
	@Override
	public void detailBoard_love(int num) throws Exception {
		sqlSession.update(mapperQuery+".detailBoard_love",num);
	}
	@Override
	public int detailBoard_love_return(int num) throws Exception {
		return sqlSession.selectOne(mapperQuery+".detailBoard_love_return",num);
	}
	@Override
	public void boardDeleteOne(int num) throws Exception {
		sqlSession.delete(mapperQuery+".boardDeleteOne",num);
		
	}
	@Override
	public void boardUpdate(BoardVO bvo) throws Exception {
		sqlSession.update(mapperQuery+".boardUpdate",bvo);
	}
	@Override
	public List<BoardVO> myboardSelectList(String id) throws Exception{
		return sqlSession.selectList(mapperQuery + ".myboardSelectList", id);
	}
	
	


}
