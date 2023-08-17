package com.human.dao;

import java.util.HashMap;

import com.human.VO.MemberVO;

public interface IF_MemberDAO {

	public void memberInsert(MemberVO mvo) throws Exception;

	public int idCheck(String id) throws Exception;
	
	public MemberVO loginChk(MemberVO mvo) throws Exception;

	public int memberPwCheck(HashMap<String, String> hmap) throws Exception;
	
	public  void memberUpdate_nick_name(HashMap<String, String> hmap) throws Exception;
	
	public  void memberUpdate_pw(HashMap<String, String> hmap) throws Exception; 
	
	///////////////////////////////////////////////////////////////
	public int id_emailCheck(HashMap<String,String> hmap) throws Exception;
	
	public String findId(HashMap<String,String> hmap) throws Exception;
	
	public int pw_emailCheck(HashMap<String,String> hmap) throws Exception;
	
	public String findPw(HashMap<String,String> hmap) throws Exception;
	
	public void lovePlus(String nick_name)throws Exception;
	
	public void boardWritePoint(String nick_name) throws Exception;
	
	public void reviewWritePoint(String nick_name) throws Exception;
	
	public void replyWritePoint(String nick_name) throws Exception;
	
	public MemberVO memberSelectOne(String id) throws Exception;
	
	public void delete_account(String id) throws Exception;
	
	
	
	
}
