package com.human.dao;

import java.util.List;

import com.human.VO.ReplyVO;

public interface IF_ReplyDAO {

	public List<ReplyVO> replySelectList(int b_num) throws Exception;
	public void replyInsert(ReplyVO rvo) throws Exception;
	public ReplyVO replyInsertReturn(int num) throws Exception;
	public int replySelectSeq() throws Exception;
	public void reply_love(int num) throws Exception;
	public int reply_loveReturn(int num) throws Exception;
	public void reply_mod(ReplyVO rvo) throws Exception;
	public String reply_modReturn(int num) throws Exception;
	public void reply_del(int num) throws Exception;
	public List<ReplyVO> myreplySelectList(String id) throws Exception;

}
