package com.human.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.NoticeVO;

@Repository
public class NoticeDAO implements IF_NoticeDAO{
	private static String mapperQuery="com.human.dao.IF_NoticeDAO";
	@Inject 
	private SqlSession sqlSession;
	@Override
	public List<NoticeVO> noticeSelectList() throws Exception{
		return sqlSession.selectList(mapperQuery+".noticeSelectList");
	}
	@Override
	public void noticeInsertOne(NoticeVO nvo) throws Exception{
		sqlSession.insert(mapperQuery+".noticeInsertOne", nvo);
	}
	@Override
	public void noticeCntUpdate(int num) throws Exception {
		sqlSession.update(mapperQuery+".noticeCntUpdate",num);
	}
	@Override
	public NoticeVO noticeSelectOne(int num) throws Exception {
		return sqlSession.selectOne(mapperQuery+".noticeSelectOne",num);
	}
	@Override
	public void noticeUpdate(NoticeVO nvo) throws Exception {
		sqlSession.update(mapperQuery+".noticeUpdate",nvo);
		
	}
	@Override
	public void noticeDeleteOne(int num) throws Exception {
		sqlSession.delete(mapperQuery+".noticeDeleteOne", num);		
	} 
	
	@Override
	public void camp_notice_save(NoticeVO nvo) throws Exception {
		sqlSession.insert(mapperQuery+".noticeInsertOne", nvo);
	} 
	@Override
	public NoticeVO campNoticeSelect(int c_num) throws Exception {
		return sqlSession.selectOne(mapperQuery+".campNoticeSelect", c_num);
	}
	@Override
	public void camp_notice_mod(NoticeVO nvo) throws Exception {
		sqlSession.update(mapperQuery+".camp_notice_mod", nvo);
	} 
}
