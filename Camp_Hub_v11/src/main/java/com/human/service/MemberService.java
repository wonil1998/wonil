package com.human.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.human.VO.MemberVO;
import com.human.dao.IF_MemberDAO;

@Service
public class MemberService implements IF_MemberService{
	@Inject
	private IF_MemberDAO memberdao;

	@Override
	public void memberInsert(MemberVO mvo) throws Exception {
		memberdao.memberInsert(mvo);
	}

	@Override
	   public int idCheck(String id) throws Exception {
	      return memberdao.idCheck(id);
	   }
	
	@Override
	public boolean memberPwCheck(String id, String pw) throws Exception {
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("id", id);
		hmap.put("pw", pw);
		if(memberdao.memberPwCheck(hmap)==0) {
			return false;
		}
		return true;
	}

	@Override
	public MemberVO loginChk(MemberVO mvo) throws Exception {
		return memberdao.loginChk(mvo);
	}

	@Override
	public void memberUpdate_nick_name(String id, String nick_name) throws Exception {
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("id", id);
		hmap.put("nick_name", nick_name);
		memberdao.memberUpdate_nick_name(hmap);
	}
	
	@Override
	public void memberUpdate_pw(String id, String pw) throws Exception {
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("id", id);
		hmap.put("pw", pw);
		memberdao.memberUpdate_pw(hmap);
	}
	
	@Override
	public int id_emailCheck(HashMap<String, String> hmap) throws Exception {
		return memberdao.id_emailCheck(hmap);
	}

	@Override
	public String findId(HashMap<String, String> hmap) throws Exception {
		return memberdao.findId(hmap);
	}
	
	@Override
	public int pw_emailCheck(HashMap<String, String> hmap) throws Exception {
		return memberdao.pw_emailCheck(hmap);
	}

	@Override
	public String findPw(HashMap<String, String> hmap) throws Exception {
		return memberdao.findPw(hmap);
	}
	
	@Override
	public void lovePlus(String nick_name) throws Exception {
		memberdao.lovePlus(nick_name);
		
	}

	@Override
	public void boardWritePoint(String nick_name) throws Exception {
		memberdao.boardWritePoint(nick_name);
	}

	@Override
	public void reviewWritePoint(String nick_name) throws Exception {
		memberdao.reviewWritePoint(nick_name);
	}

	@Override
	public void replyWritePoint(String nick_name) throws Exception {
		memberdao.replyWritePoint(nick_name);
	}

	@Override
	public MemberVO memberSelectOne(String id) throws Exception {
		return memberdao.memberSelectOne(id);
	}

	@Override
	public void delete_account(String id) throws Exception {
		memberdao.delete_account(id);
	}
	
	
	
}
