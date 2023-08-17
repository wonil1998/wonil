package com.human.service;

import java.util.HashMap;
import java.util.List;

import com.human.VO.BoardVO;
import com.human.VO.FiledataVO;
import com.human.VO.NoticeVO;
import com.human.VO.ReplyVO;
import com.human.VO.ReviewVO;

public interface IF_BoardService {
	
	public void review_mod(ReviewVO rvo) throws Exception;
	public void review_del(int num) throws Exception;
	
	public List<BoardVO> boardSelectList(String b_type) throws Exception;
	public void boardInsertOne(BoardVO bvo) throws Exception;
	
	
	public BoardVO boardSelectOne(int b_num) throws Exception;
	public List<ReplyVO> replySelectList(int b_num) throws Exception;
	
	public ReplyVO replyInsert(ReplyVO rvo) throws Exception;
	
	
	public void boardUpdateViewCnt(int num) throws Exception;
	public int detailBoard_love(int num) throws Exception;
	public int reply_love(int num) throws Exception;
	public String reply_mod(ReplyVO rvo) throws Exception;
	public void reply_del(int num) throws Exception;
	
	
	public List<FiledataVO> fileSelectList(HashMap<String,Integer>hmap)throws Exception;
	public void filedataDelete(int num) throws Exception;
	public void fileInsert(BoardVO bvo) throws Exception;
	
	public List<NoticeVO> noticeSelectList() throws Exception;
	public void noticeInsertOne(NoticeVO nvo)throws Exception;
	public NoticeVO noticeSelectOne(int num)throws Exception;
	public void noticeUpdate(NoticeVO nvo) throws Exception;
	public void noticeDeleteOne(int num) throws Exception;

	public void boardUpdate(BoardVO bvo)throws Exception;
	public void boardDeleteOne(int num)throws Exception;
	
	public List<BoardVO> myboardSelectList(String id) throws Exception;
	public List<ReviewVO> myreviewSelectList(String id) throws Exception;
	public List<ReplyVO> myreplySelectList(String id) throws Exception;
	
}
