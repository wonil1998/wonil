package com.human.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.MemberVO;

@Repository
public class MemberDAO implements IF_MemberDAO{
	private static String mapperQuery="com.human.dao.IF_MemberDAO";
	@Inject 
	private SqlSession sqlSession;
	@Override
	public void memberInsert(MemberVO mvo) throws Exception {
	sqlSession.insert(mapperQuery+".memberInsert",mvo);
		
	}
	@Override
	   public int idCheck(String id) throws Exception {
	      return sqlSession.selectOne(mapperQuery + ".idCheck", id);
	   } 
	@Override
	public int memberPwCheck(HashMap<String, String> hmap) throws Exception {
		return sqlSession.selectOne(mapperQuery+".memberPwCheck",hmap);
	}
	
	@Override
	public MemberVO loginChk(MemberVO mvo) throws Exception {
		return sqlSession.selectOne(mapperQuery+".loginChk",mvo);
	}
	@Override
	public void memberUpdate_nick_name(HashMap<String, String> hmap) throws Exception {
		sqlSession.update(mapperQuery+".memberUpdate_nick_name", hmap);
	} 
	
	@Override
	public void memberUpdate_pw(HashMap<String, String> hmap) throws Exception {
		sqlSession.update(mapperQuery+".memberUpdate_pw", hmap);
	} 
	
	@Override
	public int id_emailCheck(HashMap<String, String> hmap) throws Exception {
		return sqlSession.selectOne(mapperQuery+".id_emailCheck",hmap);
	}
	@Override
	public String findId(HashMap<String, String> hmap) throws Exception {
		return sqlSession.selectOne(mapperQuery+".findId",hmap);
	} 
	@Override
	public int pw_emailCheck(HashMap<String, String> hmap) throws Exception {
		return sqlSession.selectOne(mapperQuery+".pw_emailCheck",hmap);
	}
	@Override
	public String findPw(HashMap<String, String> hmap) throws Exception {
		return sqlSession.selectOne(mapperQuery+".findPw",hmap);
	} 
	@Override
	public void lovePlus(String nick_name) throws Exception {
		sqlSession.update(mapperQuery+".lovePlus",nick_name);
		
	}
	@Override
	public void boardWritePoint(String nick_name) throws Exception {
		sqlSession.update(mapperQuery+".boardWritePoint", nick_name);
	}
	@Override
	public void reviewWritePoint(String nick_name) throws Exception {
		sqlSession.update(mapperQuery+".reviewWritePoint",nick_name);
	}
	@Override
	public void replyWritePoint(String nick_name) throws Exception {
		sqlSession.update(mapperQuery+".replyWritePoint",nick_name);
	}
	@Override
	public MemberVO memberSelectOne(String id) throws Exception {
		return sqlSession.selectOne(mapperQuery+".memberSelectOne", id);
	}
	@Override
	public void delete_account(String id) throws Exception {
		sqlSession.delete(mapperQuery+".delete_account", id);
	} 
	
	

	
}
