package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.ReplyVO;

@Repository
public class ReplyDAO implements IF_ReplyDAO{
	private static String mapperQuery="com.human.dao.IF_ReplyDAO";
	@Inject 
	private SqlSession sqlSession;
	@Override
	public List<ReplyVO> replySelectList(int b_num) throws Exception {
		return sqlSession.selectList(mapperQuery+".replySelectList",b_num);
	}
	@Override
	public void replyInsert(ReplyVO rvo) throws Exception {
		sqlSession.insert(mapperQuery+".replyInsert", rvo);
	}
	@Override
	public ReplyVO replyInsertReturn(int num) throws Exception {
		return sqlSession.selectOne(mapperQuery+".replyInsertReturn", num);
	}
	@Override
	public int replySelectSeq() throws Exception {
		return sqlSession.selectOne(mapperQuery+".replySelectSeq");
	}
	@Override
	public void reply_love(int num) throws Exception {
		sqlSession.update(mapperQuery+".reply_love",num);
	}
	@Override
	public int reply_loveReturn(int num) throws Exception {
		return sqlSession.selectOne(mapperQuery+".reply_loveReturn",num);
	}
	@Override
	public void reply_mod(ReplyVO rvo) throws Exception {
		sqlSession.update(mapperQuery+".reply_mod", rvo);
	}
	@Override
	public String reply_modReturn(int num) throws Exception {
		return sqlSession.selectOne(mapperQuery+".reply_modReturn",num);
	}
	@Override
	public void reply_del(int num) throws Exception {
		sqlSession.delete(mapperQuery+".reply_del",num);
	}
	@Override
	public List<ReplyVO> myreplySelectList(String id) throws Exception {
		return sqlSession.selectList(mapperQuery+".myreplySelectList", id);
	}
	
}
